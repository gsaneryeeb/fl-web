package cn.mk.ndms.modules.lease.service.impl;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.CallNo;
import cn.mk.ndms.domain.LeaseNo;
import cn.mk.ndms.domain.OutNo;
import cn.mk.ndms.modules.lease.repository.LeaseNoRepository;
import cn.mk.ndms.modules.lease.service.LeaseNoService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.Constants.serviceType;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class LeaseNoServiceImpl extends GenericServiceImpl<LeaseNo, String> implements LeaseNoService{

	@Autowired
	private LeaseNoRepository leaseNoRepository;
	
	@Override
	public String updateMaxNo(String uId, String date) {
		// TODO Auto-generated method stub
		String yearDay=DateTool.yearDayFormat(new Date());
		String maxId=leaseNoRepository.findMaxByType(yearDay);
		if(StringUtils.isEmpty(maxId)){
			maxId=yearDay+Constants.NUMBER_000;
		}
		String id=String.valueOf((Long.parseLong(maxId)+1));
		LeaseNo re=new LeaseNo();
		re.setId(id);
		re.setNo(id);
		re.setCdate(date);
		re.setUserId(uId);
		leaseNoRepository.save(re);
		return id;
	}
}

package cn.mk.ndms.modules.sys.service.impl;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.AdjustNo;
import cn.mk.ndms.modules.sys.repository.AdjustNoRepository;
import cn.mk.ndms.modules.sys.service.AdjustNoService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class AdjustNoServiceImpl extends GenericServiceImpl<AdjustNo, String> implements AdjustNoService{

	@Autowired
	private AdjustNoRepository adjustNoRepository;

	@Override
	public String updateMaxNo(serviceType type,String uId,String date,String preFix) {
		// TODO Auto-generated method stub
		String yearDay=DateTool.yearDayFormat(new Date());
		String maxId=adjustNoRepository.findMaxByType(preFix+yearDay);
		if(StringUtils.isEmpty(maxId)){
			maxId=yearDay+Constants.NUMBER_000;
		}else{
			maxId=maxId.substring(1);
		}
		String id=preFix+String.valueOf((Long.parseLong(maxId)+1));
		AdjustNo re=new AdjustNo();
		re.setNo(id);
		re.setType(type.toString());
		re.setCdate(date);
		re.setUserId(uId);
		adjustNoRepository.save(re);
		return id;
	}
	
	
	 
	
}

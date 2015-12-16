package cn.mk.ndms.modules.sys.service.impl;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.InNo;
import cn.mk.ndms.modules.sys.repository.InNoRepository;
import cn.mk.ndms.modules.sys.service.InNoService;
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
public class InNoServiceImpl extends GenericServiceImpl<InNo, String> implements InNoService{

	@Autowired
	private InNoRepository inNoRepository;

	@Override
	public String updateMaxNo(serviceType type,String uId,String date,String preFix) {
		// TODO Auto-generated method stub
		String yearDay=DateTool.yearDayFormat(new Date());
//		String maxId=inNoRepository.findMaxByType(preFix+yearDay);
		String maxId=inNoRepository.findMaxByType(yearDay);
		
		if(StringUtils.isEmpty(maxId)){
			maxId=yearDay+Constants.NUMBER_000;
		}
//		else{
//			maxId=maxId.substring(1);
//		}
//		String id=preFix+String.valueOf((Long.parseLong(maxId)+1));
		String id=String.valueOf((Long.parseLong(maxId)+1));
		InNo re=new InNo();
		re.setId(id);
		re.setNo(id);
		re.setType(type.toString());
		re.setCdate(date);
		re.setUserId(uId);
		inNoRepository.save(re);
		return id;
	}
	
	
	 
	
}

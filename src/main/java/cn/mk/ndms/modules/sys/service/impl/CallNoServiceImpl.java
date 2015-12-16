package cn.mk.ndms.modules.sys.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.CallNo;
import cn.mk.ndms.modules.sys.repository.CallNoRepository;
import cn.mk.ndms.modules.sys.service.CallNoService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class CallNoServiceImpl extends GenericServiceImpl<CallNo, String> implements CallNoService{

	@Autowired
	private CallNoRepository callNoRepository;

	@Override
	public String updateMaxNo(serviceType type, String uId, String date) {
		// TODO Auto-generated method stub
		String preFix=Constants.CALL_NO_PRI_FIX;
		String maxId=callNoRepository.findMaxByType(preFix);
		if(StringUtils.isEmpty(maxId)){
			maxId=Constants.NUMBER_0000;
		}else{
			maxId=maxId.substring(3);
		}
		maxId=String.valueOf(Long.parseLong(maxId)+1);
		switch(maxId.length()){
			case 1:maxId=Constants.NUMBER_0000+maxId;break;
			case 2:maxId=Constants.NUMBER_000+maxId;break;
			case 3:maxId=Constants.NUMBER_00+maxId;break;
			case 4:maxId=Constants.NUMBER_0+maxId;break;
		}
		String id=String.valueOf(preFix+maxId);
		CallNo re=new CallNo();
		re.setId(id);
		re.setCallno(id);
		re.setType(type.toString());
		re.setCdate(date);
		re.setUserId(uId);
		callNoRepository.save(re);
		return id;
	}

	@Override
	public String updateMaxNoByDoor(serviceType type, String uId, String date) {
		// TODO Auto-generated method stub
		String preFix=Constants.CALL_NO_BY_DOOR_PRI_FIX;
		String maxId=callNoRepository.findMaxByType(preFix);
		if(StringUtils.isEmpty(maxId)){
			maxId=Constants.NUMBER_0000;
		}else{
			maxId=maxId.substring(3);
		}
		maxId=String.valueOf(Long.parseLong(maxId)+1);
		switch(maxId.length()){
			case 1:maxId=Constants.NUMBER_0000+maxId;break;
			case 2:maxId=Constants.NUMBER_000+maxId;break;
			case 3:maxId=Constants.NUMBER_00+maxId;break;
			case 4:maxId=Constants.NUMBER_0+maxId;break;
		}
		String id=String.valueOf(preFix+maxId);
		CallNo re=new CallNo();
		re.setId(id);
		re.setCallno(id);
		re.setType(type.toString());
		re.setCdate(date);
		re.setUserId(uId);
		callNoRepository.save(re);
		return id;
	}
}

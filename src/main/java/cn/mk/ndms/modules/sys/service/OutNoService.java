package cn.mk.ndms.modules.sys.service;

import cn.mk.ndms.domain.OutNo;
import cn.mk.ndms.util.Constants.serviceType;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface OutNoService extends GenericService<OutNo, String>{
	
	public String updateMaxNo(serviceType type,String uId,String date,String preFix);
}

package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Auth;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface AuthService extends GenericService<Auth, String>{
	
	public Auth getOne(String id);
	
	public List<Auth> findByIds(List<String> ids);
}

package cn.mk.ndms.modules.sys.service;

import java.util.List;
import java.util.Map;

import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.domain.User;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface UserService extends GenericService<User, String>{
	
	public User getOne(String id);
	
	public User findByUserNameAndUPass(String userName,String password);
	
	public Map<String,Resource> findResourceByUserName(String userName);
	
	public List<User> findByStatusAndRole(Short status,String role);
	
}

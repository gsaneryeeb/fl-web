package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.User;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface UserRepository extends GenericRepository<User, String>{

	@Query("from User u where u.flag=1 and u.userName=?1 and u.uPass=?2")
	public User findByUserNameAndUPass(String userName,String password);
	
	@Query("from User u where u.flag=1 and u.userName=?1")
	public User findByUserName(String userName);
	
//	@Query("from User u where u.flag=?1 and u.role.ename=?2")
//	public List<User> findByStatusAndRole(Short status,String role);
	
	@Query("from User u where u.flag=?1")
	public List<User> findByStatusAndRole(Short status);
}

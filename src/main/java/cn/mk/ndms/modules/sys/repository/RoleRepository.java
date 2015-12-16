package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Role;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface RoleRepository extends GenericRepository<Role, String>{

	@Query("from Role r where r.availability=1")
	public List<Role> findAllByStatus();
	
	@Query("from Role r where r.availability=1 and r.ename=?1")
	public List<Role> findByEname(String role);
	
}

package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.mk.ndms.domain.ProjectRUser;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface ProjectRUserRepository extends GenericRepository<ProjectRUser, String>{

	
	@Query("from ProjectRUser p where p.userIdFk=?1")
	public List<ProjectRUser> findByUserId(String id);
	
//	@Query("from ProjectRUser p where p.projectIdFk in (:pids) and p.user.flag=1 and p.user.role.ename=:rEname")
//	public List<ProjectRUser> findByProjectIdsAndRole(@Param(value="pids") List<String> pids,@Param(value="rEname") String rEname);
	
	@Query("from ProjectRUser p where p.projectIdFk in (:pids) and p.user.flag=1")
	public List<ProjectRUser> findByProjectIdsAndRole(@Param(value="pids") List<String> pids);
}

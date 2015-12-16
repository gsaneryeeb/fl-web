package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Resource;

import com.springframework.base.repository.GenericRepository;

public interface ResourceRepository extends GenericRepository<Resource, String> {
	
	@Query("select a from Resource a where a.flag=1 and a.superior is null order by a.superior,a.sort")
	public List<Resource> findAllSupior();
	
	@Query("select a from Resource a where a.id!=?1 and a.flag=1 and a.superior is null order by a.superior,a.sort")
	public List<Resource> findAllSupiorAndNotId(String id);
	
	@Query("select a from Resource a where a.id in (?1)")
	public List<Resource> findByIds(List<String> ids);
	
	@Query("select a from Resource a where a.id in (select b.resourceId from AuthNmTsResource b where b.authId=?1) order by a.superior,a.sort")//a.superior is null and 
	public List<Resource> findByRoleIds(String authId);
}

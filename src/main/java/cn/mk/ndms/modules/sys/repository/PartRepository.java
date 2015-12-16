package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.mk.ndms.domain.Part;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface PartRepository extends GenericRepository<Part, String>{

	@Query("from Part p where p.flag=1")
	public List<Part> findAllByStatus();
	
	@Query("from Part p where p.flag=1 and p.no=?1")
	public List<Part> findAllByParts(String parts);
	
	@Query("from Part p where p.flag=1 and p.no in (:frus)")
	public List<Part> findAllByFru(@Param("frus") List<String> frus);
	
	@Query("from Part p where p.flag=1 and p.no=?1")
	public List<Part> findByPart(String part);
}

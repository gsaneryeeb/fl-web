package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.mk.ndms.domain.Station;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface StationRepository extends GenericRepository<Station, String>{

	@Query("from Station s where s.flag=1 and s.projectIdFk in (:ids)")
	public List<Station> findAllByStatusAndProjectIds(@Param(value="ids") List<String> pIds);
	
	@Query("from Station s where s.flag=1 and s.projectIdFk=?1")
	public List<Station> findByProjectId(String pId);
}

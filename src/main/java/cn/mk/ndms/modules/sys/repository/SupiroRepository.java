package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Supiro;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface SupiroRepository extends GenericRepository<Supiro, String>{

	@Query("from Supiro s where s.flag=?1")
	public List<Supiro> findByStatus(Short flag);
}

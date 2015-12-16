package cn.mk.ndms.modules.part.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Dynamic;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface DynamicRepository extends GenericRepository<Dynamic, String>{

	@Query("from Dynamic d where d.years=?1 and d.months=?2 and d.days=?3")
	public List<Dynamic> findByDate(String year,String month,String day);
}
package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Evaluation;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface EvaluationRepository extends GenericRepository<Evaluation, String>{

	@Query("from Evaluation e where e.flag=1")
	public List<Evaluation> getAll();
}

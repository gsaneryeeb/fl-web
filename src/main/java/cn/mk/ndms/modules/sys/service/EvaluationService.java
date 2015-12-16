package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Evaluation;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface EvaluationService extends GenericService<Evaluation, String>{
	
	public List<Evaluation> getAll();
}

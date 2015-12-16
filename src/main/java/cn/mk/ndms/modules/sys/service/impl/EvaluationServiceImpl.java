package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Evaluation;
import cn.mk.ndms.modules.sys.repository.EvaluationRepository;
import cn.mk.ndms.modules.sys.service.EvaluationService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class EvaluationServiceImpl extends GenericServiceImpl<Evaluation, String> implements EvaluationService{

	@Autowired
	private EvaluationRepository evaluationRepository;

	@Override
	public List<Evaluation> getAll() {
		// TODO Auto-generated method stub
		return evaluationRepository.getAll();
	}
	
	
	 
	
}

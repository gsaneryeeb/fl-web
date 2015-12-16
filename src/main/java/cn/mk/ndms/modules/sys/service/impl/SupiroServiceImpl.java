package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Supiro;
import cn.mk.ndms.modules.sys.repository.SupiroRepository;
import cn.mk.ndms.modules.sys.service.SupiroService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class SupiroServiceImpl extends GenericServiceImpl<Supiro, String> implements SupiroService{

	@Autowired
	private SupiroRepository supiroRepository;

	@Override
	public List<Supiro> findByStatus(Short flag) {
		// TODO Auto-generated method stub
		return supiroRepository.findByStatus(flag);
	}
	
	
	 
	
}

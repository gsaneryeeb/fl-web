package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Wac;
import cn.mk.ndms.modules.sys.repository.WacRepository;
import cn.mk.ndms.modules.sys.service.WacService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class WacServiceImpl extends GenericServiceImpl<Wac, String> implements WacService{

	@Autowired
	private WacRepository wacRepository;

	@Override
	public Wac findByPartId(String partId) {
		// TODO Auto-generated method stub
		return wacRepository.findByPartId(partId);
	}

	@Override
	public List<Wac> findAllByStatus(Short status) {
		// TODO Auto-generated method stub
		return wacRepository.findAllByStatus(status);
	}

	@Override
	public void updateBatch(List<Wac> list) {
		// TODO Auto-generated method stub
		wacRepository.save(list);
	}


	
	 
	
}

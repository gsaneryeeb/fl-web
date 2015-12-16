package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.modules.sys.repository.PartRepository;
import cn.mk.ndms.modules.sys.service.PartService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class PartServiceImpl extends GenericServiceImpl<Part, String> implements PartService{

	@Autowired
	private PartRepository partRepository;

	@Override
	public List<Part> findAllByStatus() {
		// TODO Auto-generated method stub
		return partRepository.findAllByStatus();
	}

	@Override
	public Part findAllByParts(String parts) {
		// TODO Auto-generated method stub
		List<Part> pList=partRepository.findAllByParts(parts);
		if(pList!=null && !pList.isEmpty()){
			return pList.get(0);
		}else{
			return null;
		}
	}

	@Override
	public List<Part> findAllByFru(List<String> frus) {
		// TODO Auto-generated method stub
		return partRepository.findAllByFru(frus);
	}

	@Override
	public void updateBatch(List<Part> list) {
		// TODO Auto-generated method stub
		partRepository.save(list);
	}

	@Override
	public List<Part> findByPart(String part) {
		// TODO Auto-generated method stub
		return partRepository.findByPart(part);
	}
	
	
	 
	
}

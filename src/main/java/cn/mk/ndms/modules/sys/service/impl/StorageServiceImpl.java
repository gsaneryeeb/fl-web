package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.modules.sys.repository.StorageRepository;
import cn.mk.ndms.modules.sys.service.StorageService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class StorageServiceImpl extends GenericServiceImpl<Storage, String> implements StorageService{

	@Autowired
	private StorageRepository storageRepository;

	@Override
	public List<Storage> findByPartId(String partId) {
		// TODO Auto-generated method stub
		return storageRepository.findByPartId(partId);
	}

	@Override
	public List<Storage> findByYesterDayAndStatus(String start, String end,
			String status) {
		// TODO Auto-generated method stub
		return storageRepository.findByYesterDayAndStatus(start, end, status);
	}

	@Override
	public List<Storage> findByIds(List<String> ids) {
		// TODO Auto-generated method stub
		return storageRepository.findByIds(ids);
	}

	
	
	 
	
}

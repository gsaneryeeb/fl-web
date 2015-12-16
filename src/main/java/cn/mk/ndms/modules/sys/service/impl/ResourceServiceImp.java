package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.modules.sys.repository.ResourceRepository;
import cn.mk.ndms.modules.sys.service.ResourceService;

import com.springframework.base.service.GenericServiceImpl;

@Service
public class ResourceServiceImp extends GenericServiceImpl<Resource, String>
		implements ResourceService {
	@Autowired
	ResourceRepository resourceRepository;

	

	@Override
	public Page<Resource> findByPage(PageRequest pageRequest) {
		// TODO Auto-generated method stub
		return resourceRepository.findAll(pageRequest);
	}


	@Override
	public List<Resource> findAllSupiorAndNotId(String id) {
		// TODO Auto-generated method stub
		return resourceRepository.findAllSupiorAndNotId(id);
	}

	@Override
	public List<Resource> findByIds(List<String> ids) {
		// TODO Auto-generated method stub
		return resourceRepository.findByIds(ids);
	}

	@Override
	public List<Resource> findByRoleIds(String id) {
		// TODO Auto-generated method stub
		return resourceRepository.findByRoleIds(id);
	}

	@Override
	public List<Resource> findAllSupior() {
		// TODO Auto-generated method stub
		List<Resource> rs=resourceRepository.findAllSupior();
		for(Resource r:rs){
			r.getResourceses();
		}
		return rs;
	}

}

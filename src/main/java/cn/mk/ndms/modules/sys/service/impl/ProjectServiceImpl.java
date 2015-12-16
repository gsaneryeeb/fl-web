package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Project;
import cn.mk.ndms.modules.sys.repository.ProjectRepository;
import cn.mk.ndms.modules.sys.service.ProjectService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class ProjectServiceImpl extends GenericServiceImpl<Project, String> implements ProjectService{

	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public List<Project> findAllByStatus() {
		// TODO Auto-generated method stub
		return projectRepository.findAllByStatus();
	}

	@Override
	public List<Project> findByIds(List<String> ids) {
		// TODO Auto-generated method stub
		return projectRepository.findByIds(ids);
	}

	@Override
	public List<Project> findAllByStatusAndTypeId(String typeId) {
		// TODO Auto-generated method stub
		return projectRepository.findAllByStatusAndTypeId(typeId);
	}
	
	
	 
	
}

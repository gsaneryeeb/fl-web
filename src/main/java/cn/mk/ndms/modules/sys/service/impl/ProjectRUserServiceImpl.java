package cn.mk.ndms.modules.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.ProjectRUser;
import cn.mk.ndms.modules.sys.repository.ProjectRUserRepository;
import cn.mk.ndms.modules.sys.repository.RoleRepository;
import cn.mk.ndms.modules.sys.service.ProjectRUserService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class ProjectRUserServiceImpl extends GenericServiceImpl<ProjectRUser, String> implements ProjectRUserService{

	@Autowired
	private ProjectRUserRepository projectRUserRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public List<ProjectRUser> findByUserId(String id) {
		// TODO Auto-generated method stub
		return projectRUserRepository.findByUserId(id);
	}

	@Override
	public void deleteAll(List<ProjectRUser> list) {
		// TODO Auto-generated method stub
		if(list!=null && !list.isEmpty()){
			for(ProjectRUser r:list){
				projectRUserRepository.delete(r.getId());
			}
		}
	}

	@Override
	public List<ProjectRUser> findByProjectIdsAndRole(List<String> pids) {
		// TODO Auto-generated method stub
		String ename=Constants.ROLE_ENGINEER;
		List<ProjectRUser> pUser=projectRUserRepository.findByProjectIdsAndRole(pids);
		List<ProjectRUser> projectRUserList=new ArrayList<ProjectRUser>();
		if(pUser!=null && !pUser.isEmpty()){
			for(ProjectRUser p:pUser){
				String roles=p.getUser().getRoleIdFk();
				if(roles!=null && roles.length()>0){
					String[] rs=roles.split(",");
					for(String r:rs){
						if(ename.equals(roleRepository.findOne(r).getEname())){
							projectRUserList.add(p);
							break;
						}
					}
				}
			}
		}
		return projectRUserList;
	}
	
	
	 
	
}

package cn.mk.ndms.modules.sys.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Auth;
import cn.mk.ndms.domain.AuthNmTsResource;
import cn.mk.ndms.domain.ProjectRUser;
import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.RoleNmTsAuth;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.repository.RoleRepository;
import cn.mk.ndms.modules.sys.repository.UserRepository;
import cn.mk.ndms.modules.sys.service.UserService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User, String> implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public User getOne(String id) {
		// TODO Auto-generated method stub
		User user=userRepository.findOne(id);
		user.getProjectRUser();
		return user;
	}

	@Override
	public User findByUserNameAndUPass(String userName, String password) {
		// TODO Auto-generated method stub
		User user=userRepository.findByUserNameAndUPass(userName, password);
		Set<ProjectRUser> p=user.getProjectRUser();
		for(ProjectRUser _p:p){
			_p.getProject();
		}
		return user;
	}

	@Override
	public Map<String,Resource> findResourceByUserName(String userName) {
		// TODO Auto-generated method stub
		Map<String,Resource> rIds=new TreeMap<String,Resource>();
		User user=userRepository.findByUserName(userName);
		String roleIds=user.getRoleIdFk();
		String[] strRoleIds=null;
		if(roleIds!=null && roleIds.length()>0){
			strRoleIds=roleIds.split(",");
		}
		for(String r:strRoleIds){
			Role role=roleRepository.findOne(r);
			Set<RoleNmTsAuth> rtas=role.getRoleNmTsAuth();
			for(RoleNmTsAuth rta:rtas){
				Auth auth=rta.getAuth();
				Set<AuthNmTsResource> rtrs=auth.getAuthNmTsResource();
				for(AuthNmTsResource rtr:rtrs){
					if(rIds.get(rtr.getResourceId())==null){
						rIds.put(rtr.getResourceId(), rtr.getResource());
					}
				}
			}
		}
		return rIds;
	}

	@Override
	public List<User> findByStatusAndRole(Short status, String role) {
		// TODO Auto-generated method stub
		List<User> uList=userRepository.findByStatusAndRole(status);
		List<User> userList=new ArrayList<User>();
		List<Role> roleList=roleRepository.findByEname(role);
		if(uList!=null && !uList.isEmpty()){
			for(User u:uList){
				if(roleList!=null && !roleList.isEmpty()){
					for(Role r:roleList){
						if(u.getRoleIdFk().indexOf(r.getId())>-1){
							userList.add(u);
							break;
						}
					}
				}
			}
		}
		return userList;
	}

}

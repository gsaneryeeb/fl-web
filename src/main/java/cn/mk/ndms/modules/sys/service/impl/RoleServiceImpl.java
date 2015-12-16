package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Role;
import cn.mk.ndms.modules.sys.repository.RoleRepository;
import cn.mk.ndms.modules.sys.service.RoleService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class RoleServiceImpl extends GenericServiceImpl<Role, String> implements RoleService{

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Role getOne(String id) {
		// TODO Auto-generated method stub
		Role role=roleRepository.getOne(id);
		if(role!=null){
			role.getRoleNmTsAuth();
		}
		return role;
	}

	@Override
	public List<Role> findAllByStatus() {
		// TODO Auto-generated method stub
		return roleRepository.findAllByStatus();
	}
	 
	
}

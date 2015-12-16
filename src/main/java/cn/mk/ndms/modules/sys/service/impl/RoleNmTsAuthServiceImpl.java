package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.RoleNmTsAuth;
import cn.mk.ndms.modules.sys.repository.RoleNmTsAuthRepository;
import cn.mk.ndms.modules.sys.service.RoleNmTsAuthService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class RoleNmTsAuthServiceImpl extends GenericServiceImpl<RoleNmTsAuth, String> implements RoleNmTsAuthService{

	@Autowired
	private RoleNmTsAuthRepository roleNmTsAuthRepository;

	@Override
	public List<RoleNmTsAuth> findByRoleId(String roleId) {
		// TODO Auto-generated method stub
		return roleNmTsAuthRepository.findByRoleId(roleId);
	}

	@Override
	public void deleteAll(List<RoleNmTsAuth> list) {
		// TODO Auto-generated method stub
		if(list!=null && !list.isEmpty()){
			for(RoleNmTsAuth r:list){
				roleNmTsAuthRepository.delete(r.getId());
			}
		}
	}
	
}

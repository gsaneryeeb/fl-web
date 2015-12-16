package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Auth;
import cn.mk.ndms.modules.sys.repository.AuthRepository;
import cn.mk.ndms.modules.sys.service.AuthService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class AuthServiceImpl extends GenericServiceImpl<Auth, String> implements AuthService{

	@Autowired
	private AuthRepository authRepository;

	@Override
	public Auth getOne(String id) {
		// TODO Auto-generated method stub
		Auth auth=authRepository.getOne(id);
		if(auth!=null){
			auth.getAuthNmTsResource();
		}
		return auth;
	}

	@Override
	public List<Auth> findByIds(List<String> ids) {
		// TODO Auto-generated method stub
		return authRepository.findByIds(ids);
	}
	
	
	 
	
}

package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.AuthNmTsResource;
import cn.mk.ndms.modules.sys.repository.AuthNmTsResourceRepository;
import cn.mk.ndms.modules.sys.service.AuthNmTsResourceService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class AuthNmTsResourceServiceImpl extends GenericServiceImpl<AuthNmTsResource, String> implements AuthNmTsResourceService{

	@Autowired
	private AuthNmTsResourceRepository authNmTsResourceRepository;

	@Override
	public List<AuthNmTsResource> findByAuthId(String authId) {
		// TODO Auto-generated method stub
		return authNmTsResourceRepository.findByAuthId(authId);
	}

	@Override
	public void deleteAll(List<AuthNmTsResource> list) {
		// TODO Auto-generated method stub
		if(list!=null && !list.isEmpty()){
			for(AuthNmTsResource r:list){
				authNmTsResourceRepository.delete(r.getId());
			}
		}
	}
	
	
	 
	
}

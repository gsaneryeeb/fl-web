package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.AuthNmTsResource;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface AuthNmTsResourceService extends GenericService<AuthNmTsResource, String>{

	public List<AuthNmTsResource> findByAuthId(String authId);
	
	public void deleteAll(List<AuthNmTsResource> list);
}

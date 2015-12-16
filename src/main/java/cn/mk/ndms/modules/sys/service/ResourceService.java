package cn.mk.ndms.modules.sys.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.mk.ndms.domain.Resource;

import com.springframework.base.service.GenericService;
/**
 * @author 作者 :路璞
 * @version 创建时间：2014年3月8日 下午2:41:10 类说明
 */
public interface ResourceService extends GenericService<Resource, String> {
	public Page<Resource> findByPage(PageRequest pageRequest);

	public List<Resource> findAllSupior();
	
	public List<Resource> findAllSupiorAndNotId(String id);
	
	public List<Resource> findByIds(List<String> ids);
	
	public List<Resource> findByRoleIds(String id);

}

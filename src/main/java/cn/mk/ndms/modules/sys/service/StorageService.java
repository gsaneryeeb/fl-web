package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Storage;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface StorageService extends GenericService<Storage, String>{
	
	public List<Storage> findByPartId(String partId);
	
	public List<Storage> findByYesterDayAndStatus(String start,String end,String status);
	
	public List<Storage> findByIds(List<String> ids);
}

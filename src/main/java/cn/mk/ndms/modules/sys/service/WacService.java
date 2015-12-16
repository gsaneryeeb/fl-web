package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Wac;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface WacService extends GenericService<Wac, String>{
	
	public Wac findByPartId(String partId);
	
	public List<Wac> findAllByStatus(Short status);
	
	public void updateBatch(List<Wac> list);
}

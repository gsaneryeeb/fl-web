package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Part;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface PartService extends GenericService<Part, String>{
	
	public List<Part> findAllByStatus();
	
	public Part findAllByParts(String parts);
	
	public List<Part> findAllByFru(List<String> frus);
	
	public void updateBatch(List<Part> list);
	
	public List<Part> findByPart(String part);
	
}

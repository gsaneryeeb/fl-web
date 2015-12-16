package cn.mk.ndms.modules.sys.service;

import java.util.List;

import cn.mk.ndms.domain.Station;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface StationService extends GenericService<Station, String>{

	public List<Station> findAllByStatusAndProjectIds(List<String> pIds);
	
	public List<Station> findByProjectId(String pId);
}

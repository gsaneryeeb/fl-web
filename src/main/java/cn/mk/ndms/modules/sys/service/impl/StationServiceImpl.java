package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Station;
import cn.mk.ndms.modules.sys.repository.StationRepository;
import cn.mk.ndms.modules.sys.service.StationService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class StationServiceImpl extends GenericServiceImpl<Station, String> implements StationService{

	@Autowired
	private StationRepository stationRepository;

	@Override
	public List<Station> findAllByStatusAndProjectIds(List<String> pIds) {
		// TODO Auto-generated method stub
		return stationRepository.findAllByStatusAndProjectIds(pIds);
	}

	@Override
	public List<Station> findByProjectId(String pId) {
		// TODO Auto-generated method stub
		return stationRepository.findByProjectId(pId);
	}
	
	
	 
	
}

package cn.mk.ndms.modules.part.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.modules.part.repository.OutboundRepository;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.service.web.vo.StationVo;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class OutboundServiceImpl extends GenericServiceImpl<Outbound, String> implements OutboundService{

	@Autowired
	private OutboundRepository outboundRepository;

	@Override
	public Outbound findByRqNo(String rqNo) {
		// TODO Auto-generated method stub
		return outboundRepository.findByRqNo(rqNo);
	}

	@Override
	public List<StationVo> stationsGrop() {
		// TODO Auto-generated method stub
		return outboundRepository.stationsGrop();
	}

	@Override
	public List<Outbound> findByServiceByStationId(String stationId) {
		// TODO Auto-generated method stub
		return outboundRepository.findByServiceByStationId(stationId);
	}

	@Override
	public List<Outbound> findByReturnPart(String search_LIKE_callNo,String search_LIKE_station) {
		// TODO Auto-generated method stub
		return outboundRepository.findByReturnPart(search_LIKE_callNo,search_LIKE_station);
	}

	@Override
	public List<Outbound> findByYesterDayAndStatus(String start, String end,
			List<String> status) {
		// TODO Auto-generated method stub
		return outboundRepository.findByYesterDayAndStatus(start, end, status);
	}

	@Override
	public List<StationVo> stationsGrop(String callno, String station) {
		// TODO Auto-generated method stub
		return outboundRepository.stationsGrop(callno,station);
	}

	@Override
	public Page<Outbound> findPageBySearchs(Pageable pageable,
			String search_LIKE_outOrder,String search_LIKE_callno,String search_LIKE_station) {
		// TODO Auto-generated method stub
		return outboundRepository.findPageBySearchs(pageable,search_LIKE_outOrder,search_LIKE_callno,search_LIKE_station);
	}

	@Override
	public List<Outbound> findByNoAndNotStationId(String no, String stationId) {
		// TODO Auto-generated method stub
		return outboundRepository.findByNoAndNotStationId(no, stationId);
	}

	@Override
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable, String search_LIKE_callno, String search_LIKE_station, String search_LTE_arrivalTime) {
		// TODO Auto-generated method stub
		return outboundRepository.findReturnPageBySearchs(pageable, search_LIKE_callno, search_LIKE_station, search_LTE_arrivalTime);
	}

	@Override
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable, String search_LIKE_callno, String search_LIKE_station) {
		// TODO Auto-generated method stub
		return outboundRepository.findReturnPageBySearchs(pageable, search_LIKE_callno, search_LIKE_station);
	}

	
}

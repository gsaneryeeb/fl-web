package cn.mk.ndms.modules.part.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.modules.service.web.vo.StationVo;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface OutboundService extends GenericService<Outbound, String>{
	
	public Outbound findByRqNo(String rqNo);
	
	public Page<Outbound> findPageBySearchs(Pageable pageable,String search_LIKE_outOrder,String search_LIKE_callno,String search_LIKE_station);
	
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String search_LTE_arrivalTime);
	
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station);
	
	public List<StationVo> stationsGrop();
	
	public List<StationVo> stationsGrop(String callno,String station);
	
	public List<Outbound> findByServiceByStationId(String stationId);
	
	public List<Outbound> findByReturnPart(String search_LIKE_callNo,String search_LIKE_station);
	
	public List<Outbound> findByYesterDayAndStatus(String start,String end,List<String> status);
	
	public List<Outbound> findByNoAndNotStationId(String no ,String stationId);
}

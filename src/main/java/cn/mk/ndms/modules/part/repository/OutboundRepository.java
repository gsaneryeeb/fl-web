package cn.mk.ndms.modules.part.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.modules.service.web.vo.StationVo;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface OutboundRepository extends GenericRepository<Outbound, String>{

	@Query("from Outbound o where o.rqNo=?1 ")	//and o.status!='-1'
	public Outbound findByRqNo(String rqNo);
	
	@Query("select new cn.mk.ndms.modules.service.web.vo.StationVo(c.id,c.station,c.stationId,c.stationNo,count(*) as amount,c.repairType) from Outbound c where c.status in ('0','2') group by c.stationId,c.type order by c.stationNo")
	public List<StationVo> stationsGrop();
	
	@Query("from Outbound c where c.status in ('0','2') and c.stationId=?1")
	public List<Outbound> findByServiceByStationId(String stationId);
	
	@Query("from Outbound c where c.isReturn = 0 and c.returnFlag=1 and c.callno like %?1% and c.station like %?2%")
	public List<Outbound> findByReturnPart(String search_LIKE_callNo,String search_LIKE_station);

	//异动盘点查询条件,按operDate 存储为出库时间
	@Query("from Outbound c where c.operDate >=?1 and c.operDate<=?2 and c.status in (?3)")
	public List<Outbound> findByYesterDayAndStatus(String start,String end,List<String> status);
	
	@Query("select new cn.mk.ndms.modules.service.web.vo.StationVo(c.id,c.station,c.stationId,c.stationNo,count(*) as amount,c.repairType) from Outbound c where c.status in ('0','2') and c.callno like %?1% and c.station like %?2% group by c.stationId,c.type order by c.stationNo")
	public List<StationVo> stationsGrop(String callno,String station);
	
	@Query("from Outbound c where c.outOrder like %?1% and c.callno like %?2% and c.station like %?3% and c.status in (3,4,1) order by status desc,sendTime asc")
	public Page<Outbound> findPageBySearchs(Pageable pageable,String search_LIKE_outOrder,String search_LIKE_callno,String search_LIKE_station);
	
	@Query("from Outbound c where c.callno like %?1% and c.station like %?2% and c.arrivalTime <= ?3")
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String search_LTE_arrivalTime);
	
	@Query("from Outbound c where c.callno like %?1% and c.station like %?2%")
	public Page<Outbound> findReturnPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station);
	
	@Query("from Outbound c where c.expressNo=?1 and c.stationId!=?2")
	public List<Outbound> findByNoAndNotStationId(String no ,String stationId);
}
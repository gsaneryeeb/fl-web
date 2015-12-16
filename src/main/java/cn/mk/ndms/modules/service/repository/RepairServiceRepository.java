package cn.mk.ndms.modules.service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.RepairService;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface RepairServiceRepository extends GenericRepository<RepairService, String>{

	@Query("from RepairService r where r.ppid=?1 order by expressArrivalTime desc")
	public List<RepairService> findByPPIDOrderByExpressArrivalTime(String ppid);
	
	@Query("from RepairService r where r.status!=1 and r.status!=-1 and ((r.station like '%北京%' and DATEDIFF(now(),r.sendDate)>=2) or (r.station not like '%北京%' and DATEDIFF(now(),r.sendDate)>=5))")
	public List<RepairService> findPadding();
}

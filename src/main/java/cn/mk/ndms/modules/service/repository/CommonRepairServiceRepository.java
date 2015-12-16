package cn.mk.ndms.modules.service.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.CommonRepairService;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface CommonRepairServiceRepository extends GenericRepository<CommonRepairService, String>{
	
	@Query("from CommonRepairService c where c.returnFlag=?1 and c.status=1")
	public List<CommonRepairService> findByReturnFlag(String returnFlag);
	
	@Query("from CommonRepairService c where c.returnFlag=1 and c.isReturn=0")
	public List<CommonRepairService> findNotReturn();
	
	@Query("from CommonRepairService c where c.status='-2' and c.callno like %?1% and c.station like %?2% and c.allocateEngineerId=?3")
	public Page<CommonRepairService> findPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String userId);
	
	@Query("from CommonRepairService c where c.id!=?1 and c.machineModel=?2 and c.serialNumber=?3 and c.applyPartsId =?4 and c.applyDate>=?5 and c.applyDate<=?6")
	public List<CommonRepairService> findByMachineAndSerialAndMinDateAndMaxDate(String id,String machine,String serialNumber,String partId,String minDate,String maxDate);
}

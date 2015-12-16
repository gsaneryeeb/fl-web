package cn.mk.ndms.modules.service.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.mk.ndms.domain.CommonRepairService;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface CommonRepairServiceService extends GenericService<CommonRepairService, String>{
	
	
	public List<CommonRepairService> findByReturnFlag(String returnFlag);
	
	public List<CommonRepairService> findNotReturn();
	
	public Page<CommonRepairService> findPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String userId);
	
	public List<CommonRepairService> findByMachineAndSerialAndMinDateAndMaxDate(String id,String machine,String serialNumber,String partId,String minDate,String maxDate);
	
}

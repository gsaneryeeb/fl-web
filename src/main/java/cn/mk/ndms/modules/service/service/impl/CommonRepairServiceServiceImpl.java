package cn.mk.ndms.modules.service.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.CommonRepairService;
import cn.mk.ndms.modules.service.repository.CommonRepairServiceRepository;
import cn.mk.ndms.modules.service.service.CommonRepairServiceService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class CommonRepairServiceServiceImpl extends GenericServiceImpl<CommonRepairService, String> implements CommonRepairServiceService{

	@Autowired
	private CommonRepairServiceRepository commonRepairServiceRepository;

	public List<CommonRepairService> findByReturnFlag(String returnFlag){
		return commonRepairServiceRepository.findByReturnFlag(returnFlag);
	}


	@Override
	public List<CommonRepairService> findNotReturn() {
		// TODO Auto-generated method stub
		return commonRepairServiceRepository.findNotReturn();
	}


	@Override
	public Page<CommonRepairService> findPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String userId) {
		// TODO Auto-generated method stub
		return commonRepairServiceRepository.findPageBySearchs(pageable,search_LIKE_callno,search_LIKE_station,userId);
	}


	@Override
	public List<CommonRepairService> findByMachineAndSerialAndMinDateAndMaxDate(String id,String machine, String serialNumber, String partId, String minDate,
			String maxDate) {
		// TODO Auto-generated method stub
		return commonRepairServiceRepository.findByMachineAndSerialAndMinDateAndMaxDate(id,machine, serialNumber, partId, minDate, maxDate);
	}
	
}

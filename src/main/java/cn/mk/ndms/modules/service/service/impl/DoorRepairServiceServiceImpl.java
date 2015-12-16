package cn.mk.ndms.modules.service.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.DoorRepairService;
import cn.mk.ndms.modules.service.repository.DoorRepairServiceRepository;
import cn.mk.ndms.modules.service.service.DoorRepairServiceService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class DoorRepairServiceServiceImpl extends GenericServiceImpl<DoorRepairService, String> implements DoorRepairServiceService{

	@Autowired
	private DoorRepairServiceRepository doorRepairServiceRepository;

	@Override
	public List<DoorRepairService> findByReturnFlag(String returnFlag) {
		// TODO Auto-generated method stub
		return doorRepairServiceRepository.findByReturnFlag(returnFlag);
	}

	@Override
	public List<DoorRepairService> findNotReturn() {
		// TODO Auto-generated method stub
		return doorRepairServiceRepository.findNotReturn();
	}
	
	
	 
	
}

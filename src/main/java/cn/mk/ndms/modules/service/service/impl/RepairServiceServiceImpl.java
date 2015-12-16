package cn.mk.ndms.modules.service.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.RepairService;
import cn.mk.ndms.modules.service.repository.RepairServiceRepository;
import cn.mk.ndms.modules.service.service.RepairServiceService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class RepairServiceServiceImpl extends GenericServiceImpl<RepairService, String> implements RepairServiceService{

	@Autowired
	private RepairServiceRepository repairServiceRepository;

	@Override
	public List<RepairService> findByPPIDOrderByExpressArrivalTime(String ppid) {
		// TODO Auto-generated method stub
		return repairServiceRepository.findByPPIDOrderByExpressArrivalTime(ppid);
	}

	@Override
	public List<RepairService> findPadding() {
		// TODO Auto-generated method stub
		return repairServiceRepository.findPadding();
	}
	
	
	 
	
}

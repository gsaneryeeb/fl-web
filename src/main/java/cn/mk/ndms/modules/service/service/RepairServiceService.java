package cn.mk.ndms.modules.service.service;

import java.util.List;

import cn.mk.ndms.domain.RepairService;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface RepairServiceService extends GenericService<RepairService, String>{
	
	public List<RepairService> findByPPIDOrderByExpressArrivalTime(String ppid);
	
	public List<RepairService> findPadding();
}

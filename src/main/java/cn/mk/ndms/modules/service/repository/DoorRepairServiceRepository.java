package cn.mk.ndms.modules.service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.DoorRepairService;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface DoorRepairServiceRepository extends GenericRepository<DoorRepairService, String>{
	
	@Query("from DoorRepairService d where d.returnFlag=?1 and d.status=1")
	public List<DoorRepairService> findByReturnFlag(String returnFlag);
	
	@Query("from DoorRepairService d where d.returnFlag=1 and d.isReturn=0")
	public List<DoorRepairService> findNotReturn();
}

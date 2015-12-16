package cn.mk.ndms.modules.part.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.StoreAdjustment;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface StoreAdjustmentRepository extends GenericRepository<StoreAdjustment, String>{
	
	@Query("from StoreAdjustment s where s.confimTime>=?1 and s.confimTime<=?2 and s.status=?3")
	public List<StoreAdjustment> findByYesterDayAndStatus(String start,String end,String status);
}
package cn.mk.ndms.modules.part.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.InventoryCycle;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface InventoryCycleRepository extends GenericRepository<InventoryCycle, String>{

	@Query("from InventoryCycle i where i.quarter=?1")
	public List<InventoryCycle> findByQuarter(String quarter);

	@Query("from InventoryCycle i where i.months=?1")
	public List<InventoryCycle> findByMonth(String month);

	@Query("from InventoryCycle i where i.year=?1")
	public List<InventoryCycle> findByYear(String year);
}
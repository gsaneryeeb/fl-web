package cn.mk.ndms.modules.part.service;

import java.util.List;

import cn.mk.ndms.domain.InventoryCycle;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface InventoryCycleService extends GenericService<InventoryCycle, String>{

	public List<InventoryCycle> findByQuarter(String quarter);

	public List<InventoryCycle> findByMonth(String month);

	public List<InventoryCycle> findByYear(String year);
	
}

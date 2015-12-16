package cn.mk.ndms.modules.part.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.InventoryCycle;
import cn.mk.ndms.modules.part.repository.InventoryCycleRepository;
import cn.mk.ndms.modules.part.service.InventoryCycleService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class InventoryCycleServiceImpl extends GenericServiceImpl<InventoryCycle, String> implements InventoryCycleService{

	@Autowired
	private InventoryCycleRepository inventoryCycleRepository;

	@Override
	public List<InventoryCycle> findByQuarter(String quarter) {
		// TODO Auto-generated method stub
		return inventoryCycleRepository.findByQuarter(quarter);
	}

	@Override
	public List<InventoryCycle> findByMonth(String month) {
		// TODO Auto-generated method stub
		return inventoryCycleRepository.findByMonth(month);
	}

	@Override
	public List<InventoryCycle> findByYear(String year) {
		// TODO Auto-generated method stub
		return inventoryCycleRepository.findByYear(year);
	}

}

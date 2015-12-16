package cn.mk.ndms.modules.part.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.StoreAdjustment;
import cn.mk.ndms.modules.part.repository.StoreAdjustmentRepository;
import cn.mk.ndms.modules.part.service.StoreAdjustmentService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class StoreAdjustmentServiceImpl extends GenericServiceImpl<StoreAdjustment, String> implements StoreAdjustmentService{

	@Autowired
	private StoreAdjustmentRepository storeAdjustmentRepository;

	@Override
	public List<StoreAdjustment> findByYesterDayAndStatus(String start,
			String end, String status) {
		// TODO Auto-generated method stub
		return storeAdjustmentRepository.findByYesterDayAndStatus(start, end, status);
	}

}

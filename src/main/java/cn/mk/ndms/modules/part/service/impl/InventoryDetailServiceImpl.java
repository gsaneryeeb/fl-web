package cn.mk.ndms.modules.part.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.InventoryDetail;
import cn.mk.ndms.modules.part.repository.InventoryDetailRepository;
import cn.mk.ndms.modules.part.service.InventoryDetailService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class InventoryDetailServiceImpl extends GenericServiceImpl<InventoryDetail, String> implements InventoryDetailService{

	@Autowired
	private InventoryDetailRepository inventoryDetailRepository;

}

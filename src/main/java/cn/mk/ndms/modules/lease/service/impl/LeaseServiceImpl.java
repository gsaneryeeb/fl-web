package cn.mk.ndms.modules.lease.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Lease;
import cn.mk.ndms.modules.lease.repository.LeaseRepository;
import cn.mk.ndms.modules.lease.service.LeaseService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class LeaseServiceImpl extends GenericServiceImpl<Lease, String> implements LeaseService{

	@Autowired
	private LeaseRepository leaseRepository;
	
}

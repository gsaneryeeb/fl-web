package cn.mk.ndms.modules.lease.service;

import cn.mk.ndms.domain.LeaseNo;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface LeaseNoService extends GenericService<LeaseNo, String>{

	public String updateMaxNo(String uId, String date);
}

package cn.mk.ndms.modules.lease.service;

import java.util.List;

import cn.mk.ndms.domain.LeaseDetail;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface LeaseDetailService extends GenericService<LeaseDetail, String>{
	
	public void deleteByLeaseId(String id);
	
	public List<LeaseDetail> findByIds(String[] id);
	
	public void deleteByIds(List<String> ids);
}

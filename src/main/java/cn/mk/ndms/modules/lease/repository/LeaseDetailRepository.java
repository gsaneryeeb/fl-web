package cn.mk.ndms.modules.lease.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.LeaseDetail;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface LeaseDetailRepository extends GenericRepository<LeaseDetail, String>{

	@Modifying
	@Query(value="delete from LeaseDetail d where d.leaseId=?1")
	public void deleteByLeaseId(String id);
	
	
	@Query(value="from LeaseDetail d where d.id in (?1)")
	public List<LeaseDetail> findByIds(List<String> ids);
}

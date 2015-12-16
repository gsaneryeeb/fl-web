package cn.mk.ndms.modules.lease.repository;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.LeaseNo;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface LeaseNoRepository extends GenericRepository<LeaseNo, String>{
	
	@Query("select MAX(no) from LeaseNo rn where rn.no like ?1%")
	public String findMaxByType(String yearDay);
}

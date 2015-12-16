package cn.mk.ndms.modules.sys.repository;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.CallNo;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface CallNoRepository extends GenericRepository<CallNo, String>{

	@Query("select MAX(callno) from CallNo rn where rn.callno like ?1%")
	public String findMaxByType(String yearDay);
}

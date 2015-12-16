package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Wac;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface WacRepository extends GenericRepository<Wac, String>{

	@Query("from Wac w where w.partId=?1 and w.flag=1")
	public Wac findByPartId(String partId);
	
	@Query("from Wac w where w.flag=?1")
	public List<Wac> findAllByStatus(Short status);
}

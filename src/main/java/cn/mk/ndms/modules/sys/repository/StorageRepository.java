package cn.mk.ndms.modules.sys.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import cn.mk.ndms.domain.Storage;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface StorageRepository extends GenericRepository<Storage, String>{
	
	@Query("from Storage s where s.partId=?1 and s.status=1")
	public List<Storage> findByPartId(String partId);
	
	@Query("from Storage s where s.operDate>=?1 and s.operDate<=?2 and s.status=?3")
	public List<Storage> findByYesterDayAndStatus(String start,String end,String status);
	
	
	@Query("from Storage s where s.id in (?1)")
	public List<Storage> findByIds(List<String> ids);
}

package cn.mk.ndms.modules.part.repository;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.mk.ndms.domain.ReturnPart;

import com.springframework.base.repository.GenericRepository;


   
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:55:44 
 * 类说明  
 */
public interface ReturnPartRepository extends GenericRepository<ReturnPart, String>{

	@Query("from ReturnPart r where r.status=?1 and r.callno like %?2% and r.station like %?3%")
	public List<ReturnPart> findByStatus(String status,String search_LIKE_callNo,String search_LIKE_station);
	
	@Query("from ReturnPart r where r.callno like %?1% and r.printNo like %?2% and r.printId is not null")
	public List<ReturnPart> findByCallNoOrPrintNo(String search_LIKE_callNo,String search_LIKE_printNo);
	
	@Query("from ReturnPart r where r.id in (:ids)")
	public List<ReturnPart> findByIds(@Param("ids") List<String> ids);
	
	@Query("from ReturnPart c where c.callno like %?1% and c.station like %?2% and c.status like %?3% ")
	public Page<ReturnPart> findPageBySearchs(Pageable pageable, String search_LIKE_callno, String search_LIKE_station, String search_LIKE_status);
}
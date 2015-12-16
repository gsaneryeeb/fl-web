package cn.mk.ndms.modules.part.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cn.mk.ndms.domain.ReturnPart;

import com.springframework.base.service.GenericService;

/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月16日 上午10:56:54 
 * 类说明 
 */
public interface ReturnPartService extends GenericService<ReturnPart, String>{
	
	public List<ReturnPart> findByStatus(String status,String search_LIKE_callNo,String search_LIKE_station);
	
	public List<ReturnPart> findByCallNoOrPrintNo(String search_LIKE_callNo,String search_LIKE_printNo);
	
	public List<ReturnPart> findByIds(List<String> ids);
	
	public Page<ReturnPart> findPageBySearchs(Pageable pageable,String search_LIKE_callno,String search_LIKE_station,String search_LIKE_status);
}

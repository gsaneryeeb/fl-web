package cn.mk.ndms.modules.part.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.ReturnPart;
import cn.mk.ndms.modules.part.repository.ReturnPartRepository;
import cn.mk.ndms.modules.part.service.ReturnPartService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class ReturnPartServiceImpl extends GenericServiceImpl<ReturnPart, String> implements ReturnPartService{

	@Autowired
	private ReturnPartRepository returnPartRepository;

	@Override
	public List<ReturnPart> findByStatus(String status,String search_LIKE_callNo,String search_LIKE_station) {
		// TODO Auto-generated method stub
		return returnPartRepository.findByStatus(status,search_LIKE_callNo,search_LIKE_station);
	}

	@Override
	public List<ReturnPart> findByCallNoOrPrintNo(String search_LIKE_callNo,
			String search_LIKE_printNo) {
		// TODO Auto-generated method stub
		return returnPartRepository.findByCallNoOrPrintNo(search_LIKE_callNo, search_LIKE_printNo);
	}

	@Override
	public List<ReturnPart> findByIds(List<String> ids) {
		// TODO Auto-generated method stub
		return returnPartRepository.findByIds(ids);
	}

	@Override
	public Page<ReturnPart> findPageBySearchs(Pageable pageable, String search_LIKE_callno, String search_LIKE_station, String search_LIKE_status) {
		// TODO Auto-generated method stub
		return returnPartRepository.findPageBySearchs(pageable, search_LIKE_callno, search_LIKE_station, search_LIKE_status);
	}

	
}

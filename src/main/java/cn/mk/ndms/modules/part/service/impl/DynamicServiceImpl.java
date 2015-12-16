package cn.mk.ndms.modules.part.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Dynamic;
import cn.mk.ndms.modules.part.repository.DynamicRepository;
import cn.mk.ndms.modules.part.service.DynamicService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class DynamicServiceImpl extends GenericServiceImpl<Dynamic, String> implements DynamicService{

	@Autowired
	private DynamicRepository dynamicRepository;

	@Override
	public List<Dynamic> findByDate(String year, String month, String day) {
		// TODO Auto-generated method stub
		return dynamicRepository.findByDate(year, month, day);
	}

}

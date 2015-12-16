package cn.mk.ndms.modules.service.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Helpdesk;
import cn.mk.ndms.modules.service.repository.HelpdeskRepository;
import cn.mk.ndms.modules.service.service.HelpdeskService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class HelpdeskServiceImpl extends GenericServiceImpl<Helpdesk, String> implements HelpdeskService{

	@Autowired
	private HelpdeskRepository helpdeskRepository;
	
	
	 
	
}

package cn.mk.ndms.modules.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.Fault;
import cn.mk.ndms.modules.sys.repository.FaultRepository;
import cn.mk.ndms.modules.sys.service.FaultService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class FaultServiceImpl extends GenericServiceImpl<Fault, String> implements FaultService{

	@Autowired
	private FaultRepository faultRepository;

	@Override
	public List<Fault> findByStatus(Short status) {
		// TODO Auto-generated method stub
		return faultRepository.findByStatus(status);
	}

	@Override
	public Fault findByName(String name) {
		// TODO Auto-generated method stub
		List<Fault> list=faultRepository.findByName(name);
		if(list!=null && !list.isEmpty()){
			Fault r=new Fault();
			for(Fault f:list){
				if(f.getFlag()!=null && f.getFlag().toString().equals("0")){
					r=f;
					break;
				}
			}
			return r;
		}else{
			return null;
		}
	}
}

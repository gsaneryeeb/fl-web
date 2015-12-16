package cn.mk.ndms.modules.lease.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mk.ndms.domain.LeaseDetail;
import cn.mk.ndms.modules.lease.repository.LeaseDetailRepository;
import cn.mk.ndms.modules.lease.service.LeaseDetailService;

import com.springframework.base.service.GenericServiceImpl;
  
/** 
 * @author 作者 :范津 
 * @version 创建时间：2014年1月17日 上午10:19:34 
 * 类说明 
 */
@Service
public class LeaseDetailServiceImpl extends GenericServiceImpl<LeaseDetail, String> implements LeaseDetailService{

	@Autowired
	private LeaseDetailRepository leaseDetailRepository;

	@Override
	public void deleteByLeaseId(String id) {
		// TODO Auto-generated method stub
		leaseDetailRepository.deleteByLeaseId(id);
	}

	@Override
	public List<LeaseDetail> findByIds(String[] id) {
		// TODO Auto-generated method stub
		List<String> ids=new ArrayList<String>();
		if(id!=null && id.length>0){
			for(String i:id){
				ids.add(i);
			}
		}
		return leaseDetailRepository.findByIds(ids);
	}

	@Override
	public void deleteByIds(List<String> ids) {
		// TODO Auto-generated method stub
		leaseDetailRepository.delete(leaseDetailRepository.findByIds(ids));
	}
	
}

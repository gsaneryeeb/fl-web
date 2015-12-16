package cn.mk.ndms.modules.lease.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.mk.ndms.domain.LeaseDetail;
import cn.mk.ndms.modules.lease.service.LeaseDetailService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("lease/leaseDetail")
public class LeaseDetailController extends GenericCRUDController<LeaseDetail, String>
{
	
	@Autowired
	private LeaseDetailService leaseDetailService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.LEASE_PAGENAME;
	}
	
	
	@ModelAttribute  
    public void setReportWhere(@RequestParam(value="s_where",required=false) String s_where, Model model) {  
       model.addAttribute("s_where", s_where);  
    }  
}


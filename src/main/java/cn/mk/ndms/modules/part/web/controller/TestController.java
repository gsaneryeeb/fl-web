	package cn.mk.ndms.modules.part.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.Supiro;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.service.InNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.RoleService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.SupiroService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/test")
public class TestController extends GenericCRUDController<Storage, String>
{
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private SupiroService supiroService;
	
	@Autowired
	private InNoService inNoService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.PURCHASE_TEST_PAGENAME;
	}
	
	@ModelAttribute(value = "roles")
	public Map<String,String> getRoles(){
//		User user=(User)request.getSession().getAttribute("USER");
		Map<String,String> roleMap=new HashMap<String,String>();
		List<Role> roles=roleService.findAllByStatus();
		if(roles!=null && !roles.isEmpty()){
			for(Role r:roles){
				roleMap.put(r.getId(), r.getEname());
			}
		}
		return roleMap;
	}
	
	@ModelAttribute(value = "PARTS")
	public Map<String,Part> setParts()
	{
		List<Part> listParts=partService.findAllByStatus();
		Map<String,Part> partMap=new HashMap<String,Part>();
		if(listParts!=null && !listParts.isEmpty()){
			for(Part p:listParts){
				partMap.put(p.getId(), p);
			}
		}
		return partMap;
	}
	
	@ModelAttribute(value = "statusAll")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_PURCHASE_STATUS;
	}
	
	@ModelAttribute(value = "statusEngineer")
	public Map<String,String> setEngineerStatus()
	{
		return Constants.ENGINEERSTATUSMAP;
	}
	
	@ModelAttribute(value = "speakForStatusMap")
	public Map<String,String> setSpeakForStatus()
	{
		return Constants.SPEAKFORSTATUSMAP;
	}
	
	
	@ModelAttribute(value = "engineers")
	public List<User> setEngineers()
	{
		return userService.findByStatusAndRole(Constants.SHORT_SIGN_1,Constants.ENGINEER);
	}
	
	@ModelAttribute(value = "supiros")
	public List<Supiro> setSupiros()
	{
		return supiroService.findByStatus(Constants.SHORT_SIGN_1);
	}
	
	@ModelAttribute(value = "sources")
	public Map<String,String> setSources()
	{
		return Constants.sourcesMap;
	}
	
	
	@RequestMapping(value="bachSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids,
			@RequestParam(value="engineerStatuss") String[] engineerStatuss,@RequestParam(value="intactQuantitys") Integer[] intactQuantitys,
			@RequestParam(value="damageQuantitys") Integer[] damageQuantitys,@RequestParam(value="faults") String[] faults,
			@RequestParam(value="expressDates") String[] expressDates){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(ids!=null && ids.length>0){
				for(int i=0;i<ids.length;i++){
					Storage tt=storageService.findOne(ids[i]);
					tt.setEngineerStatus(engineerStatuss[i]);
					tt.setIntactQuantity(intactQuantitys[i]);
					if(Constants.NUMBER_0.equals(String.valueOf(damageQuantitys[i]))){
						tt.setStatus(Constants.NUMBER_SIGN_0);
					}else{
						tt.setStatus(Constants.NUMBER_SIGN_6);
						tt.setTransportStatus(Constants.NUMBER_SIGN_0);
					}
					tt.setDamageQuantity(damageQuantitys[i]);
					tt.setFault(faults.length>0?faults[i]:null);
					tt.setExpressDate(expressDates[i]);
					storageService.update(tt);
				}
				return AjaxBean.getInstance("success");
			}else{
				return AjaxBean.getInstance("error","没有选择待处理的订单!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	
}


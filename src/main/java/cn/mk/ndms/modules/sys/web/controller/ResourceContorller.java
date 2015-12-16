package cn.mk.ndms.modules.sys.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.modules.sys.service.ResourceService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericPageController;

/**
 * @author 作者 :路璞
 * @version 创建时间：2014年3月8日 下午2:41:10 类说明
 */
@Controller
@RequestMapping("sys/resource")
public class ResourceContorller extends GenericPageController<Resource, String>
{
	
	@Autowired
	private ResourceService resourcesService;
	

	@RequestMapping(value="new")
	public String toAdd(Model map){
		map.addAttribute("role");
		map.addAttribute("topList", resourcesService.findAllSupior());
		return "sys/resource/new";
	}
	
	@RequestMapping(value="save")
	@ResponseBody
	public AjaxBean save(Resource resources){
		try{
			if(Constants.NUMBER_SIGN_0.equals(resources.getSuperior().toString())){
				resources.setSuperior(null);
			}
			resourcesService.save(resources);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}

	@RequestMapping(value = "del")
	@ResponseBody
	public AjaxBean del(String id,String flag)
	{
		try
		{
			Resource resources = resourcesService.findOne(id);
			if(flag.equals(Constants.NUMBER_SIGN_0)){
				resources.setFlag(Constants.SHORT_SIGN_1);
			}else{
				resources.setFlag(Constants.SHORT_SIGN_0);
			}
			resourcesService.update(resources);
			return AjaxBean.getInstance("success");
		} catch (Exception ex)
		{
			return AjaxBean.getInstance("error", ex.getMessage());
		}
	}
	@RequestMapping(value="edit")
	public String edit(Model map,String id){
		map.addAttribute("topList", resourcesService.findAllSupiorAndNotId(id));
		map.addAttribute("resources", resourcesService.findOne(id));
		return "sys/resource/edit";
	}
	
	@RequestMapping(value="update")
	@ResponseBody
	public AjaxBean update(Resource resources){
		try{
			if(Constants.NUMBER_SIGN_0.equals(resources.getSuperior().toString())){
				resources.setSuperior(null);
			}
			resourcesService.update(resources);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}

	@RequestMapping(value="show")
	public String show(Model map,String id){
		map.addAttribute("resources", resourcesService.findOne(id));
		return "sys/resource/edit";
	}
	@RequestMapping(value = "detail")
	public String detail(Model model, String id) {
		model.addAttribute("resources", resourcesService.findOne(id));
		return "sys/resource/detail";
	}
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.DICTIONARYS_RESOURCES;
	}

}

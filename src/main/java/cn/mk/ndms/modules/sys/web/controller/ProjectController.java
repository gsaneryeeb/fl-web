package cn.mk.ndms.modules.sys.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Project;
import cn.mk.ndms.modules.sys.service.ProjectService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/project")
public class ProjectController extends GenericCRUDController<Project, String>
{
	@Autowired
	private ProjectService projectService;

	@ModelAttribute(value = "pTypes")
	public Map<String,String> setProjectType()
	{
		return Constants.MAP_PROJECT_TYPE;
	}
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.PROJECT_PAGENAME;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Project t){
		try{
			Project tt=projectService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			projectService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


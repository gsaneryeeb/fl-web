package cn.mk.ndms.modules.sys.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Project;
import cn.mk.ndms.domain.Station;
import cn.mk.ndms.modules.sys.service.ProjectService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/station")
public class StationController extends GenericCRUDController<Station, String>
{
	@Autowired
	private StationService stationService;
	
	@Autowired
	private ProjectService projectService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.STATION_PAGENAME;
	}
	
	@ModelAttribute(value = "projects")
	public List<Project> setProjects()
	{
		return projectService.findAllByStatus();
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Station t){
		try{
			Station tt=stationService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			stationService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


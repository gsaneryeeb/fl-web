package cn.mk.ndms.modules.service.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Evaluation;
import cn.mk.ndms.domain.Helpdesk;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.service.service.HelpdeskService;
import cn.mk.ndms.modules.sys.service.EvaluationService;
import cn.mk.ndms.modules.sys.service.ProjectService;
import cn.mk.ndms.modules.sys.service.RepartNoService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.ProjectVo;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("service/helpdesk")
public class HelpdeskController extends GenericCRUDController<Helpdesk, String>
{
	@Autowired
	private HelpdeskService helpdeskService;
	
	@Autowired
	private RepartNoService repartNoService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private EvaluationService evaluationService;
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "projects")
	public List<ProjectVo> getProjects(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		return projects.get(Constants.SERVICE_TYPE_HELP_DESK_NO);
	}
	
	@ModelAttribute(value = "SERVICE_TYPE")
	public Map<String,String> setServiceTypeMap(){
		return Constants.MAP_HELPDESK_TYPE;
	}
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.HELPDESK_PAGENAME;
	}
	
	@ModelAttribute(value = "evaluations")
	public List<Evaluation> setevaluation()
	{
		return evaluationService.getAll();
	}
	
	@ModelAttribute(value = "status")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_HELPDESK_STATUS;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Helpdesk t){
		try{
			Helpdesk tt=helpdeskService.findOne(t.getId());
			tt.setStatus(Constants.NUMBER_SIGN_00);
			tt.setOperFinishDate(DateTool.longFormat(new Date()));
			helpdeskService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}

	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(Helpdesk t,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String no=repartNoService.updateMaxNo(serviceType.HELP_DESK,user.getId(),date,Constants.HELP_DESK_NO_PRE_FIX);
			t.setOrders(no);
			t.setAcceptPersonId(user.getId());
			t.setAcceptPersonName(user.getuName());
			t.setAcceptDate(date);
			t.setOperFinishDate(date);
			helpdeskService.save(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean updateAjaxs(Helpdesk t,HttpServletRequest request){
		try{
			String date=DateTool.longFormat(new Date());
			Helpdesk tt=helpdeskService.findOne(t.getId());
			t.setOperFinishDate(date);
			t.setAcceptDate(tt.getAcceptDate());
			t.setAcceptPersonId(tt.getAcceptPersonId());
			t.setAcceptPersonName(tt.getAcceptPersonName());
			helpdeskService.update(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


package cn.mk.ndms.modules.service.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.ProjectRUser;
import cn.mk.ndms.domain.RepairService;
import cn.mk.ndms.domain.Station;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.service.service.RepairServiceService;
import cn.mk.ndms.modules.sys.service.ProjectRUserService;
import cn.mk.ndms.modules.sys.service.RepartNoService;
import cn.mk.ndms.modules.sys.service.RoleService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.ProjectVo;

import com.alibaba.fastjson.JSON;
import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("service/repairService")
public class RepairServiceController extends GenericCRUDController<RepairService, String>
{
	@Autowired
	private RepairServiceService repairServiceService;
	
	@Autowired
	private RepartNoService repartNoService;
	
	@Autowired
	private StationService stationService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectRUserService projectRUserService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.REPAIR_SERVICE_PAGENAME;
	}
	
	@ModelAttribute(value = "RESULT")
	public Map<String,String> setResult()
	{
		return Constants.RESULT_MAP;
	}
	
	@ModelAttribute(value = "types")
	public Map<String,String> setTypes()
	{
		return Constants.MAP_REPEAR_TYPE;
	}
	
	@ModelAttribute(value = "status")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_REPAIRSERVICE_STATUS;
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "engineers")
	public List<User> setEngineer(HttpServletRequest request)
	{
		List<User> users=new ArrayList<User>();
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		List<ProjectVo> projectsList=projects.get(Constants.SERVICE_TYPE_REPAIR_NO);
		List<String> pIds=new ArrayList<String>();
		if(projectsList!=null && !projectsList.isEmpty()){
			for(ProjectVo p:projectsList){
				pIds.add(p.getId());
			}
		}
		List<ProjectRUser> pRus=projectRUserService.findByProjectIdsAndRole(pIds);
		if(pRus!=null && !pRus.isEmpty()){
			for(ProjectRUser pRu:pRus){
				users.add(pRu.getUser());
			}
		}
		return users;
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "stations")
	public List<Station> getStations(HttpServletRequest request){
		List<Station> stations=new ArrayList<Station>();
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		List<ProjectVo> projectsList=projects.get(Constants.SERVICE_TYPE_REPAIR_NO);
		if(projectsList!=null && !projectsList.isEmpty()){
			stations=stationService.findByProjectId(projectsList.get(0).getId());
		}
		return stations;
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "projects")
	public List<ProjectVo> getProjects(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		return projects.get(Constants.SERVICE_TYPE_REPAIR_NO);
	}
	
	@RequestMapping(value = "newInit")
	public String newInit(ModelMap modal,HttpServletRequest request){
		request.getSession().setAttribute(Constants.FIRST_SHOW,Constants.CLASS_NOT_HIDE);
		request.getSession().setAttribute(Constants.FIRST_HIDE,Constants.CLASS_HIDE);
		request.getSession().setAttribute(Constants.READ_ONLY_ONE,Constants.READ_ONLY_NO);
		request.getSession().setAttribute(Constants.READ_ONLY_TWO,Constants.READ_ONLY_YES);
		request.getSession().setAttribute(Constants.READ_ONLY_THRESS,Constants.READ_ONLY_YES);
		request.getSession().setAttribute(Constants.READ_ONLY_FORE,Constants.READ_ONLY_YES);
		return "service/repairService/oper";
	}
	
	@RequestMapping(value="checkPPID")
	@ResponseBody
	public AjaxBean checkPPID(String ppid,String start){
		try{
			List<RepairService> tt=repairServiceService.findByPPIDOrderByExpressArrivalTime(ppid);
			if(tt!=null && !tt.isEmpty()){
				long dif=1;
				RepairService t=null;
				System.out.println("tt="+tt.size());
				for(RepairService t1:tt){
					if(StringUtils.isNotEmpty(t1.getExpressArrivalTime())){
						String end="";
						if(t1.getExpressArrivalTime().length()==16){
							end=t1.getExpressArrivalTime()+":00";
						}else{
							end=t1.getExpressArrivalTime();
						}
						dif=DateTool.dateDiffDay(end,start+":00")-90;
						t=t1;
						break;
					}
				}
				if(dif<=0 && dif>=-90){
					t.setStatus(Constants.MAP_REPAIRSERVICE_STATUS.get(t.getStatus()));
					String json=JSON.toJSONString(t);
					return AjaxBean.getInstance("error",json,DateTool.addDate(start));
				}else{
					return AjaxBean.getInstance("success");
				}
			}else{
				return AjaxBean.getInstance("success");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(RepairService t){
		try{
			RepairService tt=repairServiceService.findOne(t.getId());
			tt.setStatus(Constants.NUMBER_SIGN_00);
			repairServiceService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}

	@RequestMapping(value="getPadding")
	@ResponseBody
	public AjaxBean getPaddingAjax(){
		try{
			List<RepairService> tt=repairServiceService.findPadding();
			if(tt!=null && tt.size()>0){
				String id="";
				for(RepairService t:tt){
					id+=t.getOrders()+",";
				}
				if(StringUtils.isNotBlank(id)){
					id=id.substring(0,id.length()-1);
				}
				return AjaxBean.getInstance("error",id);
			}else{
				return AjaxBean.getInstance("success");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	@RequestMapping(value="/editOne/{id}")
	public String editOne(@PathVariable("id") String id,RepairService t,ModelMap map, String _method,String _fuc){
		t=repairServiceService.findOne(id);
		_fuc="修改";
		_method="put";
		map.put("_method", _method);
		map.put("_fuc", _fuc);
		map.put("t", t);
		map.put(Constants.FIRST_SHOW,Constants.CLASS_NOT_HIDE);
		map.put(Constants.FIRST_HIDE,Constants.CLASS_HIDE);
		map.put(Constants.READ_ONLY_ONE,Constants.READ_ONLY_NO);
		map.put(Constants.READ_ONLY_TWO,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_THRESS,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_FORE,Constants.READ_ONLY_YES);
		return viewName(VIEW_OPER);
	}
	
	@RequestMapping(value="/editTwo/{id}")
	public String editTwo(@PathVariable("id") String id,RepairService t,ModelMap map, String _method,String _fuc){
		t=repairServiceService.findOne(id);
		_fuc="修改";
		_method="put";
		map.put("_method", _method);
		map.put("_fuc", _fuc);
		map.put("t", t);
		map.put(Constants.FIRST_SHOW,Constants.CLASS_HIDE);
		map.put(Constants.FIRST_HIDE,Constants.CLASS_NOT_HIDE);
		map.put(Constants.READ_ONLY_ONE,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_TWO,Constants.READ_ONLY_NO);
		map.put(Constants.READ_ONLY_THRESS,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_FORE,Constants.READ_ONLY_YES);
		return viewName(VIEW_OPER);
	}
	
	@RequestMapping(value="/editThress/{id}")
	public String editThress(@PathVariable("id") String id,RepairService t,ModelMap map, String _method,String _fuc){
		t=repairServiceService.findOne(id);
		_fuc="修改";
		_method="put";
		map.put("_method", _method);
		map.put("_fuc", _fuc);
		map.put("t", t);
		map.put(Constants.FIRST_SHOW,Constants.CLASS_HIDE);
		map.put(Constants.FIRST_HIDE,Constants.CLASS_NOT_HIDE);
		map.put(Constants.READ_ONLY_ONE,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_TWO,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_THRESS,Constants.READ_ONLY_NO);
		map.put(Constants.READ_ONLY_FORE,Constants.READ_ONLY_YES);
		return viewName(VIEW_OPER);
	}
	
	@RequestMapping(value="/editFore/{id}")
	public String editFore(@PathVariable("id") String id,RepairService t,ModelMap map, String _method,String _fuc){
		t=repairServiceService.findOne(id);
		_fuc="修改";
		_method="put";
		map.put("_method", _method);
		map.put("_fuc", _fuc);
		map.put("t", t);
		map.put(Constants.FIRST_SHOW,Constants.CLASS_HIDE);
		map.put(Constants.FIRST_HIDE,Constants.CLASS_NOT_HIDE);
		map.put(Constants.READ_ONLY_ONE,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_TWO,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_THRESS,Constants.READ_ONLY_YES);
		map.put(Constants.READ_ONLY_FORE,Constants.READ_ONLY_NO);
		return viewName(VIEW_OPER);
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(RepairService t,HttpServletRequest request,@RequestParam(value="finishFlag") String finishFlag){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String no=repartNoService.updateMaxNo(serviceType.REPAIR,user.getId(),date,Constants.REPAIR_NO_PRE_FIX);
			t.setOrders(no);
			t.setAcceptDate(date);
			t.setAcceptUser(user.getuName());
			t.setAcceptUserId(user.getId());
			if(Constants.NUMBER_SIGN_1.equals(finishFlag)){
				t.setStatus(Constants.NUMBER_SIGN_0);
			}else{
				t.setStatus(null);
			}
			repairServiceService.save(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean updateAjaxs(RepairService t,HttpServletRequest request,@RequestParam(value="finishFlag") String finishFlag){
		try{
			// 工程师保存 flag = 1
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(Constants.NUMBER_SIGN_1.equals(finishFlag)){
				if(StringUtils.isEmpty(t.getStatus())){
					t.setStatus(Constants.NUMBER_SIGN_0);
				}
				if(StringUtils.isNotEmpty(t.getArrivalTime()) && StringUtils.isNotEmpty(t.getEngineerId()) && (Constants.NUMBER_SIGN_0.equals(t.getStatus()) || Constants.NUMBER_SIGN_5.equals(t.getStatus()))){
					t.setStatus(Constants.NUMBER_SIGN_2);
				}
				if(StringUtils.isNotEmpty(t.getSurveyorDate()) && StringUtils.isNotEmpty(t.getFaultReason()) && Constants.NUMBER_SIGN_2.equals(t.getStatus())){
					//进入下一流程，Dell 协调。
					t.setStatus(Constants.NUMBER_SIGN_3);
					t.setSurveyor(user.getuName());
//					t.setSurveyorDate(date);
					t.setSurveyorId(user.getId());
				}
				if(StringUtils.isEmpty(t.getExpressArrivalTime()) && Constants.NUMBER_SIGN_3.equals(t.getStatus())){
					t.setStatus(Constants.NUMBER_SIGN_4);
					t.setExpressStaff(user.getuName());
					t.setExpressFinishDate(date);
					t.setExpressStaffId(user.getId());
				}
				if(StringUtils.isNotEmpty(t.getExpressArrivalTime()) && (Constants.NUMBER_SIGN_3.equals(t.getStatus()) || Constants.NUMBER_SIGN_4.equals(t.getStatus()))){
					t.setStatus(Constants.NUMBER_SIGN_1);
					t.setLibraryStaff(user.getuName());
					t.setLibraryFinishDate(date);
					t.setLibraryStaffId(user.getId());
				}
			}else{
				if(StringUtils.isEmpty(t.getStatus())){
					t.setStatus(null);
				}
			}
			repairServiceService.update(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSaveRepeat",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxsTwo(RepairService t,HttpServletRequest request,@RequestParam(value="finishFlag") String finishFlag){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String no=repartNoService.updateMaxNo(serviceType.REPAIR,user.getId(),date,Constants.REPAIR_NO_PRE_FIX);
			t.setOrders(no);
			t.setAcceptDate(date);
			t.setAcceptUser(user.getuName());
			t.setAcceptUserId(user.getId());
			t.setStatus(Constants.NUMBER_SIGN_5);
			repairServiceService.save(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSaveRepeat",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean updateAjaxsTwo(RepairService t,HttpServletRequest request,@RequestParam(value="finishFlag") String finishFlag){
		try{
			t.setStatus(Constants.NUMBER_SIGN_2);
			repairServiceService.update(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


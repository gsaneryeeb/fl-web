package cn.mk.ndms.modules.part.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.DoorRepairService;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Station;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.part.web.vo.DoorRepairServiceOutbound;
import cn.mk.ndms.modules.service.service.DoorRepairServiceService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.ProjectVo;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.common.Global;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/outbound")
public class OutboundController extends GenericCRUDController<Outbound, String>
{
	@Autowired
	private OutboundService outboundService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private StationService stationService;
	
	@Autowired
	private DoorRepairServiceService doorRepairServiceService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.OUTBOUND_PAGENAME;
	}
	
	@ModelAttribute(value="status")
	public Map<String,String> status(ModelMap model){
		return Constants.MAP_PROJECT_TYPE;
	}
	
	@ModelAttribute(value="statusService")
	public Map<String,String> statusService(ModelMap model){
		return Constants.MAP_COMMON_REPAIRSERVICE_STATUS;
	}
	
	
	@ModelAttribute(value = "parts")
	public List<Part> getParts(HttpServletRequest request){
		return partService.findAllByStatus();
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "projects")
	public List<ProjectVo> getProjects(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		return projects.get(Constants.SERVICE_TYPE_CUSTOMER_SERVICE_NO);
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "stations")
	public List<Station> getStations(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		List<ProjectVo> pList=projects.get(Constants.SERVICE_TYPE_CUSTOMER_SERVICE_NO);
		List<String> pIds=new ArrayList<String>();
		if(pList!=null && !pList.isEmpty()){
			for(ProjectVo p:pList){
				pIds.add(p.getId());
			}
		}
		return stationService.findAllByStatusAndProjectIds(pIds);
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Outbound t){
		try{
			Outbound tt=outboundService.findOne(t.getId());
			tt.setStatus(Constants.NUMBER_SIGN_00);
			outboundService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}

	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(DoorRepairServiceOutbound t,@RequestParam(value="returnFlag") String returnFlag,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			Outbound ob=new Outbound();
			Station staion=stationService.findOne(t.getStationId());
			ob.setStationNo(staion.getNo());
			ob.setStationId(staion.getId());
			ob.setStation(staion.getName());
			ob.setCallno(t.getCallno());
			ob.setRqNo(t.getDoorId());
			ob.setApplyDate(t.getApplyDate());
			Part p=partService.findOne(t.getApp_partId());
			ob.setApplyParts(p.getNo());
			ob.setApplyPartsId(p.getId());
			ob.setShelves(p.getRack());
			ob.setPartsDes(p.getPartDes());
			ob.setApplyNumber(t.getApplyNumber());
			ob.setMachineModel(t.getMachineModel());
			ob.setSerialNumber(t.getSerialNumber());
			ob.setCusName(t.getCusName());
			ob.setRepairType(t.getType());
			ob.setProjectIdFk(t.getProjectId());
			ob.setOperUser(user.getuName());
			ob.setOperUserId(user.getId());
			ob.setOperDate(date);
			ob.setStatus(Constants.NUMBER_SIGN_0);
			ob.setReturnFlag(returnFlag);
			ob.setIsReturn(Constants.NUMBER_SIGN_0);
			outboundService.save(ob);
			DoorRepairService rq=doorRepairServiceService.findOne(t.getDoorId());
			rq.setNeedPart(Constants.SHORT_SIGN_1);
			rq.setStatus(Constants.NUMBER_SIGN_3);
			rq.setFinishDate(date);
			rq.setReturnFlag(returnFlag);
			rq.setIsReturn(Constants.NUMBER_SIGN_0);
			doorRepairServiceService.update(rq);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="doorRepairOutBound")
	public String doorRepairOutBound(ModelMap map,String id){
		String date=DateTool.longFormat(new Date());
		map.put("appr_date", date);
		map.put("t", doorRepairServiceService.findOne(id));
		return "part/outbound/doorRepairOut";
	}
	
	@RequestMapping(value = "hisPages")
	public String toHisPages(Model model, HttpServletRequest request,@RequestParam(value="search_LIKE_outOrder") String search_LIKE_outOrder,@RequestParam(value="search_LIKE_callno") String search_LIKE_callno,@RequestParam(value="search_LIKE_station") String search_LIKE_station) throws ParseException {
		int page = (request.getParameter("page") == null || "".equals(request.getParameter("page"))) ? 0 : Integer.parseInt(request.getParameter("page"));
		int size = (request.getParameter("pageSize") == null || "".equals(request.getParameter("page"))) ? Global.getPageSize() : Integer.parseInt(request.getParameter("pageSize"));
		PageRequest pageRequest = new PageRequest(page, size);
		Page<Outbound> pageList = outboundService.findPageBySearchs(pageRequest, search_LIKE_outOrder,search_LIKE_callno,search_LIKE_station);
		model.addAttribute("pageHis", pageList);
		model.addAttribute("_pageSize", size);
		model.addAttribute("_page", page);
		model.addAttribute("_totalPage", pageList.getTotalPages());
		model.addAttribute("search_LIKE_outOrder",search_LIKE_outOrder);
		model.addAttribute("accessPath", getViewPrefix()+"/hisPage");
		return "part/outbound/hisPage";
	}
}


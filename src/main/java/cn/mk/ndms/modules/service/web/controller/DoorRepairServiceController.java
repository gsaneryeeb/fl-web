package cn.mk.ndms.modules.service.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.DoorRepairService;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Project;
import cn.mk.ndms.domain.Station;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.part.web.vo.DoorRepairServiceOutbound;
import cn.mk.ndms.modules.service.service.DoorRepairServiceService;
import cn.mk.ndms.modules.sys.service.CallNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.ProjectService;
import cn.mk.ndms.modules.sys.service.RepartNoService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.ProjectVo;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("service/doorRepairService")
public class DoorRepairServiceController extends GenericCRUDController<DoorRepairService, String>
{
	@Autowired
	private DoorRepairServiceService doorRepairServiceService;
	
	@Autowired
	private CallNoService callNoService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private RepartNoService repartNoService;
	
	@Autowired
	private StationService stationService;
	
	@Autowired
	private PartService partService;
	
	
	@Autowired
	private OutboundService outboundService;
	
	@ModelAttribute(value = "projects")
	public List<Project> getProjects(){
		return projectService.findAllByStatus();
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
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "projects")
	public List<ProjectVo> getProjects(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		return projects.get(Constants.SERVICE_TYPE_CUSTOMER_SERVICE_NO);
	}
	
	@ModelAttribute(value = "status")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_DOOR_REPAIR_STATUS;
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
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.DOORREPAIRSERVICE_PAGENAME;
	}
	
	@ModelAttribute(value = "viewStatus")
	public Map<String,String> setViewStatus()
	{
		return Constants.MAP_DOOR_REPAIR_STATUS;
	}
	
	@ModelAttribute(value = "DISABLE")
	public boolean setDisable()
	{
		return false;
	}
	
	@RequestMapping(value="editRepair")
	public String editRepair(HttpServletRequest request,@RequestParam(value="id",required=false) String id,ModelMap map){
		DoorRepairService doorRepairService=doorRepairServiceService.findOne(id);
		map.put("t", doorRepairService);
		map.put("tt",outboundService.findByRqNo(doorRepairService.getId()));
		map.put("DISABLE",true);
		return "service/doorRepairService/oper";
	}
	
	@RequestMapping(value="myDetail")
	public String myDetail(HttpServletRequest request,@RequestParam(value="id") String id,ModelMap map){
		DoorRepairService doorRepairService=doorRepairServiceService.findOne(id);
		map.put("t", doorRepairService);
		map.put("tt",outboundService.findByRqNo(doorRepairService.getId()));
		map.put("DISABLE",true);
		return "service/doorRepairService/detail";
	}
	
	
	@ModelAttribute(value = "faultTypes")
	public Map<String,String> setFaultTypes()
	{
		return Constants.MAP_FAULT_TYPE;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(DoorRepairService t){
		try{
			DoorRepairService tt=doorRepairServiceService.findOne(t.getId());
			Outbound outbound=outboundService.findByRqNo(tt.getId());
			if(outbound == null){
				tt.setStatus(Constants.NUMBER_SIGN_00);
				tt.setFinishStatus(Constants.NUMBER_SIGN_1);
				tt.setFinishDate(DateTool.longFormat(new Date()));
				doorRepairServiceService.update(tt);
				return AjaxBean.getInstance("success");
			}else{
				if(outbound.getStatus().equals(Constants.NUMBER_SIGN_0) || outbound.getStatus().equals(Constants.NUMBER_SIGN_4)){
					tt.setStatus(Constants.NUMBER_SIGN_00);
					tt.setFinishStatus(Constants.NUMBER_SIGN_1);
					tt.setFinishDate(DateTool.longFormat(new Date()));
					doorRepairServiceService.update(tt);
					outbound.setStatus(Constants.NUMBER_SIGN_00);
					outboundService.update(outbound);
					return AjaxBean.getInstance("success");
				}else{
					return AjaxBean.getInstance("error","备件已出库,不能取消订单!");
				}
			}
			
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="changeFlagFinish")
	@ResponseBody
	public AjaxBean changeFlagFinishAjax(DoorRepairService t){
		try{
			DoorRepairService tt=doorRepairServiceService.findOne(t.getId());
			tt.setFinishStatus(Constants.NUMBER_SIGN_1);
			tt.setStatus(Constants.NUMBER_SIGN_1);
			tt.setFinishDate(DateTool.longFormat(new Date()));
			doorRepairServiceService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(DoorRepairService t,DoorRepairServiceOutbound doorRepairServiceOutbound,@RequestParam(value="_faultType",required=false) String _faultType,@RequestParam(value="returnFlag",required=false) String returnFlag,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String callNo=callNoService.updateMaxNoByDoor(serviceType.CUSTOMER_SERVICE,user.getId(),date);
			String no=repartNoService.updateMaxNo(serviceType.HELP_DESK,user.getId(),date,Constants.CUSTOMER_SERVICE_NO_PRE_FIX);
			t.setOrders(no);
			t.setType(t.getType());
			t.setCallno(callNo);
			t.setAcceptPersonId(user.getId());
			t.setAcceptPersonName(user.getuName());
			t.setTakeDate(date);
			t.setFirstDate(date);
			t.setStatus(Constants.NUMBER_SIGN_0);
			t.setFinishStatus(Constants.NUMBER_SIGN_0);

			if(t.getFaultHandling()==null){
				t.setFaultType(null);
				t.setProcessDes(null);
				t.setProcessCost(null);
				t.setRepairPersonId(null);
				t.setRepairRersonName(null);
				t.setRepairDate(null);
			}else{
				if(Constants.NUMBER_SIGN_2.equals(t.getFaultHandling().toString())){
					t.setStatus(Constants.NUMBER_SIGN_2);
					t.setFaultType(null);
					t.setProcessDes(null);
					t.setProcessCost(null);
					t.setRepairPersonId(null);
					t.setRepairRersonName(null);
					t.setRepairDate(null);
				}else if(Constants.NUMBER_SIGN_3.equals(t.getFaultHandling().toString())){
					t.setStatus(Constants.NUMBER_SIGN__2);
					t.setFaultType(null);
					t.setProcessDes(null);
					t.setProcessCost(null);
					t.setRepairPersonId(null);
					t.setRepairRersonName(null);
					t.setRepairDate(null);
				}else{
					if(StringUtils.isNotEmpty(t.getFaultType())){
						if("HARD".equals(t.getFaultType())){
							t.setStatus(Constants.NUMBER_SIGN_6);
							if(t.getNeedPart()!=null && Constants.NUMBER_SIGN_1.equals(t.getNeedPart().toString())){
								t.setStatus(Constants.NUMBER_SIGN_3);
								if(t.getProcessCost()!=null && t.getProcessCost().doubleValue()>0){
									t.setStatus(Constants.NUMBER_SIGN_4);
								}
							}
						}else{
							t.setStatus(Constants.NUMBER_SIGN_5);
							if(t.getProcessCost()!=null && t.getProcessCost().doubleValue()>0){
								t.setStatus(Constants.NUMBER_SIGN_4);
							}
						}
					}
					t.setRepairPersonId(user.getId());
					t.setRepairRersonName(user.getuName());
				}
			}
			t.setFaultType(_faultType);
			t.setFinishDate(date);
			DoorRepairService tt=doorRepairServiceService.save(t);
			String id=tt.getId();
			if("HARD".equals(t.getFaultType())){
				Outbound ob=new Outbound();
				Station staion=stationService.findOne(doorRepairServiceOutbound.getStationId());
				ob.setStationNo(staion.getNo());
				ob.setStationId(staion.getId());
				ob.setStation(staion.getName());
				ob.setCallno(t.getCallno());
				ob.setRqNo(tt.getId());
				ob.setApplyDate(doorRepairServiceOutbound.getApplyDate());
				Part p=partService.findOne(doorRepairServiceOutbound.getApp_partId());
				ob.setApplyParts(p.getNo());
				ob.setApplyPartsId(p.getId());
				ob.setShelves(p.getRack());
				ob.setPartsDes(p.getPartDes());
				ob.setApplyNumber(doorRepairServiceOutbound.getApplyNumber());
				ob.setMachineModel(doorRepairServiceOutbound.getMachineModel());
				ob.setSerialNumber(doorRepairServiceOutbound.getSerialNumber());
				ob.setCusName(t.getCusName());
				ob.setRepairType(t.getType());
				ob.setProjectIdFk(tt.getProjectIdFk());
				ob.setOperUser(user.getuName());
				ob.setOperUserId(user.getId());
				ob.setOperDate(date);
				ob.setStatus(Constants.NUMBER_SIGN_0);
				ob.setReturnFlag(Constants.NUMBER_SIGN_1);
				ob.setIsReturn(Constants.NUMBER_SIGN_0);
				outboundService.save(ob);
				tt.setNeedPart(Constants.SHORT_SIGN_1);
				tt.setStatus(Constants.NUMBER_SIGN_3);
				tt.setFinishDate(date);
				tt.setReturnFlag(Constants.NUMBER_SIGN_1);
				tt.setIsReturn(Constants.NUMBER_SIGN_0);
				doorRepairServiceService.update(tt);
			}
			return AjaxBean.getInstance("success","","",id);
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean updateAjaxs(DoorRepairService t,@RequestParam(value="_faultType",required=false) String _faultType,@RequestParam(value="returnFlag",required=false) String returnFlag,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			DoorRepairService tt=doorRepairServiceService.findOne(t.getId());
			t.setTakeDate(tt.getTakeDate());
			t.setFirstDate(tt.getFinishDate());
			t.setAcceptPersonId(tt.getAcceptPersonId());
			t.setAcceptPersonName(tt.getAcceptPersonName());
			t.setStatus(Constants.NUMBER_SIGN_0);
			t.setFinishStatus(Constants.NUMBER_SIGN_0);
			t.setFaultType(tt.getFaultType());
			t.setReturnFlag(tt.getReturnFlag());
			t.setIsReturn(tt.getIsReturn());
			t.setFaultHandlingRemark(t.getFaultHandlingRemark());
			if(t.getFaultHandling()==null){
				t.setProcessDes(null);
				t.setProcessCost(null);
				t.setRepairPersonId(null);
				t.setRepairRersonName(null);
				t.setRepairDate(null);
			}else{
				if(Constants.NUMBER_SIGN_2.equals(t.getFaultHandling().toString())){
					t.setStatus(Constants.NUMBER_SIGN_2);
					t.setProcessDes(null);
					t.setProcessCost(null);
					t.setRepairPersonId(null);
					t.setRepairRersonName(null);
					t.setRepairDate(null);
				}else if(Constants.NUMBER_SIGN_3.equals(t.getFaultHandling().toString())){
					t.setStatus(Constants.NUMBER_SIGN__2);
					t.setProcessDes(null);
					t.setProcessCost(null);
					t.setRepairPersonId(null);
					t.setRepairRersonName(null);
					t.setRepairDate(null);
				}else{
					if(StringUtils.isNotEmpty(t.getFaultType())){
						if("HARD".equals(t.getFaultType())){
							t.setStatus(Constants.NUMBER_SIGN_6);
							if(t.getNeedPart()!=null && Constants.NUMBER_SIGN_1.equals(t.getNeedPart().toString())){
								t.setStatus(Constants.NUMBER_SIGN_3);
								if(t.getProcessCost()!=null && t.getProcessCost().doubleValue()>=0){
									t.setStatus(Constants.NUMBER_SIGN_4);
								}
							}
						}else{
							t.setStatus(Constants.NUMBER_SIGN_5);
							if(t.getProcessCost()!=null && t.getProcessCost().doubleValue()>=0){
								t.setStatus(Constants.NUMBER_SIGN_4);
							}
						}
					}else{
						t.setStatus(Constants.NUMBER_SIGN_5);
						if(t.getProcessCost()!=null && t.getProcessCost().doubleValue()>=0){
							t.setStatus(Constants.NUMBER_SIGN_4);
						}
					}
					t.setRepairPersonId(user.getId());
					t.setRepairRersonName(user.getuName());
				}
			}
			t.setFinishDate(date);
			doorRepairServiceService.update(t);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


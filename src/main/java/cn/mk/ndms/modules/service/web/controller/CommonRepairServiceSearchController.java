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

import cn.mk.ndms.domain.CommonRepairService;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Station;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.part.web.vo.DoorRepairServiceOutbound;
import cn.mk.ndms.modules.service.service.CommonRepairServiceService;
import cn.mk.ndms.modules.service.web.vo.StationVo;
import cn.mk.ndms.modules.sys.service.OutNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.ProjectVo;
import cn.mk.ndms.util.Constants.serviceType;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("service/commonRepairServicesSearch")
public class CommonRepairServiceSearchController extends GenericCRUDController<CommonRepairService, String>
{
	@Autowired
	private CommonRepairServiceService commonRepairServiceService;
	
	@Autowired
	private OutboundService outboundService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private StationService stationService;
	
	@Autowired
	private OutNoService outNoService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.COMMONREPAIRSERVICE_PAGENAME;
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
	
	@ModelAttribute(value="status")
	public Map<String,String> status(ModelMap model){
		return Constants.MAP_PROJECT_TYPE;
	}
	
	@ModelAttribute(value="statusService")
	public Map<String,String> statusService(ModelMap model){
		return Constants.MAP_COMMON_REPAIRSERVICE_STATUS;
	}
	
	@RequestMapping(value="main")
	public String toMain(ModelMap model){
		return "service/commonRepairService/main";
	}
	
	@RequestMapping(value="addParts")
	public String add(ModelMap map){
		return "part/outbound/common_parts";
	}
	
	@RequestMapping(value="stationsGrop")
	public String stationsGrop(ModelMap model){
		List<StationVo> vo=outboundService.stationsGrop();
		model.put("stations", vo);
		return "service/commonRepairService/station";
	}
	
	@RequestMapping(value="searchStationsGrop")
	public String searchStationsGrop(ModelMap model,@RequestParam(value="callno") String callno,@RequestParam(value="station") String station){
		List<StationVo> vo=outboundService.stationsGrop(callno,station);
		model.put("stations", vo);
		return "service/commonRepairService/station";
	}
	
	@RequestMapping(value="commonRepairServices")
	public String toCommonRepairServices(ModelMap model,@RequestParam(value="stationId") String stationId){
		if(StringUtils.isNotEmpty(stationId)){
			model.put("commonRepairServices", outboundService.findByServiceByStationId(stationId));
		}
		return "service/commonRepairService/commonRepairServices";
	}
	
	@ModelAttribute(value = "parts")
	public List<Part> getParts(HttpServletRequest request){
		return partService.findAllByStatus();
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "projects")
	public List<ProjectVo> getProjects(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		return projects.get(Constants.SERVICE_TYPE_IBM_NO);
	}
	
	@SuppressWarnings("unchecked")
	@ModelAttribute(value = "stations")
	public List<Station> getStations(HttpServletRequest request){
		Map<String,List<ProjectVo>> projects=(Map<String,List<ProjectVo>>)request.getSession().getAttribute("USER_PROJECT");
		List<ProjectVo> pList=projects.get(Constants.SERVICE_TYPE_IBM_NO);
		List<String> pIds=new ArrayList<String>();
		if(pList!=null && !pList.isEmpty()){
			for(ProjectVo p:pList){
				pIds.add(p.getId());
			}
		}
		return stationService.findAllByStatusAndProjectIds(pIds);
	}
	
	@RequestMapping(value="addService")
	public String addService(){
		return "part/outbound/commonRepairService";
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(DoorRepairServiceOutbound t,@RequestParam(value="returnFlag") String returnFlag,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			
			Station staion=stationService.findOne(t.getStationId());
			String[] ids=t.getPartIds();
			String[] names=t.getPartses();
			String[] des=t.getRemarks();
			Integer[] num=t.getNumbers();
			if(ids!=null && ids.length>0){
				for(int i=0;i<ids.length;i++){
					CommonRepairService cr=new CommonRepairService();
					cr.setCusName(t.getCusName());
					cr.setMachineModel(t.getMachineModel());
					cr.setType(t.getP_type());
					cr.setSerialNumber(t.getSerialNumber());
					cr.setStationIdFk(staion.getId());
					cr.setStation(staion.getName());
					cr.setCallno(t.getCallno());
					cr.setApplyDate(t.getApplyDate());
					cr.setApplyParts(names[i]);
					cr.setApplyPartsId(ids[i]);
					cr.setPartsDes(des[i]);
					cr.setApplyNumber(num[i]);
					cr.setRepairType(t.getType());
					cr.setProjectIdFk(t.getProjectId());
					cr.setOperUser(user.getuName());
					cr.setOperUserId(user.getId());
					cr.setFinishDate(date);
					cr.setReturnFlag(returnFlag);
					cr.setIsReturn(Constants.NUMBER_SIGN_0);
					cr.setStatus(Constants.NUMBER_SIGN_0);
					cr.setCusAddress(t.getCusAddress());
					cr.setCusDep(t.getCusDep());
					cr.setCusTel(t.getCusTel());
					cr.setCusContactTime(t.getCusContactTime());
					cr.setStaffNo(t.getStaffNo());
					cr.setAllocateEngineer(t.getAllocateEngineer());
					cr.setServiceNo(t.getServiceNo());
					cr.setFault(t.getFault());
					cr.setFaultRemark(t.getFaultRemark());
					cr.setSolutionTime(t.getSolutionTime());
					CommonRepairService c=commonRepairServiceService.save(cr);
					
					Outbound ob=new Outbound();
					ob.setReturnFlag(returnFlag);
					ob.setStationNo(staion.getNo());
					ob.setStationId(staion.getId());
					ob.setStation(staion.getName());
					ob.setMachineModel(t.getMachineModel());
					ob.setSerialNumber(t.getSerialNumber());
					ob.setCallno(t.getCallno());
					ob.setApplyDate(t.getApplyDate());
					Part p=partService.findOne(ids[i]);
					ob.setShelves(p.getRack());
					ob.setRqNo(c.getId());
					ob.setApplyParts(names[i]);
					ob.setApplyPartsId(ids[i]);
					ob.setPartsDes(des[i]);
					ob.setApplyNumber(num[i]);
					ob.setRepairType(t.getType());
					ob.setProjectIdFk(t.getProjectId());
					ob.setOperUser(user.getuName());
					ob.setOperUserId(user.getId());
					ob.setOperDate(date);
					ob.setCusName(t.getCusName());
					ob.setStatus(Constants.NUMBER_SIGN_0);
					ob.setIsReturn(Constants.NUMBER_SIGN_0);
					outboundService.save(ob);
				}
			}
			
 			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(@RequestParam(value="ids") String[] ids,@RequestParam(value="oper") String oper){
		try{
			if(ids!=null && ids.length>0){
				for(int i=0;i<ids.length;i++){
					Outbound tt=outboundService.findOne(ids[i]);
					if("order".equals(oper)){
						tt.setStatus(Constants.NUMBER_SIGN_2);
					}else if("cancel".equals(oper)){
						tt.setStatus(Constants.NUMBER_SIGN_00);
					}
					tt.setFinishDate(DateTool.longFormat(new Date()));
					outboundService.update(tt);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="outBound")
	@ResponseBody
	public AjaxBean outBound(@RequestParam(value="ids") String[] ids,@RequestParam(value="actualUseParts") String[] actualUseParts,
			@RequestParam(value="actualUsePartIds") String[] actualUsePartIds,@RequestParam(value="shelveses") String[] shelveses,
			@RequestParam(value="inventoryNumbers") Integer[] inventoryNumbers,@RequestParam(value="newOrOld") String[] newOrOld,
			HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(actualUseParts!=null && actualUseParts.length>0){
				for(int i=0;i<actualUseParts.length;i++){
					Outbound tt=outboundService.findOne(ids[i]);
					String no=outNoService.updateMaxNo(serviceType.IBM,user.getId(),date,Constants.OUT_NO_PRE_FIX);
					Part p=partService.findOne(actualUsePartIds[i]);
					tt.setActualUsePart(actualUseParts[i]);
					tt.setActualUsePartId(actualUsePartIds[i]);
					if(shelveses!=null && shelveses.length>0){
						tt.setShelves(shelveses[i]);
					}
					tt.setOutOrder(no);
					tt.setNewOrOld(newOrOld[i]);
					tt.setInventoryNumber(inventoryNumbers[i]);
					tt.setStatus(Constants.NUMBER_SIGN_3);
					tt.setUseNumber(tt.getApplyNumber());
					p.setNumber(p.getNumber()==null?0:p.getNumber().intValue()-tt.getApplyNumber());
					//if(Constants.NEW.equals(newOrOld[i])){
					int c=p.getNewNumber()==null?0-tt.getApplyNumber():p.getNewNumber().intValue()-tt.getApplyNumber();
					if(c>0){
						p.setNewNumber(c);
					}else{
						p.setNewNumber(0);
						p.setOldNumber(p.getOldNumber()==null?0+c:p.getOldNumber().intValue()+c);
					}
						
					//}else{
						
					//}
					p.setLocks(p.getLocks()==null?0:p.getLocks()+tt.getApplyNumber());
					partService.update(p);
					outboundService.update(tt);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
}


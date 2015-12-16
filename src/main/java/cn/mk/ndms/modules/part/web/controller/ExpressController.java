package cn.mk.ndms.modules.part.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.CommonRepairService;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.service.service.CommonRepairServiceService;
import cn.mk.ndms.modules.service.service.DoorRepairServiceService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StationService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/express")
public class ExpressController extends GenericCRUDController<Outbound, String>
{
	@Autowired
	private OutboundService outboundService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private StationService stationService;
	
	@Autowired
	private DoorRepairServiceService doorRepairServiceService;
	
	@Autowired
	private CommonRepairServiceService commonRepairServiceService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.EXPRESS_PAGENAME;
	}
	
	@ModelAttribute(value = "status")
	public Map<String,String> getStatus(HttpServletRequest request){
		return Constants.MAP_COMMON_REPAIRSERVICE_STATUS;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids){
		try{
			if(ids!=null && ids.length>0){
				User user=(User)request.getSession().getAttribute("USER");
				for(int i=0;i<ids.length;i++){
					Outbound tt=outboundService.findOne(ids[i]);
					tt.setStatus(Constants.NUMBER_SIGN_00);
					tt.setExpressStaff(user.getuName());
					tt.setExpressStaffId(user.getId());
					
					String partsId=tt.getActualUsePartId();
					Part part=partService.findOne(partsId);
					part.setNumber(part.getNumber()+tt.getApplyNumber());
					if(Constants.NEW.equals(tt.getNewOrOld())){
						part.setNewNumber(part.getNewNumber().intValue()+tt.getApplyNumber());
					}else{
						part.setOldNumber(part.getOldNumber().intValue()+tt.getApplyNumber());
					}
					part.setLocks(part.getLocks()-tt.getApplyNumber());
					partService.update(part);
					outboundService.update(tt);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}

	@RequestMapping(value="transport")
	@ResponseBody
	public AjaxBean transportAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids,
			@RequestParam(value="expressNos") String[] expressNos,@RequestParam(value="sendTimes") String[] sendTimes
			,@RequestParam(value="fedexs") String[] fedexs,@RequestParam(value="iis") String[] iis){
		try{
			if(ids!=null && ids.length>0){
				User user=(User)request.getSession().getAttribute("USER");
				String date=DateTool.longFormat(new Date());
				for(int i=0;i<ids.length;i++){
					Outbound tt=outboundService.findOne(ids[i]);
					tt.setStatus(Constants.NUMBER_SIGN_4);
					if(iis.length>1){
						tt.setIis(iis[i]);
					}else if(iis.length==1){
						tt.setIis(iis[0]);
					}
					tt.setExpressStaff(user.getuName());
					tt.setExpressStaffId(user.getId());
					tt.setExpressFinishDate(date);
					tt.setExpressNo(expressNos[i]);
					tt.setSendTime(sendTimes[i]);
					tt.setFedex(fedexs[i]);
					if(tt.getIsRepeat()!=null && "1".equals(tt.getIsRepeat())){
						CommonRepairService commonRepairService=commonRepairServiceService.findOne(tt.getRqNo());
						if(commonRepairService!=null){
							commonRepairService.setIsRepeat(tt.getIsRepeat());
							commonRepairServiceService.update(commonRepairService);
						}
					}
					String partsId=tt.getActualUsePartId();
					Part part=partService.findOne(partsId);
					part.setLocks(part.getLocks()-tt.getApplyNumber());
					partService.update(part);
					outboundService.update(tt);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="checkStationAndNo")
	@ResponseBody
	public AjaxBean checkStationAndNo(HttpServletRequest request,@RequestParam(value="no") String no,
			@RequestParam(value="station") String station,@RequestParam(value="id") String id){
		try{
			Outbound tt=outboundService.findOne(id);
			List<Outbound> outboundList=outboundService.findByNoAndNotStationId(no,tt.getStationId());
			if(outboundList!=null && !outboundList.isEmpty()){
				return AjaxBean.getInstance("error");
			}else{
				return AjaxBean.getInstance("success");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="sign")
	@ResponseBody
	public AjaxBean signAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids,
			@RequestParam(value="arrivalTimes") String[] arrivalTimes){
		try{
			if(ids!=null && ids.length>0){
				User user=(User)request.getSession().getAttribute("USER");
				String date=DateTool.longFormat(new Date());
				for(int i=0;i<ids.length;i++){
					Outbound tt=outboundService.findOne(ids[i]);
					tt.setStatus(Constants.NUMBER_SIGN_1);
					tt.setIssueMan(user.getuName());
					tt.setIssueManId(user.getId());
					tt.setArrivalTime(arrivalTimes[i]);
					tt.setFinishDate(date);
					outboundService.update(tt);
				}
			}
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
}


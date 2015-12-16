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

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.StoreAdjustment;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.domain.Wac;
import cn.mk.ndms.modules.part.service.StoreAdjustmentService;
import cn.mk.ndms.modules.sys.service.AdjustNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.SupiroService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.modules.sys.service.WacService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/storeAdjustment")
public class StoreAdjustmentController extends GenericCRUDController<StoreAdjustment, String>
{
	@Autowired
	private StoreAdjustmentService storeAdjustmentService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private SupiroService supiroService;
	
	@Autowired
	private AdjustNoService adjustNoService;
	
	@Autowired
	private WacService wacService;
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute(value = "status")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_STORE_ADJUSTMENT_STATUS;
	}
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.STORAGE_ADJUSTMENT_PAGENAME;
	}
	
	@ModelAttribute(value = "wacs")
	public List<Wac> getWac(){
		return wacService.findAll();
	}
	
	@RequestMapping(value="bachSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="partses") String[] partses,
			@RequestParam(value="partNames") String[] partNames,
			@RequestParam(value="partIds") String[] partIds,@RequestParam(value="numbers") Integer[] numbers,
			@RequestParam(value="wacs") Double[] wacs,@RequestParam(value="types") String[] types,
			@RequestParam(value="totals") Double[] totals,@RequestParam(value="applyReasons") String[] applyReasons,
			@RequestParam(value="approvalRemarks") String[] approvalRemarks
			){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(partIds!=null && partIds.length>0){
				String no=adjustNoService.updateMaxNo(serviceType.A,user.getId(),date,Constants.ADJUST_NO_PRE_FIX);
				for(int i=0;i<partIds.length;i++){
					StoreAdjustment tt=new StoreAdjustment();
					tt.setNo(no);
					tt.setPartName(partNames[i]);
					tt.setApplyDate(date);
					tt.setApplyUserId(user.getId());
					tt.setApplyUserName(user.getuName());
					tt.setApplyReason(applyReasons[i]);
					tt.setNumber(numbers[i]);
					tt.setParts(partses[i]);
					tt.setPartsId(partIds[i]);
					tt.setTotalPrice(totals[i]);
					tt.setApprovalRemark(approvalRemarks[i]);
					tt.setType(types[i]);
					if(Constants.NEW.equals(types[i])){
						if(wacs!=null && wacs.length>0){
							tt.setPrice(wacs[i]);
						}else{
							tt.setPrice(Double.valueOf(0));
						}
					}else{
						if(wacs!=null && wacs.length>0){
							tt.setWac(wacs[i]);
						}else{
							tt.setPrice(Double.valueOf(0));
						}
					}
					tt.setTubeAsc(Integer.valueOf(Constants.NUMBER_SIGN_2));
					tt.setManagerAsc(Integer.valueOf(Constants.NUMBER_SIGN_1));
					tt.setStatus(Constants.NUMBER_SIGN_0);
					storeAdjustmentService.save(tt);
				}
				return AjaxBean.getInstance("success");
			}else{
				return AjaxBean.getInstance("error","没有选择待处理的订单!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="bachProcess")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids,
			@RequestParam(value="oper") String oper){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(ids!=null && ids.length>0){
				for(int i=0;i<ids.length;i++){
					StoreAdjustment tt=storeAdjustmentService.findOne(ids[i]);
					if(Constants.AGREE.equals(oper)){
						tt.setApprovalUser(user.getuName());
						tt.setApprovalUserId(user.getId());
						tt.setApprovalDate(date);
						tt.setTubeAsc(Integer.valueOf(Constants.NUMBER_SIGN_1));
						tt.setManagerAsc(Integer.valueOf(Constants.NUMBER_SIGN_3));
						tt.setStatus(Constants.NUMBER_SIGN_2);
					}else if(Constants.CANCEL.equals(oper)){
						tt.setApprovalUser(user.getuName());
						tt.setApprovalUserId(user.getId());
						tt.setApprovalDate(date);
						tt.setTubeAsc(Integer.valueOf(Constants.NUMBER_SIGN_3));
						tt.setManagerAsc(Integer.valueOf(Constants.NUMBER_SIGN_2));
						tt.setStatus(Constants.NUMBER_SIGN_3);
					}else if(Constants.FINISH.equals(oper)){
						tt.setBaseTube(user.getuName());
						tt.setBaseTubeId(user.getId());
						tt.setConfimTime(date);
						if(Constants.NUMBER_SIGN_2.equals(tt.getStatus())){
							tt.setStatus(Constants.NUMBER_SIGN_1);
							tt.setTubeAsc(Integer.valueOf(Constants.NUMBER_SIGN_4));
							tt.setManagerAsc(Integer.valueOf(Constants.NUMBER_SIGN_4));
						}else{
							tt.setTubeAsc(Integer.valueOf(Constants.NUMBER_SIGN_5));
							tt.setManagerAsc(Integer.valueOf(Constants.NUMBER_SIGN_5));
							tt.setStatus(Constants.NUMBER_SIGN_4);
						}
						Part part=partService.findOne(tt.getPartsId());
						part.setNumber(part.getNumber()==null?0:part.getNumber()+tt.getNumber());
						if(Constants.NEW.equals(tt.getType())){
							part.setNewNumber(part.getNewNumber()==null?0:part.getNewNumber()+tt.getNumber());
						}else if(Constants.OLD.equals(tt.getType())){
							part.setOldNumber(part.getOldNumber()==null?0:part.getOldNumber()+tt.getNumber());
						}
						partService.update(part);
					}
					storeAdjustmentService.update(tt);
				}
				return AjaxBean.getInstance("success");
			}else{
				return AjaxBean.getInstance("error","没有选择待处理的订单!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="add")
	public String add(ModelMap map){
		return "part/storeAdjustment/add";
	}
}


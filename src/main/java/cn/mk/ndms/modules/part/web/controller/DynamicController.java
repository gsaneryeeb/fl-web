package cn.mk.ndms.modules.part.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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

import cn.mk.ndms.domain.Dynamic;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.StoreAdjustment;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.DynamicService;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.part.service.StoreAdjustmentService;
import cn.mk.ndms.modules.part.web.vo.DynamicVo;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/dynamic")
public class DynamicController extends GenericCRUDController<Dynamic, String>
{
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private OutboundService outboundService;
	
	@Autowired
	private StoreAdjustmentService storeAdjustmentService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private DynamicService dynamicService;
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.DYNAMIC_PAGENAME;
	}
	
	@RequestMapping(value="toMain")
	public String toMain(ModelMap map,HttpServletRequest request){
		Calendar calendar=Calendar.getInstance();
		String year=String.valueOf(calendar.get(Calendar.YEAR));
		String month=String.valueOf((calendar.get(Calendar.MONTH)+1));
		String day=String.valueOf((calendar.get(Calendar.DAY_OF_MONTH)-1));
		List<Dynamic> dynamicList=dynamicService.findByDate(year,month,day);
		boolean bl=false;
		if(dynamicList!=null && !dynamicList.isEmpty()){
			Dynamic dynamic=dynamicList.get(0);
			if(Constants.NUMBER_0.equals(dynamic.getStatus())){
				bl=true;
			}
		}else{
			bl=true;
		}
		if(bl){
			String yesterDay=DateTool.yesterDay();
			String startDate=yesterDay+" 00:00:00";
			String endDate=yesterDay+" 23:59:59";
			List<String> outStatus=new ArrayList<String>();
			outStatus.add(Constants.NUMBER_SIGN_1);
			outStatus.add(Constants.NUMBER_SIGN_3);
			outStatus.add(Constants.NUMBER_SIGN_4);
			//异动入库数
			List<Storage> storageList=storageService.findByYesterDayAndStatus(startDate,endDate,Constants.NUMBER_SIGN_1);
			//异动出库数
			List<Outbound> outboundList=outboundService.findByYesterDayAndStatus(startDate,endDate,outStatus);
			//异动调拨数
			List<StoreAdjustment> storeAdjustmentList=storeAdjustmentService.findByYesterDayAndStatus(startDate,endDate,Constants.NUMBER_SIGN_1);
			Map<String,DynamicVo> dynamicVoMap=new HashMap<String,DynamicVo>();
			
			if(storageList!=null && !storageList.isEmpty()){
				for(Storage s:storageList){
					DynamicVo vo=dynamicVoMap.get(s.getPartId());
					if(vo==null){
						DynamicVo dynamicVo=new DynamicVo();
						Part part = partService.findOne(s.getPartId());
						dynamicVo.setSysNumber(part.getNumber());
						dynamicVo.setPartId(s.getPartId());
						dynamicVo.setParts(s.getPart());
						dynamicVo.setRack(part.getRack());
						dynamicVo.setInStoreage(s.getIntactQuantity());
						dynamicVoMap.put(s.getPartId(), dynamicVo);
					}else{
						vo.setInStoreage(vo.getInStoreage()+s.getIntactQuantity());
						dynamicVoMap.put(vo.getPartId(), vo);
					}
				}
			}
			if(outboundList!=null && !outboundList.isEmpty()){
				for(Outbound o:outboundList){
					DynamicVo vo=dynamicVoMap.get(o.getActualUsePartId());
					if(vo==null){
						DynamicVo dynamicVo=new DynamicVo();
						Part part = partService.findOne(o.getActualUsePartId());
						dynamicVo.setSysNumber(part.getNumber());
						dynamicVo.setPartId(o.getActualUsePartId());
						dynamicVo.setParts(o.getActualUsePart());
						dynamicVo.setRack(part.getRack());
						dynamicVo.setOutStoreage(o.getUseNumber());
						dynamicVoMap.put(o.getActualUsePartId(), dynamicVo);
					}else{
						Integer num=vo.getOutStoreage()==null?0:vo.getOutStoreage();
						num+=o.getUseNumber();
						vo.setOutStoreage(num);
						dynamicVoMap.put(vo.getPartId(), vo);
					}
				}
			}
			if(storeAdjustmentList!=null && !storeAdjustmentList.isEmpty()){
				for(StoreAdjustment s:storeAdjustmentList){
					DynamicVo vo=dynamicVoMap.get(s.getPartsId());
					if(vo==null){
						DynamicVo dynamicVo=new DynamicVo();
						
						dynamicVo.setPartId(s.getPartsId());
						dynamicVo.setParts(s.getParts());
						Part part=partService.findOne(s.getPartsId());
						dynamicVo.setRack(part.getRack());
						dynamicVo.setAdjust(s.getNumber());
						dynamicVo.setSysNumber(part.getNumber());
						dynamicVoMap.put(s.getPartsId(), dynamicVo);
					}else{
						Integer num=vo.getAdjust()==null?0:vo.getAdjust();
						num+=s.getNumber();
						vo.setAdjust(num);
						dynamicVoMap.put(s.getPartsId(), vo);
					}
				}
			}
			request.getSession().setAttribute(Constants.DYNAMIC_VO, dynamicVoMap);
			request.getSession().setAttribute("t", dynamicVoMap.values());
			map.put("READ_ONLY", true);
		}else{
			map.put("READ_ONLY", false);
		}
		return "part/dynamic/main";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="backSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="initNumbers") Integer[] initNumbers,
			@RequestParam(value="remarks") String[] remarks,@RequestParam(value="ids") String[] ids){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			Calendar calendar=Calendar.getInstance();
			String year=String.valueOf(calendar.get(Calendar.YEAR));
			String month=String.valueOf((calendar.get(Calendar.MONTH)+1));
			String day=String.valueOf((calendar.get(Calendar.DAY_OF_MONTH)-1));
			Map<String,DynamicVo> dynamicVoMap=(Map<String,DynamicVo>)request.getSession().getAttribute(Constants.DYNAMIC_VO);
			if(ids!=null && ids.length>0){
				for(int i=0;i<ids.length;i++){
					DynamicVo dynamicVo=(DynamicVo)dynamicVoMap.get(ids[i]);
					Dynamic dynamic=new Dynamic();
					dynamic.setAdjust(dynamicVo.getAdjust());
					dynamic.setDays(day);
					dynamic.setInStoreage(dynamicVo.getInStoreage());
					dynamic.setMonths(month);
					dynamic.setOperUser(user.getuName());
					dynamic.setOperUserId(user.getId());
					dynamic.setOutStoreage(dynamicVo.getOutStoreage());
					dynamic.setPartId(dynamicVo.getPartId());
					dynamic.setParts(dynamicVo.getParts());
					dynamic.setPdate(date);
					dynamic.setRack(dynamicVo.getRack());
					dynamic.setRelNumber(initNumbers[i]);
					dynamic.setRemarks(remarks[i]);
					dynamic.setSysNumber(dynamicVo.getSysNumber());
					dynamic.setStatus(Constants.NUMBER_SIGN_1);
					dynamic.setYears(year);
					dynamicService.save(dynamic);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


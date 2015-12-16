package cn.mk.ndms.modules.part.web.controller;

import java.util.ArrayList;
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

import cn.mk.ndms.domain.InventoryCycle;
import cn.mk.ndms.domain.InventoryDetail;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.part.service.InventoryCycleService;
import cn.mk.ndms.modules.part.service.InventoryDetailService;
import cn.mk.ndms.modules.part.web.vo.InventoryCycleVo;
import cn.mk.ndms.modules.part.web.vo.PartVo;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/inventoryCycle")
public class InventoryCycleController extends GenericCRUDController<InventoryCycle, String>
{
	@Autowired
	private InventoryCycleService inventoryCycleService;
	
	@Autowired
	private InventoryDetailService inventoryDetailService;
	
	@Autowired
	private PartService partService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.INVENTORYCYCLE_PAGENAME;
	}
	
	@ModelAttribute(value = "parts")
	public List<Part> setParts()
	{
		return partService.findAllByStatus();
	}
	
	@RequestMapping(value="check")
	@ResponseBody
	public AjaxBean checkAjax(HttpServletRequest request,@RequestParam(value="type") String type,
			@RequestParam(value="month") String month,@RequestParam(value="year") String year,
			@RequestParam(value="quarter") String quarter){
		try{
			List<InventoryCycle> list=null;
			if(Constants.INVENTORY_CYCLE_Q.equals(type)){
				list=inventoryCycleService.findByQuarter(quarter);
			}else if(Constants.INVENTORY_CYCLE_M.equals(type)){
				list=inventoryCycleService.findByMonth(month);
			}else if(Constants.INVENTORY_CYCLE_Y.equals(type)){
				list=inventoryCycleService.findByYear(year);
			}
			if(list!=null && !list.isEmpty()){
				InventoryCycle cycle=list.get(0);
				if(Constants.NUMBER_SIGN_0.equals(cycle.getStatus())){
					InventoryCycleVo vo=new InventoryCycleVo();
					vo.setCycleId(cycle.getId());
					vo.setCycleM(month);
					vo.setCycleQ(quarter);
					vo.setCycleType(type);
					vo.setCycleY(year);
					request.getSession().setAttribute(Constants.INVENTORYCYCLE_VO, vo);
					return AjaxBean.getInstance("success");
				}else{
					return AjaxBean.getInstance("error","此时段的盘点已入库,不能重复操作!");
				}
			}else{
				InventoryCycle cycle=new InventoryCycle();
				cycle.setMonths(month);
				cycle.setQuarter(quarter);
				cycle.setType(type);
				cycle.setYear(year);
				cycle.setStatus(Constants.NUMBER_0);
				cycle=inventoryCycleService.save(cycle);
				
				InventoryCycleVo vo=new InventoryCycleVo();
				vo.setCycleId(cycle.getId());
				vo.setCycleM(month);
				vo.setCycleQ(quarter);
				vo.setCycleType(type);
				vo.setCycleY(year);
				
				request.getSession().setAttribute(Constants.INVENTORYCYCLE_VO, vo);
				return AjaxBean.getInstance("success");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="bachSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			InventoryCycleVo vo=(InventoryCycleVo)request.getSession().getAttribute(Constants.INVENTORYCYCLE_VO);
			Map<String,PartVo> partVoMap=vo.getMapPartVo();
			Object[] parts=partVoMap.values().toArray();
			if(parts!=null && parts.length>0){
				for(int i=0;i<parts.length;i++){
					PartVo partVo=(PartVo)parts[i];
					InventoryDetail inventoryDetail=new InventoryDetail();
					inventoryDetail.setCdate(date);
					inventoryDetail.setCycleId(vo.getCycleId());
					inventoryDetail.setDif(partVo.getDiffNumber());
					inventoryDetail.setDifIs(partVo.isDiff_boolean()==false?Constants.SHORT_SIGN_0:Constants.SHORT_SIGN_1);
					inventoryDetail.setNumber(partVo.getNumber());
					inventoryDetail.setOperUser(user.getuName());
					inventoryDetail.setOperUserId(user.getId());
					inventoryDetail.setPart(partVo.getNo());
					inventoryDetail.setPartId(partVo.getId());
					inventoryDetail.setPdate(date);
					inventoryDetail.setShelvNo(partVo.getRack());
					inventoryDetail.setStatus(Constants.NUMBER_SIGN_1);
					inventoryDetail.setSudoku(partVo.getInitNumber());
					inventoryDetail.setInfrequently(partVo.getCheckNumber());
					inventoryDetailService.save(inventoryDetail);
				}
				InventoryCycle inventoryCycle=inventoryCycleService.findOne(vo.getCycleId());
				inventoryCycle.setStatus(Constants.NUMBER_SIGN_1);
				inventoryCycleService.update(inventoryCycle);
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="toMain")
	public String toMain(ModelMap map){
		return "part/inventoryCycle/main";
	}
	
	@RequestMapping(value="twoPage")
	public String twoPage(HttpServletRequest request){
		List<Part> list=partService.findAllByStatus();
		InventoryCycleVo vo=(InventoryCycleVo)request.getSession().getAttribute(Constants.INVENTORYCYCLE_VO);
		if(list!=null && !list.isEmpty()){
			vo.setInitParts(list);
			Map<String,Part> mapPart=new HashMap<String,Part>();
			Map<String,PartVo> mapPartVo=new HashMap<String,PartVo>();
			for(Part p:list){
				PartVo partVo=new PartVo();
				partVo.setId(p.getId());
				partVo.setNo(p.getNo());
				partVo.setNumber(p.getNumber());
				partVo.setNewNumber(p.getNewNumber());
				partVo.setOldNumber(p.getOldNumber());
				partVo.setRack(p.getRack());
				partVo.setPartName(p.getName());
				mapPartVo.put(partVo.getId(), partVo);
				mapPart.put(p.getId(), p);
			}
			vo.setMapPartVo(mapPartVo);
			vo.setMapPart(mapPart);
			request.getSession().setAttribute(Constants.INVENTORYCYCLE_VO,vo);
		}
		request.getSession().setAttribute("t",list);
		return "part/inventoryCycle/twoPage";
	}
	
	@RequestMapping(value="thressPage")
	public String thressPage(HttpServletRequest request,@RequestParam(value="ids") String[] ids,@RequestParam(value="initNumbers") Integer[] initNumbers){
		InventoryCycleVo vo=(InventoryCycleVo)request.getSession().getAttribute(Constants.INVENTORYCYCLE_VO);
		Map<String,PartVo> partVoMap=vo.getMapPartVo();
		List<PartVo> pList=new ArrayList<PartVo>();
		if(ids!=null && ids.length>0){
			for(int i=0;i<ids.length;i++){
				PartVo p=partVoMap.get(ids[i]);
				p.setInitNumber(initNumbers[i]);
				if((initNumbers[i]-(p.getNumber()==null?0:p.getNumber()))!=0){
					p.setCheck_boolean(true);
					pList.add(p);
				}else{
					p.setCheck_boolean(false);
				}
				partVoMap.put(p.getId(), p);
			}
			vo.setMapPartVo(partVoMap);
			request.setAttribute("t", pList);
			request.getSession().setAttribute(Constants.INVENTORYCYCLE_VO,vo);
		}
		return "part/inventoryCycle/thressPage";
	}
	
	@RequestMapping(value="forePage")
	public String forePage(HttpServletRequest request,@RequestParam(value="ids") String[] ids,@RequestParam(value="initNumbers") Integer[] initNumbers){
		InventoryCycleVo vo=(InventoryCycleVo)request.getSession().getAttribute(Constants.INVENTORYCYCLE_VO);
		Map<String,PartVo> partVoMap=vo.getMapPartVo();
		List<PartVo> pList=new ArrayList<PartVo>();
		if(ids!=null && ids.length>0){
			for(int i=0;i<ids.length;i++){
				PartVo p=partVoMap.get(ids[i]);
				p.setCheckNumber(initNumbers[i]);
				if((initNumbers[i]-(p.getNumber()==null?0:p.getNumber()))!=0){
					p.setDiff_boolean(true);
					p.setDiffNumber(initNumbers[i]-(p.getNumber()==null?0:p.getNumber()));
					pList.add(p);
				}else{
					p.setDiff_boolean(false);
				}
				partVoMap.put(p.getId(), p);
			}
			vo.setMapPartVo(partVoMap);
			request.setAttribute("t", pList);
			request.getSession().setAttribute(Constants.INVENTORYCYCLE_VO,vo);
		}
		return "part/inventoryCycle/forePage";
	}
}


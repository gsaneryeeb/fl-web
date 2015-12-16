	package cn.mk.ndms.modules.part.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.Supiro;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.service.InNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.RoleService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.SupiroService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/purchase")
public class PurchaseController extends GenericCRUDController<Storage, String>
{
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private SupiroService supiroService;
	
	@Autowired
	private InNoService inNoService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.PURCHASE_PAGENAME;
	}
	
	@ModelAttribute(value = "roles")
	public Map<String,String> getRoles(){
//		User user=(User)request.getSession().getAttribute("USER");
		Map<String,String> roleMap=new HashMap<String,String>();
		List<Role> roles=roleService.findAllByStatus();
		if(roles!=null && !roles.isEmpty()){
			for(Role r:roles){
				roleMap.put(r.getId(), r.getEname());
			}
		}
		return roleMap;
	}
	
	@ModelAttribute(value = "statusAll")
	public Map<String,String> setStatus()
	{
		return Constants.MAP_PURCHASE_STATUS;
	}
	
	@ModelAttribute(value = "engineersMap")
	public Map<String,String> setEngineersMap()
	{
		return Constants.ENGINEER_MAP;
	}
	
	@ModelAttribute(value = "statusEngineer")
	public Map<String,String> setEngineerStatus()
	{
		return Constants.ENGINEERSTATUSMAP;
	}
	
	@ModelAttribute(value = "speakForStatusMap")
	public Map<String,String> setSpeakForStatus()
	{
		return Constants.SPEAKFORSTATUSMAP;
	}
	
	
	@ModelAttribute(value = "engineers")
	public List<User> setEngineers()
	{
		return userService.findByStatusAndRole(Constants.SHORT_SIGN_1,Constants.ENGINEER);
	}
	
	@ModelAttribute(value = "supiros")
	public List<Supiro> setSupiros()
	{
		return supiroService.findByStatus(Constants.SHORT_SIGN_1);
	}
	
	@ModelAttribute(value = "sources")
	public Map<String,String> setSources()
	{
		return Constants.sourcesMap;
	}
	
	@ModelAttribute(value = "faultStatusMap")
	public Map<String,String> setFaultStatusMap()
	{
		return Constants.FAULTSTATUS_MAP;
	}
	
	
	@RequestMapping(value="finish")
	@ResponseBody
	public AjaxBean finishAjax(HttpServletRequest request,@RequestParam(value="ids") String[] ids){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			if(ids!=null && ids.length>0){
				for(String id:ids){
					Storage tt=storageService.findOne(id);
					String date=DateTool.longFormat(new Date());
					tt.setOperDate(date);
					tt.setOperUserId(user.getId());
					tt.setOperUserName(user.getuName());
					tt.setStatus(Constants.NUMBER_SIGN_1);
					storageService.update(tt);
					Part part=partService.findOne(tt.getPartId());
					if(Constants.DOA_TYPE.equals(tt.getSource())){
						part.setOldNumber(part.getOldNumber()==null?0:part.getOldNumber()+tt.getIntactQuantity());
					}else{
						part.setNewNumber(part.getNewNumber()==null?0:part.getNewNumber()+tt.getIntactQuantity());
					}
					part.setNumber(part.getNumber()==null?0:part.getNumber()+tt.getIntactQuantity());
					partService.update(part);
				}
				return AjaxBean.getInstance("success");
			}else{
				return AjaxBean.getInstance("error","没有选择待处理的订单!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="bachSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="partses") String[] partses,
			@RequestParam(value="partNames") String[] partNames,
			@RequestParam(value="partIds") String[] partIds,@RequestParam(value="numbers") Integer[] numbers,
			@RequestParam(value="prices") Double[] prices,@RequestParam(value="ordersDates") String[] ordersDates,
			@RequestParam(value="totals") Double[] totals,@RequestParam(value="sources") String[] sources,
			@RequestParam(value="partRemark") String[] partRemark,@RequestParam(value="inOrders") String[] inOrders,
			@RequestParam(value="arrivalDates") String[] arrivalDates,@RequestParam(value="allotEngineers") String[] allotEngineers
			,@RequestParam(value="supplierIds") String[] supplierIds
			){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(partIds!=null && partIds.length>0){
				for(int i=0;i<partIds.length;i++){
					Storage tt=new Storage();
					tt.setSource(sources[i]);
					tt.setSupplierId(supplierIds[i]);
					Supiro supiro=supiroService.findOne(supplierIds[i]);
					tt.setSupplierName(supiro.getName());
					tt.setPartId(partIds[i]);
					tt.setPart(partses[i]);
					tt.setPartName(partNames[i]);
					tt.setNumber(numbers[i]);
					tt.setPrice(prices[i]);
					tt.setTotal(totals[i]);
					tt.setStatus(Constants.NUMBER_SIGN_8);
					tt.setOrdersDate(ordersDates[i]);
					if(partRemark!=null && partRemark.length>0){
						if(StringUtils.isEmpty(partRemark[i])){
							tt.setPartRemark(partRemark[i]);
						}
					}
					if(arrivalDates!=null && arrivalDates.length>0){
						if(StringUtils.isEmpty(arrivalDates[i])){
							tt.setSpeakForStatus(Constants.NOTARRIVE_EN);
							tt.setStatus(Constants.NUMBER_SIGN_8);
						}else{
							tt.setSpeakForStatus(Constants.ARRIVED_EN);
							tt.setStatus(Constants.NUMBER_SIGN_9);
							tt.setArrivalDate(arrivalDates[i]);
							if(allotEngineers!=null && allotEngineers.length>0){
								if(StringUtils.isNotEmpty(allotEngineers[i])){
									tt.setAllotEngineer(allotEngineers[i]);
									tt.setStatus(Constants.NUMBER_SIGN_2);
									tt.setAssignedDate(date);
								}
							}
						}
					}else{
						if(allotEngineers!=null && allotEngineers.length>0){
							tt.setAllotEngineer(allotEngineers[i]);
							tt.setAssignedDate(date);
						}
					}
					tt.setInOrder(inOrders[i]);
					tt.setOperDate(date);
					tt.setOperUserId(user.getId());
					tt.setOperUserName(user.getuName());
					storageService.save(tt);
				}
				return AjaxBean.getInstance("success");
			}else{
				return AjaxBean.getInstance("error","没有选择待处理的订单!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="updateSave")
	@ResponseBody
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="ids") String ids,
			@RequestParam(value="partses") String partses,@RequestParam(value="partIds") String partIds,@RequestParam(value="numbers") Integer numbers,
			@RequestParam(value="partNames") String partNames,
			@RequestParam(value="prices") Double prices,@RequestParam(value="ordersDates") String ordersDates,
			@RequestParam(value="totals") Double totals,
			@RequestParam(value="partRemark") String partRemark,@RequestParam(value="inOrders") String inOrders,
			@RequestParam(value="arrivalDates") String arrivalDates,@RequestParam(value="allotEngineers") String allotEngineers
			){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			Storage tt=storageService.findOne(ids);
			String date=DateTool.longFormat(new Date());
			tt.setPartId(partIds);
			tt.setPartName(partNames);
			tt.setPart(partses);
			tt.setNumber(numbers);
			tt.setPrice(prices);
			tt.setTotal(totals);
			tt.setStatus(Constants.NUMBER_SIGN_8);
			tt.setOrdersDate(ordersDates);	
			tt.setPartRemark(partRemark);
			if(StringUtils.isEmpty(arrivalDates)){
				tt.setArrivalDate(null);
				tt.setSpeakForStatus(Constants.NOTARRIVE_EN);
				tt.setStatus(Constants.NUMBER_SIGN_8);
			}else{
				tt.setSpeakForStatus(Constants.ARRIVED_EN);
				tt.setStatus(Constants.NUMBER_SIGN_9);
				tt.setArrivalDate(arrivalDates);
				if(StringUtils.isNotEmpty(allotEngineers)){
					tt.setAllotEngineer(allotEngineers);
					tt.setStatus(Constants.NUMBER_SIGN_2);
					tt.setAssignedDate(date);
				}else{
					tt.setAllotEngineer(null);
				}
			}
			tt.setInOrder(inOrders);
			tt.setOperUserId(user.getId());
			tt.setOperUserName(user.getuName());
			storageService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="returnBack")
	@ResponseBody
	public AjaxBean returnBack(ModelMap map,HttpServletRequest request,@RequestParam(value="id") String id,@RequestParam(value="type") String type,@RequestParam(value="returnNum",required=false) Integer returnNum){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			Storage tt=storageService.findOne(id);
			if(Constants.NUMBER_0.equals(type)){
				tt.setFaultStatus(Constants.NUMBER_0);
				//bug,不返件的情况下,总价有问题
				tt.setTotal(tt.getPrice()*tt.getIntactQuantity());
				//bug,不返件的情况下,如有好的备件,没有入库,这里添加入库
//				Part part=partService.findOne(tt.getPartId());
//				int inNumber=tt.getIntactQuantity()==null?0:tt.getIntactQuantity();
//				part.setNewNumber(part.getNewNumber()==null?0:part.getNewNumber()+inNumber);
//				part.setNumber(part.getNumber()==null?0:part.getNumber()+inNumber);
//				partService.update(part);
			}else{
				tt.setFaultStatus(Constants.NUMBER_SIGN_1);
				tt.setReturnNum(returnNum);
				//new Store
				Storage t=new Storage();
				t.setSource(Constants.RETURN_TYPE);
				t.setPartId(tt.getPartId());
				t.setPart(tt.getPart());
				t.setPartName(tt.getPartName());
				t.setNumber(tt.getReturnNum());
				t.setPrice(tt.getPrice());
				t.setTotal(tt.getPrice()*tt.getReturnNum());
				t.setStatus(Constants.NUMBER_SIGN_8);
				t.setOrdersDate(date);
				t.setPartRemark(tt.getPartRemark());
				t.setSpeakForStatus(Constants.NOTARRIVE_EN);
				t.setOperDate(date);
				t.setInOrder(tt.getInOrder());
				t.setOperUserId(user.getId());
				t.setOperUserName(user.getuName());
				t.setShelfNo(tt.getShelfNo());
				t.setUpId(tt.getId());
				storageService.save(t);
				//原表total有问题.修改bug
				tt.setTotal(tt.getPrice()*tt.getIntactQuantity());
			}
			if(tt.getIntactQuantity()!=null && tt.getIntactQuantity().intValue()>0){
				tt.setStatus(Constants.NUMBER_SIGN_0);
				//不返件状态bug
//				if(Constants.NUMBER_0.equals(type)){
//					tt.setStatus(Constants.NUMBER_SIGN_1);
//				}
			}else{
				tt.setStatus(Constants.NUMBER_SIGN_1);
			}
			storageService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="edit")
	public String edit(ModelMap map,@RequestParam(value="id") String id){
		map.put("t", storageService.findOne(id));
		return "part/purchase/edit";
	}
	
	/**
	 * 添加功能
	 * @param map
	 * @return
	 */
	@RequestMapping(value="add")
	public String add(ModelMap map){
		return "part/purchase/add";
	}
	
	@RequestMapping(value="print")
	public String print(ModelMap map,@RequestParam(value="id") String id){
		map.put("t", storageService.findOne(id));
		return "part/purchase/print";
	}
	
	@RequestMapping(value="prints")
	public String prints(ModelMap map,@RequestParam(value="ids") String[] id){
		List<String> idsList=new ArrayList<String>();
		idsList=Arrays.asList(id);
 		map.put("list", storageService.findByIds(idsList));
		return "part/purchase/prints";
	}
}


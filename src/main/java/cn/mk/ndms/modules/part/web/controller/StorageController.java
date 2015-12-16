package cn.mk.ndms.modules.part.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.Supiro;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.service.InNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.SupiroService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.Constants.serviceType;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/storage")
public class StorageController extends GenericCRUDController<Storage, String>
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
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.STORAGE_PAGENAME;
	}
	
	@ModelAttribute(value = "engineer")
	public Map<String,String> setEngineer()
	{
		return Constants.ENGINEER_MAP;
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
					if(Constants.IN_NO_PRE_FIX.equals(tt.getSource())){
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
	public AjaxBean bachSaveAjax(HttpServletRequest request,@RequestParam(value="supiros") String[] supiros,
			@RequestParam(value="engineers",required=false) String[] engineers,@RequestParam(value="partses") String[] partses,
			@RequestParam(value="partIds") String[] partIds,@RequestParam(value="numbers") Integer[] numbers,
			@RequestParam(value="prices") Double[] prices,@RequestParam(value="shelfNos") String[] shelfNos,
			@RequestParam(value="totals") Double[] totals,@RequestParam(value="source") String source
			){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			if(partIds!=null && partIds.length>0){
				String no="";
				if(Constants.TEST_NO_PRE_FIX.equals(source)){
					no=inNoService.updateMaxNo(serviceType.T,user.getId(),date,source);
				}else if(Constants.CG_NO_PRE_FIX.equals(source)){
					no=inNoService.updateMaxNo(serviceType.C,user.getId(),date,source);
				}
				
				for(int i=0;i<partIds.length;i++){
					Storage tt=new Storage();
					tt.setInOrder(no);
					if(Constants.TEST_NO_PRE_FIX.equals(source)){
						User engineer=userService.findOne(engineers[i]);
						tt.setEngineerId(engineer.getId());
						tt.setEngineerName(engineer.getuName());
					}else if(Constants.CG_NO_PRE_FIX.equals(source)){
						Supiro supiro=supiroService.findOne(supiros[i]);
						tt.setSupplierId(supiro.getId());
						tt.setSupplierName(supiro.getName());
					}
					
					tt.setSource(source);
					tt.setPartId(partIds[i]);
					tt.setPart(partses[i]);
					tt.setNumber(numbers[i]);
					tt.setPrice(prices[i]);
					if(shelfNos!=null && shelfNos.length>0){
						tt.setShelfNo(shelfNos[i]);
					}
					tt.setTotal(totals[i]);
					tt.setStatus(Constants.NUMBER_SIGN_0);
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
	
	@RequestMapping(value="add")
	public String add(ModelMap map){
		return "part/storage/add";
	}
	
	@RequestMapping(value="print")
	public String print(ModelMap map,@RequestParam(value="id") String id){
		map.put("t", storageService.findOne(id));
		return "part/storage/print";
	}
	
	@RequestMapping(value="prints")
	public String prints(ModelMap map,@RequestParam(value="ids") String[] id){
		List<String> idsList=new ArrayList<String>();
		idsList=Arrays.asList(id);
 		map.put("list", storageService.findByIds(idsList));
		return "part/storage/prints";
	}
}


package cn.mk.ndms.modules.part.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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

import cn.mk.ndms.domain.CommonRepairService;
import cn.mk.ndms.domain.DoorRepairService;
import cn.mk.ndms.domain.Fault;
import cn.mk.ndms.domain.LateplayNo;
import cn.mk.ndms.domain.Outbound;
import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.ReturnPart;
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.Supiro;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.domain.Wac;
import cn.mk.ndms.modules.part.service.OutboundService;
import cn.mk.ndms.modules.part.service.ReturnPartService;
import cn.mk.ndms.modules.service.service.CommonRepairServiceService;
import cn.mk.ndms.modules.service.service.DoorRepairServiceService;
import cn.mk.ndms.modules.sys.service.FaultService;
import cn.mk.ndms.modules.sys.service.InNoService;
import cn.mk.ndms.modules.sys.service.LateplayNoService;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.SupiroService;
import cn.mk.ndms.modules.sys.service.WacService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Constants.serviceType;
import cn.mk.ndms.util.DateTool;
import cn.mk.ndms.util.ReturnPartVo;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.common.Global;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("part/returnPart")
public class ReturnPartController extends GenericCRUDController<ReturnPart, String>
{
	@Autowired
	private OutboundService outboundService;
	
	@Autowired
	private LateplayNoService lateplayNoService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private SupiroService supiroService;
	
	@Autowired
	private ReturnPartService returnPartService;
	
	@Autowired
	private DoorRepairServiceService doorRepairServiceService;
	
	@Autowired
	private InNoService inNoService;
	
	@Autowired
	private FaultService faultService;
	
	@Autowired
	private StorageService storageService;
	
	@Autowired
	private WacService wacService;
	
	@Autowired
	private CommonRepairServiceService commonRepairServiceService;
	
	@ModelAttribute(value = "supiros")
	public List<Supiro> setSupiros()
	{
		return supiroService.findByStatus(Constants.SHORT_SIGN_1);
	}
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.RETURNPART_PAGENAME;
	}
	
	@ModelAttribute(value = "status")
	public Map<String,String> getStatus(HttpServletRequest request){
		return Constants.MAP_RETURN_STATUS;
	}
	
	@ModelAttribute(value = "parts")
	public List<Part> getParts(HttpServletRequest request){
		return partService.findAllByStatus();
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(ReturnPart t){
		try{
			ReturnPart tt=returnPartService.findOne(t.getId());
			tt.setStatus(Constants.NUMBER_SIGN_00);
			returnPartService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value = "init")
	public String toInitPage(Model model, HttpServletRequest request,@RequestParam(value="search_LIKE_callNo") String search_LIKE_callNo,@RequestParam(value="search_LIKE_station") String search_LIKE_station) throws ParseException {
		List<Outbound> dRList=outboundService.findByReturnPart(search_LIKE_callNo,search_LIKE_station);
		List<ReturnPart> rList=returnPartService.findByStatus(Constants.NUMBER_0,search_LIKE_callNo,search_LIKE_station);
		Map<String,ReturnPartVo> map=new HashMap<String,ReturnPartVo>();
		if(dRList!=null && !dRList.isEmpty()){
			for(Outbound d:dRList){
				ReturnPartVo v=new ReturnPartVo();
				List<Part> p=partService.findByPart(d.getApplyParts());
				v.setRqId(d.getRqNo());
				v.setRqType(d.getRepairType());
				v.setActualUsePart(d.getActualUsePart());
				v.setCallNo(d.getCallno());
				v.setStation(d.getStation());
				v.setApplyParts(d.getApplyParts());
				v.setStatus(Constants.NUMBER_0);
				v.setOutOrder(d.getOutOrder());
				if(p!=null && !p.isEmpty()){
					v.setApplyPartsName(p.get(0).getName());
				}
				v.setNumber(d.getApplyNumber());
				map.put(d.getRqNo(), v);
			}
		}
		if(rList!=null && !rList.isEmpty()){
			for(ReturnPart d:rList){
				if(map.get(d.getRqId())==null){
					ReturnPartVo v=new ReturnPartVo();
					List<Part> p=partService.findByPart(d.getParts());
					v.setId(d.getId());
					v.setRqId(d.getRqId());
					v.setRqType(d.getRqType());
					v.setCallNo(d.getCallno());
					v.setStation(d.getStation());
					v.setApplyParts(d.getParts());
					v.setReturnParts(d.getRelParts());
					v.setActualUsePart(d.getRelParts());
					v.setReturnDate(d.getReturnDate());
					v.setStatus(d.getStatus());
					v.setScrap(""+d.getScrap());
					v.setOutOrder(d.getOutOrder());
					v.setReturnStatus(d.getReturnStatus());
					if(p!=null && !p.isEmpty()){
						v.setApplyPartsName(p.get(0).getName());
					}
					map.put(d.getRqId(), v);
				}else{
					ReturnPartVo v=(ReturnPartVo)map.get(d.getRqId());
					List<Part> p=partService.findByPart(d.getParts());
					v.setId(d.getId());
					v.setApplyParts(d.getParts());
					v.setScrap(""+d.getScrap());
					v.setReturnParts(d.getRelParts());
					v.setReturnPartsId(d.getRelPartsId());
					v.setReturnDate(d.getReturnDate());
					v.setReturnStatus(d.getReturnStatus());
					if(p!=null && !p.isEmpty()){
						v.setApplyPartsName(p.get(0).getName());
					}
					map.put(d.getRqId(), v);
				}
			}
		}
		request.getSession().setAttribute("MAP", map);
		model.addAttribute("search_LIKE_callNo", search_LIKE_callNo);
		model.addAttribute("search_LIKE_station", search_LIKE_station);
		model.addAttribute("t", map.values());
		return "part/returnPart/hisPage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "editInit")
	public String editInit(ModelMap model, HttpServletRequest request,@RequestParam(value="rqId") String rqId) throws ParseException {
		Map<String,ReturnPartVo> map=(HashMap<String,ReturnPartVo>)request.getSession().getAttribute("MAP");
		model.addAttribute("vo",map.get(rqId));
		model.addAttribute("returnPartStatus", Constants.MAP_RETURN_PART_STATUS);
		return "part/returnPart/oper";
	}
	
	@RequestMapping(value = "detailShow")
	public String detailShow(ModelMap model, HttpServletRequest request,@RequestParam(value="id") String id) throws ParseException {
		ReturnPart returnPart=returnPartService.findOne(id);
		model.addAttribute("vo",returnPart);
		model.addAttribute("p",partService.findOne(returnPart.getRelPartsId()));
		
		model.addAttribute("returnPartStatus", Constants.MAP_RETURN_PART_STATUS);
		return "part/returnPart/printDetail";
	}
	
	@RequestMapping(value = "printRepair")
	public String printRepair(ModelMap model, HttpServletRequest request,@RequestParam(value="id") String[] ids) throws ParseException {
		List<String> idsList=new ArrayList<String>();
		idsList=Arrays.asList(ids);
		model.addAttribute("list",returnPartService.findByIds(idsList));
		return "part/returnPart/printRepair";
	}
	
	@RequestMapping(value = "hisPageReturn")
	public String hisPageReturn(ModelMap model, HttpServletRequest request) throws ParseException {
		List<DoorRepairService> doorLists=doorRepairServiceService.findNotReturn();
		List<CommonRepairService> commLists=commonRepairServiceService.findNotReturn();
		Map<String,Integer> map=new HashMap<String,Integer>();
		int size=0;
		if(doorLists!=null && !doorLists.isEmpty()){
//			for(DoorRepairService door:doorLists){
				map.put(Constants.RETURN_STATION_NAME,doorLists.size());
				size+=doorLists.size();
//			}
		}
		if(commLists!=null && !commLists.isEmpty()){
			for(CommonRepairService comm:commLists){
				Integer num=map.get(comm.getStation())==null?0:map.get(comm.getStation());
				num=num+1;
				map.put(comm.getStation(), num);
			}
			size+=commLists.size();
		}
		model.put("pagename", Constants.RETURNPART_SELECT_PAGENAME);
		model.put("size", size);
		model.put("RETURN_MAP", map);
		return "part/returnPart/hisPageReturn";
	}
	
	@RequestMapping(value = "editRepair")
	public String editRepair(ModelMap model, HttpServletRequest request,@RequestParam(value="id") String id) throws ParseException {
		model.addAttribute("t", returnPartService.findOne(id));
		model.addAttribute("returnPartStatus", Constants.MAP_RETURN_PART_STATUS);
		List<Fault> faults=faultService.findByStatus(Constants.SHORT_SIGN_1);
		if(faults!=null && !faults.isEmpty()){
			StringBuffer sb=new StringBuffer();
			sb.append("[");
			for(Fault f:faults){
				sb.append("\""+f.getName()+"\",");
			}
			model.addAttribute("faults", sb.toString().substring(0,sb.toString().length()-1)+"]");
		}
		return "part/returnPart/editRepair";
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean addSave(ReturnPart t,HttpServletRequest request){
		try{
			String printNo="";
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			t.setTransportUserId(user.getId());
			t.setTransportUser(user.getuName());
			t.setTransportDate(date);
			if(StringUtils.isEmpty(t.getDistributionDate())){
				t.setStatus(Constants.NUMBER_0);
				if(Constants.NUMBER_SIGN_4.equals(t.getReturnStatus())){		//DOA_生成采购单
					Supiro supiro=supiroService.findOne(t.getSupiroId());
					t.setSupiroName(supiro.getName());
					t.setStatus(Constants.NUMBER_SIGN_1);
					//生成采购单
					Part _part=partService.findOne(t.getRelPartsId());
					Storage storage=new Storage();
					storage.setSource(Constants.DOA_TYPE);
					storage.setPartId(t.getRelPartsId());
					storage.setPart(t.getRelParts());
					storage.setNumber(t.getNumber());
					storage.setPrice(_part.getPrice());
					storage.setTotal(storage.getPrice()*storage.getNumber());
					storage.setStatus(Constants.NUMBER_SIGN_8);
					storage.setOrdersDate(date);
					storage.setPartRemark(_part.getPartDes());
					storage.setSpeakForStatus(Constants.NOTARRIVE_EN);
					storage.setOperDate(date);
					storage.setOperUserId(user.getId());
					storage.setOperUserName(user.getuName());
					storage.setShelfNo(_part.getRack());
					storageService.save(storage);
					
					String type=t.getRqType();
					String preFix="";
					if(t.getDistribution().equals("level_two_repair_engineer")){
						preFix=Constants.RETURN_NO_PRE_FIX_EJ;
					}else{
						preFix=Constants.RETURN_NO_PRE_FIX_CJ;
					}
					LateplayNo no=lateplayNoService.updateMaxNo(serviceType.R,user.getId(),date,preFix);
					t.setPrintId(no.getId());
					t.setPrintNo(no.getNo());
					printNo=no.getNo();
					String id=t.getRqId();
					Outbound outbound=outboundService.findByRqNo(id);
					outbound.setIsReturn(Constants.NUMBER_SIGN_1);
					outboundService.update(outbound);
					if(Constants.SERVICE_TYPE_IBM_NO.equals(type)){
						CommonRepairService commonRepairService=commonRepairServiceService.findOne(id);
						commonRepairService.setIsReturn(Constants.NUMBER_SIGN_1);
						commonRepairServiceService.update(commonRepairService);
					}else if(Constants.SERVICE_TYPE_CUSTOMER_SERVICE_NO.equals(type)){
						DoorRepairService doorRepairService=doorRepairServiceService.findOne(id);
						doorRepairService.setIsReturn(Constants.NUMBER_SIGN_1);
						doorRepairServiceService.update(doorRepairService);
					}
				}
			}else{
				if(!Constants.NUMBER_SIGN_00.equals(t.getReturnStatus())){
					if(Constants.NUMBER_SIGN_0.equals(t.getReturnStatus()) || Constants.NUMBER_SIGN_1.equals(t.getReturnStatus()) || Constants.NUMBER_SIGN_2.equals(t.getReturnStatus()) || Constants.NUMBER_SIGN_5.equals(t.getReturnStatus())){
						t.setStatus(Constants.NUMBER_SIGN_3);
					}else{
						t.setStatus(Constants.NUMBER_SIGN_1);
					}
					if(Constants.NUMBER_SIGN_4.equals(t.getReturnStatus())){		//DOA_生成采购单
						Supiro supiro=supiroService.findOne(t.getSupiroId());
						t.setSupiroName(supiro.getName());
						//生成采购单
						Part _part=partService.findOne(t.getRelPartsId());
						Storage storage=new Storage();
						storage.setSource(Constants.DOA_TYPE);
						storage.setPartId(t.getRelPartsId());
						storage.setPart(t.getRelParts());
						storage.setNumber(t.getNumber());
						storage.setPrice(_part.getPrice());
						storage.setTotal(storage.getPrice()*storage.getNumber());
						storage.setStatus(Constants.NUMBER_SIGN_8);
						storage.setOrdersDate(date);
						storage.setPartRemark(_part.getPartDes());
						storage.setSpeakForStatus(Constants.NOTARRIVE_EN);
						storage.setOperDate(date);
						storage.setOperUserId(user.getId());
						storage.setOperUserName(user.getuName());
						storage.setShelfNo(_part.getRack());
						storageService.save(storage);
					}
					String type=t.getRqType();
					String preFix="";
					if(t.getDistribution().equals("level_two_repair_engineer")){
						preFix=Constants.RETURN_NO_PRE_FIX_EJ;
					}else{
						preFix=Constants.RETURN_NO_PRE_FIX_CJ;
					}
					LateplayNo no=lateplayNoService.updateMaxNo(serviceType.R,user.getId(),date,preFix);
					t.setPrintId(no.getId());
					t.setPrintNo(no.getNo());
					printNo=no.getNo();
					String id=t.getRqId();
					Outbound outbound=outboundService.findByRqNo(id);
					outbound.setIsReturn(Constants.NUMBER_SIGN_1);
					outboundService.update(outbound);
					if(Constants.SERVICE_TYPE_IBM_NO.equals(type)){
						CommonRepairService commonRepairService=commonRepairServiceService.findOne(id);
						commonRepairService.setIsReturn(Constants.NUMBER_SIGN_1);
						commonRepairServiceService.update(commonRepairService);
					}else if(Constants.SERVICE_TYPE_CUSTOMER_SERVICE_NO.equals(type)){
						DoorRepairService doorRepairService=doorRepairServiceService.findOne(id);
						doorRepairService.setIsReturn(Constants.NUMBER_SIGN_1);
						doorRepairServiceService.update(doorRepairService);
					}
				}
			}
			if(StringUtils.isEmpty(t.getId())){
				returnPartService.save(t);
			}else{
				returnPartService.update(t);
			}
			return AjaxBean.getInstance("success",printNo);
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="addSaveRepair",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean addSaveRepairPut(ReturnPart t,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			ReturnPart returnPart=returnPartService.findOne(t.getId());
			returnPart.setRemark(t.getRemark());
			returnPart.setRepairResult(t.getRepairResult());
			returnPart.setInitFailureTest(t.getInitFailureTest());
			returnPart.setRepairDate(date);
			returnPart.setRepairUserId(user.getId());
			returnPart.setRepairUser(user.getuName());
			returnPart.setScrap(t.getScrap());
			returnPart.setStatus(Constants.NUMBER_SIGN_4);
			returnPartService.update(returnPart);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	//价格调整,wac算法调整
	@RequestMapping(value="addSaveRepair",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean addSaveRepairPost(ReturnPart t,HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			ReturnPart returnPart=returnPartService.findOne(t.getId());
			returnPart.setRemark(t.getRemark());
			returnPart.setRepairResult(t.getRepairResult());
			returnPart.setInitFailureTest(t.getInitFailureTest());
			returnPart.setRepairDate(date);
			returnPart.setRepairUserId(user.getId());
			returnPart.setRepairUser(user.getuName());
			returnPart.setScrap(t.getScrap());
			if(Constants.NUMBER_SIGN_1.equals(t.getRepairResult())){
				returnPart.setStatus(Constants.NUMBER_SIGN_5);
				//返件成功生成入库单
				if(!returnPart.getReturnStatus().equals(Constants.NUMBER_SIGN_4)){
					/**返件除去DOA类型,继续按照原有流程走_Start*/
					Wac wac=wacService.findByPartId(returnPart.getRelPartsId());
					Part part=partService.findOne(returnPart.getRelPartsId());
					Storage storage=new Storage();
					if(Constants.NUMBER_0.equals(returnPart.getReturnStatus())){
						storage.setSource(serviceType.T.toString());
						String no=inNoService.updateMaxNo(serviceType.T,user.getId(),date,Constants.IN_NO_PRE_FIX);
						returnPart.setInOrder(no);
						storage.setInOrder(no);
						//修改添加测试价格是WAC
						storage.setPrice(wac.getPrice());
						storage.setWac(wac.getWac());
						storage.setTotal(returnPart.getNumber()*storage.getWac());
					}else{
						String no=inNoService.updateMaxNo(serviceType.W,user.getId(),date,Constants.IN_NO_PRE_FIX);
						System.out.println("no="+no);
						storage.setSource(serviceType.W.toString());
						returnPart.setInOrder(no);
						storage.setInOrder(no);
						//修改添加测试价格是WAC
						storage.setPrice(wac.getPrice());
						storage.setWac(wac.getWac());
						storage.setTotal(returnPart.getNumber()*(storage.getWac()*0.35));
					}
					storage.setPartId(returnPart.getRelPartsId());
					storage.setPart(returnPart.getRelParts());
					storage.setEngineerId(user.getId());
					storage.setEngineerName(user.getuName());
					storage.setNumber(returnPart.getNumber());
					if(returnPart.getDistribution().equals("initial_check_engineer")){
						storage.setAllotEngineer(Constants.FIRST);
					}else{
						storage.setAllotEngineer(Constants.SECOND);
					}
					storage.setIntactQuantity(returnPart.getNumber());
					storage.setStatus(Constants.NUMBER_0);
					
					
					
//					
//					if(wac!=null){
//						storage.setPrice(wac.getPrice());
//						storage.setWac(wac.getWac());
//						storage.setTotal(storage.getNumber()*storage.getWac());
//					}
					storage.setShelfNo(part.getRack());
					storageService.save(storage);
					/**返件除去DOA类型,继续按照原有流程走_End*/
				}
			}else{
				returnPart.setStatus(Constants.NUMBER_SIGN_00);
			}
			Fault fault=faultService.findByName(t.getInitFailureTest());
			if(fault==null){
				fault=new Fault();
				fault.setName(t.getInitFailureTest());
				fault.setFlag(Constants.SHORT_SIGN_1);
				faultService.save(fault);
			}else{
				if("0".equals(fault.getFlag())){
					fault.setFlag(Constants.SHORT_SIGN_1);
					faultService.update(fault);
				}
			}
			returnPartService.update(returnPart);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value = "print")
	public String toPrintPage(Model model, HttpServletRequest request,@RequestParam(value="search_LIKE_callNo") String search_LIKE_callNo,@RequestParam(value="search_LIKE_printNo") String search_LIKE_printNo) throws ParseException {
		
		List<ReturnPart> rList=returnPartService.findByCallNoOrPrintNo(search_LIKE_callNo,search_LIKE_printNo);
		
		model.addAttribute("search_LIKE_callNo", search_LIKE_callNo);
		model.addAttribute("search_LIKE_printNo", search_LIKE_printNo);
		model.addAttribute("pagename", Constants.RETURNPART_PRINT_PAGENAME);
		model.addAttribute("t", rList);
		return "part/returnPart/print";
	}
	
	@RequestMapping(value = "hisPageReturn2")
	public String toHisPages(Model model, HttpServletRequest request,@RequestParam(value="search_LIKE_callno",required=false) String search_LIKE_callno,@RequestParam(value="search_LIKE_station",required=false) String search_LIKE_station,@RequestParam(value="search_LTE_arrivalTime",required=false) String search_LTE_arrivalTime) throws ParseException {
		int page = (request.getParameter("page") == null || "".equals(request.getParameter("page"))) ? 0 : Integer.parseInt(request.getParameter("page"));
		int size = (request.getParameter("pageSize") == null || "".equals(request.getParameter("page"))) ? Global.getPageSize() : Integer.parseInt(request.getParameter("pageSize"));
		PageRequest pageRequest = new PageRequest(page, size);
		Page<Outbound> pageList=null;
		if(search_LTE_arrivalTime==null || StringUtils.isEmpty(search_LTE_arrivalTime)){
			pageList = outboundService.findReturnPageBySearchs(pageRequest, search_LIKE_callno,search_LIKE_station);
		}else{
			pageList = outboundService.findReturnPageBySearchs(pageRequest, search_LIKE_callno,search_LIKE_station,search_LTE_arrivalTime);
		}
		model.addAttribute("pageHis", pageList);
		model.addAttribute("_pageSize", size);
		model.addAttribute("_page", page);
		model.addAttribute("search_LIKE_callno", search_LIKE_callno);
		model.addAttribute("search_LIKE_station", search_LIKE_station);
		model.addAttribute("search_LTE_arrivalTime", search_LTE_arrivalTime);
		model.addAttribute("_totalPage", pageList.getTotalPages());
		model.addAttribute("accessPath", getViewPrefix()+"/hisPage");
		model.addAttribute("pagename", Constants.RETURNPART_SELECT_PAGENAME); 
		return "part/returnPart/hisPageReturn2";
	}
	
	@RequestMapping(value = "hisPageReturn3")
	public String toHisPages3(Model model, HttpServletRequest request,@RequestParam(value="search_LIKE_callno",required=false) String search_LIKE_callno,@RequestParam(value="search_LIKE_station",required=false) String search_LIKE_station,@RequestParam(value="search_LIKE_status",required=false) String search_LIKE_status) throws ParseException {
		int page = (request.getParameter("page") == null || "".equals(request.getParameter("page"))) ? 0 : Integer.parseInt(request.getParameter("page"));
		int size = (request.getParameter("pageSize") == null || "".equals(request.getParameter("page"))) ? Global.getPageSize() : Integer.parseInt(request.getParameter("pageSize"));
		PageRequest pageRequest = new PageRequest(page, size);
		Page<ReturnPart> pageList= returnPartService.findPageBySearchs(pageRequest, search_LIKE_callno,search_LIKE_station,search_LIKE_status);
		model.addAttribute("pageHis", pageList);
		model.addAttribute("_pageSize", size);
		model.addAttribute("_page", page);
		model.addAttribute("search_LIKE_callno", search_LIKE_callno);
		model.addAttribute("search_LIKE_station", search_LIKE_station);
		model.addAttribute("search_LIKE_status", search_LIKE_status);
		model.addAttribute("_totalPage", pageList.getTotalPages());
		model.addAttribute("accessPath", getViewPrefix()+"/hisPage");
		model.addAttribute("pagename", Constants.RETURNPART_SELECT_PAGENAME); 
		return "part/returnPart/hisPageReturn3";
	}
}


package cn.mk.ndms.modules.sys.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Wac;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.WacService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.common.Global;
import com.springframework.base.controller.GenericCRUDController;
import com.springframework.base.web.Servlets;

@Controller
@RequestMapping("sys/part")
public class PartController extends GenericCRUDController<Part, String>
{
	@Autowired
	private PartService partService;
	
	@Autowired
	private WacService wacService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.PART_PAGENAME;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Part t){
		try{
			Part tt=partService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			partService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="savePart",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean savePartAjax(Part t){
		try{
			Part tt=partService.save(t);
			Wac wac=new Wac();
			wac.setPrice(tt.getPrice());
			wac.setFlag(Constants.SHORT_SIGN_1);
			wac.setPartId(tt.getId());
			wac.setPartNo(tt.getNo());
			wac.setWac(t.getPrice()*Constants.wac_per);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);//年
			int month = cal.get(Calendar.MONTH)+1;//月
			wac.setYears(String.valueOf(year));
			wac.setMonths(String.valueOf(month));
			wac.setDays(Constants.NUMBER_SIGN_1);
			wacService.save(wac);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="savePart",method=RequestMethod.PUT)
	@ResponseBody
	public AjaxBean updatePartAjax(Part t){
		try{
			Part tt=partService.update(t);
			Wac wac=wacService.findByPartId(t.getId());
			if(wac==null){
				wac=new Wac();
				wac.setPrice(tt.getPrice());
				wac.setFlag(Constants.SHORT_SIGN_1);
				wac.setPartId(tt.getId());
				wac.setPartNo(tt.getNo());
//				wac.setWac(t.getPrice()*Constants.wac_per);
				wac.setWac(t.getPrice());
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);//年
				int month = cal.get(Calendar.MONTH)+1;//月
				wac.setYears(String.valueOf(year));
				wac.setMonths(String.valueOf(month));
				wac.setDays(Constants.NUMBER_SIGN_1);
				wacService.save(wac);
			}else{
				wac.setPrice(t.getPrice());
				wacService.update(wac);
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="getParts")
	public String getParts(ModelMap model,@RequestParam(value="parts") String parts){
		List<Part> list=new ArrayList<Part>();
		if(StringUtils.isEmpty(parts)){
			list=partService.findAllByStatus();
		}else{
			Part part=partService.findAllByParts(parts);
			if(part!=null){
				list.add(part);
				if(StringUtils.isNotEmpty(part.getPartFru())){
					String[] frus=part.getPartFru().split(",");
					System.out.println("frus="+frus);
					List<Part> pList=partService.findAllByFru(Arrays.asList(frus));
					list.addAll(pList);
				}
			}
		}
		model.put("parts", list);
		model.put("search_parts", parts);
		return "sys/part/commonSelectPartsDetail";
	}
	
	@RequestMapping(value="checkExist")
	@ResponseBody
	public AjaxBean checkExist(@RequestParam(value="no") String no){
		try{
			Part part=partService.findAllByParts(no);
			if(part!=null && StringUtils.isNotEmpty(part.getId())){
				return AjaxBean.getInstance("success",part.getPartDes(),part.getName(),part.getId());
			}else{
				return AjaxBean.getInstance("error","无此备件!");
			}
			
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="getPart")
	@ResponseBody
	public AjaxBean getPart(@RequestParam(value="no") String no){
		try{
			List<Part> parts=partService.findByPart(no);
			if(parts!=null && !parts.isEmpty()){
				return AjaxBean.getInstance("success",parts.get(0).getName());
			}else{
				return AjaxBean.getInstance("error","无此备件!");
			}
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="checkFru")
	@ResponseBody
	public AjaxBean checkFru(@RequestParam(value="no") String no,@RequestParam(value="part") String part){
		try{
			List<Part> parts=partService.findByPart(part);
			if(parts!=null && !parts.isEmpty()){
				for(Part p:parts){
					if(p.getNo().equals(no)){
						return AjaxBean.getInstance("success");
					}
					String [] ps=p.getPartFru().split(",");
					if(ps!=null && ps.length>0){
						for(String _p:ps){
							if(_p.equals(no)){
								return AjaxBean.getInstance("success");
							}
						}
					}
				}
				return AjaxBean.getInstance("error","不是FRU!");
			}else{
				return AjaxBean.getInstance("error","无此备件!");
			}
			
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="toSelectPartPage")
	public String toSelectPartPage(){
		return "sys/part/commonSelectParts";
	}
	
	@RequestMapping(value = "hisPageSearch")
	public String toSearch(Model model, HttpServletRequest s) throws ParseException {
		int e = (s.getParameter("page") == null || "".equals(s.getParameter("page"))) ? 0 : Integer.parseInt(s.getParameter("page"));
		int z = (s.getParameter("pageSize") == null || "".equals(s.getParameter("page"))) ? Global.getPageSize() : Integer.parseInt(s.getParameter("pageSize"));
		PageRequest p = new PageRequest(e, z);
		Map<String, Object> _p = Servlets.getParametersStartingWith(s, "search_");
		Page<Part> l = partService.findPageBySearch(p, _p);
		model.addAttribute("pageHis", l);
		model.addAttribute("_pageSize", z);
		model.addAttribute("_page", e);
		model.addAttribute("_totalPage", l.getTotalPages());
		model.addAllAttributes(Servlets.encodeParamteterMapWith(_p, "search_"));
		model.addAttribute("accessPath", "sys/part/hisPageSearch");
		return "sys/part/hisPageSearch";
	}
}


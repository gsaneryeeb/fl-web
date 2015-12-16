package cn.mk.ndms.modules.sys.web.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Part;
import cn.mk.ndms.domain.Storage;
import cn.mk.ndms.domain.Wac;
import cn.mk.ndms.modules.sys.service.PartService;
import cn.mk.ndms.modules.sys.service.StorageService;
import cn.mk.ndms.modules.sys.service.WacService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/wac")
public class WacController extends GenericCRUDController<Wac, String>
{
	@Autowired
	private WacService wacService;
	
	@Autowired
	private PartService partService;
	
	@Autowired
	private StorageService storageService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.WAC_PAGENAME;
	}
	
	
	@SuppressWarnings("unused")
	@RequestMapping(value="doWac",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean doWacAjax(Wac t){
		try{
			List<Part> partList=partService.findAllByStatus();
			List<Wac> wacList=wacService.findAllByStatus(Constants.SHORT_SIGN_1);
			if(partList!=null && !partList.isEmpty()){
				List<Part> _partList=new ArrayList<Part>();
				List<Wac> _wacList=new ArrayList<Wac>();
				List<Wac> _nowList=new ArrayList<Wac>();
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);//年
				int month = cal.get(Calendar.MONTH)+1;//月
				int maxDay= cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				int day = cal.get(Calendar.DAY_OF_MONTH);//月
				boolean bl=false;
				if(wacList!=null && !wacList.isEmpty()){
					Wac w=wacList.get(0);
					if(w.getYears().equals(String.valueOf(year))){
						if(!w.getMonths().equals(String.valueOf(month))){
							bl=true;
						}
					}else{
						bl=true;
					}
				}else{
					bl=true;
				}
				if(bl){
					for(Wac _w:wacList){
						_w.setFlag(Constants.SHORT_SIGN_0);
						_wacList.add(_w);
					}
					for(Part _p:partList){
						Wac wac=new Wac();
						wac.setFlag(Constants.SHORT_SIGN_1);
						wac.setMonths(String.valueOf(month));
						wac.setYears(String.valueOf(year));
						wac.setPartId(_p.getId());
						wac.setPartNo(_p.getNo());
						wac.setPrice(_p.getPrice());
						wac.setDays(Constants.NUMBER_SIGN_1);
						List<Storage> storageList=storageService.findByPartId(_p.getId());
						if(storageList!=null && !storageList.isEmpty()){
							Double total=0d;
							Integer num=0;
							for(Storage s:storageList){
								total=total+(s.getTotal()==null?0:s.getTotal());
								num=num+(s.getNumber()==null?0:s.getNumber());
							}
							Double wacPrice=_p.getPrice();
							wacPrice = total/num;
//							if(total!=0){
//								wacPrice=(total/num)*Constants.wac_per;
//							}
							wac.setWac(wacPrice);
							_p.setWac(wacPrice);
						}else{
							Double wacPrice=_p.getPrice();
							wac.setWac(wacPrice);
						}
						_partList.add(_p);
						_nowList.add(wac);
					}
					wacService.updateBatch(_wacList);
					partService.updateBatch(_partList);
					wacService.updateBatch(_nowList);
				}else{
					return AjaxBean.getInstance("error","这月已经计算过WAC了");
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


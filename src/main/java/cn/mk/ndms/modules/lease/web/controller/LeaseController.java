package cn.mk.ndms.modules.lease.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cn.mk.ndms.domain.Lease;
import cn.mk.ndms.domain.LeaseDetail;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.lease.service.LeaseDetailService;
import cn.mk.ndms.modules.lease.service.LeaseNoService;
import cn.mk.ndms.modules.lease.service.LeaseService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.DateTool;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("lease/lease")
public class LeaseController extends GenericCRUDController<Lease, String>
{
	
	@Autowired
	private LeaseService leaseService;
	
	@Autowired
	private LeaseDetailService leaseDetailService;
	
	@Autowired
	private LeaseNoService leaseNoService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.LEASE_PAGENAME;
	}
	
	
	@RequestMapping(value="print")
	public String print(@RequestParam(value="id") String id,HttpServletRequest request,ModelMap map){
		map.put("t", leaseService.findOne(id));
		return "lease/lease/printDetail";
	}
	
	@RequestMapping(value="addParts")
	public String addParts(HttpServletRequest request){
		Integer count=(Integer)request.getSession().getAttribute("COUNT");
		if(count==null){
			count=0;
		}
		count=count.intValue()+1;
		System.out.println("count="+count);
		request.getSession().setAttribute("COUNT", count);
		return "lease/lease/parts";
	}
	
	@RequestMapping(value="addSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean saveAjaxs(Lease t,@RequestParam(value="machineModels",required = false) String[] machineModels,
			@RequestParam(value="machineSerials",required = false) String[] machineSerials,
			@RequestParam(value="boardNos",required = false) String[] boardNos,@RequestParam(value="hardDisks",required = false) String[] hardDisks,
			@RequestParam(value="batteryNums",required = false) String[] batteryNums,
			@RequestParam(value="powerNums",required = false) String[] powerNums,@RequestParam(value="cdNums",required = false) String[] cdNums,
			@RequestParam(value="keyboardNums",required = false) String[] keyboardNums,@RequestParam(value="hireTimes",required = false) String[] hireTimes,
			@RequestParam(value="rentTimes",required = false) String[] rentTimes,@RequestParam(value="isDeposits",required = false) String[] isDeposits,
			@RequestParam(value="leasingAmounts",required = false) Float[] leasingAmounts,@RequestParam(value="returnTimes",required = false) String[] returnTimes,
			@RequestParam(value="extendedCharges",required = false) String[] extendedCharges,@RequestParam(value="amountFeess",required = false) Float[] amountFeess,
			@RequestParam(value="remarks",required = false) String[] remarks,
			@RequestParam(value="cpus",required = false) String[] cpus,
			@RequestParam(value="memoryInfs",required = false) String[] memoryInfs,
			@RequestParam(value="hardDiskInfs",required = false) String[] hardDiskInfs,
			@RequestParam(value="appearances",required = false) String[] appearances,
			@RequestParam(value="prices",required = false) Float[] prices,
			@RequestParam(value="chargePeriods",required = false) String[] chargePeriods,
			@RequestParam(value="returnStatuss",required = false) String[] returnStatuss,
			@RequestParam(value="ifCharges",required = false) String[] ifCharges,
			@RequestParam(value="chargePrices",required = false) Float[] chargePrices,
			@RequestParam(value="memoryNum1s",required = false) String[] memoryNum1s,
			@RequestParam(value="memoryNum2s",required = false) String[] memoryNum2s,
			@RequestParam(value="memoryNum3s",required = false) String[] memoryNum3s,
			@RequestParam(value="memoryNum4s",required = false) String[] memoryNum4s,
			HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String id=leaseNoService.updateMaxNo(user.getId(), date);
			if(machineModels!=null && machineModels.length>0){
				Lease tt=new Lease();
				tt.setAdress(t.getAdress());
				tt.setTel(t.getTel());
				tt.setLeasePro(t.getLeasePro());
				tt.setCusName(t.getCusName());
				tt.setCusAdress(t.getCusAdress());
				tt.setCusTel(t.getCusTel());
				tt.setCusId(t.getCusId());
				tt.setCharge(t.getCharge());
				tt.setChargePeriod(t.getChargePeriod());
				tt.setLicenseNum(t.getLicenseNum());
				tt.setOrganizationCode(t.getOrganizationCode());
				tt.setTaxReg(t.getTaxReg());
				tt.setCpu(t.getCpu());
				tt.setMemoryInf(t.getMemoryInf());
				tt.setHardDiskInf(t.getHardDiskInf());
				tt.setOperationStatus(t.getOperationStatus());
				tt.setAppearance(t.getAppearance());
				tt.setOperationNote(t.getOperationNote());
				tt.setConfirm(t.getConfirm());
				tt.setAcceptance(t.getAcceptance());
				tt.setAcceptanceTime(t.getAcceptanceTime());
				tt.setSignature(t.getSignature());
				tt.setSignatureTime(t.getSignatureTime());
				tt.setAttnSignature(t.getAttnSignature());
				tt.setAttnSignatureTime(t.getAttnSignatureTime());
				tt.setcUserId(user.getId());
				tt.setcUser(user.getuName());
				tt.setcDate(date);
				tt.setChargePrice(t.getChargePrice());
				tt.setNo(id);
				tt.setContractNo(t.getContractNo());
				tt=leaseService.save(tt);
				for(int i=0;i<machineModels.length;i++){
					LeaseDetail detail=new LeaseDetail();
					detail.setLeaseId(tt.getId());
					if(machineModels.length==1){
						if(machineModels.length>0){
							detail.setMachineModel(machineModels[i]);
						}
						if(machineSerials.length>0){
							detail.setMachineSerial(machineSerials[i]);
						}
						if(boardNos.length>0){
							detail.setBoardNo(boardNos[i]);
						}
						if(hardDisks.length>0){
							detail.setHardDisk(hardDisks[i]);
						}
						if(batteryNums.length>0){
							detail.setBatteryNum(batteryNums[i]);
						}
//						if(memoryNums.length>0){
//							detail.setMemoryNum(memoryNums[i]);
//						}
						if(memoryNum1s.length>0){
							detail.setMemoryNum1(memoryNum1s[i]);
						}
						if(memoryNum2s.length>0){
							detail.setMemoryNum2(memoryNum2s[i]);
						}
						if(memoryNum3s.length>0){
							detail.setMemoryNum3(memoryNum3s[i]);
						}
						if(memoryNum4s.length>0){
							detail.setMemoryNum4(memoryNum4s[i]);
						}
						
						if(powerNums.length>0){
							detail.setPowerNum(powerNums[i]);
						}
						if(cdNums.length>0){
							detail.setCdNum(cdNums[i]);
						}
						if(keyboardNums.length>0){
							detail.setKeyboardNum(keyboardNums[i]);
						}
						if(hireTimes.length>0){
							detail.setHireTime(hireTimes[i]+" 00:00:00");
						}
						if(rentTimes.length>0){
							detail.setRentTime(rentTimes[i]+" 00:00:00");
						}
						if(leasingAmounts.length>0){
							detail.setIsDeposit(leasingAmounts[i]==null?"NO":"YES");
						}
						if(leasingAmounts.length>0){
							detail.setLeasingAmount(leasingAmounts[i]);
						}
						if(returnTimes.length>0){
							if(StringUtils.isNotEmpty(returnTimes[i])){
								detail.setReturnTime(returnTimes[i]);
							}
						}
						if(amountFeess.length>0){
							detail.setExtendedCharge(amountFeess[i]==null?"NO":"YES");
						}
						if(cpus.length>0){
							detail.setCpu(cpus[i]);
						}
						if(memoryInfs.length>0){
							detail.setMemoryInf(memoryInfs[i]);
						}
						if(hardDiskInfs.length>0){
							detail.setHardDiskInf(hardDiskInfs[i]);
						}
						if(appearances.length>0){
							detail.setAppearance(appearances[i]);
						}
						if(prices.length>0){
							detail.setPrice(prices[i]);
						}
						if(chargePeriods.length>0){
							detail.setChargePeriod(chargePeriods[i]);
						}
						if(returnStatuss.length>0){
							detail.setReturnStatus(returnStatuss[i]);
						}
						if(ifCharges!=null && ifCharges.length>0){
							detail.setIfCharge(ifCharges[i]);
						}
						if(chargePrices.length>0){
							detail.setChargePrice(chargePrices[i]);
						}
						if(amountFeess.length>0){
							detail.setAmountFees(amountFeess[i]);
						}
						if(remarks.length>0){
							detail.setRemark(remarks[i]);
						}
					}else{
						detail.setMachineModel(machineModels[i]);
						detail.setMachineSerial(machineSerials[i]);
						detail.setBoardNo(boardNos[i]);
						detail.setHardDisk(hardDisks[i]);
						detail.setBatteryNum(batteryNums[i]);
						//detail.setMemoryNum(memoryNums[i]);
						detail.setMemoryNum1(memoryNum1s[i]);
						detail.setMemoryNum2(memoryNum2s[i]);
						detail.setMemoryNum3(memoryNum3s[i]);
						detail.setMemoryNum4(memoryNum4s[i]);
						
						detail.setPowerNum(powerNums[i]);
						detail.setCdNum(cdNums[i]);
						detail.setKeyboardNum(keyboardNums[i]);
						if(StringUtils.isNotEmpty(hireTimes[i])){
							detail.setHireTime(hireTimes[i]+" 00:00:00");
						}
						if(StringUtils.isNotEmpty(rentTimes[i])){
							detail.setRentTime(rentTimes[i]+" 00:00:00");
						}
						detail.setIsDeposit(leasingAmounts[i]==null?"NO":"YES");
						detail.setLeasingAmount(leasingAmounts[i]);
						if(StringUtils.isNotEmpty(returnTimes[i])){
							detail.setReturnTime(returnTimes[i]);
						}
						detail.setExtendedCharge(amountFeess[i]==null?"NO":"YES");
						detail.setAmountFees(amountFeess[i]);
						
							detail.setCpu(cpus[i]);
							detail.setMemoryInf(memoryInfs[i]);
							detail.setHardDiskInf(hardDiskInfs[i]);
							detail.setAppearance(appearances[i]);
							detail.setPrice(prices[i]);
							detail.setChargePeriod(chargePeriods[i]);
							detail.setReturnStatus(returnStatuss[i]);
							detail.setIfCharge(ifCharges==null?null:ifCharges[i]);
							detail.setChargePrice(chargePrices[i]);
						detail.setRemark(remarks[i]);
					}
					leaseDetailService.save(detail);
				}
			}else{
				t.setStatus(Constants.NUMBER_SIGN_0);
				leaseService.save(t);
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="edit")
	public String edit(HttpServletRequest request,@RequestParam(value="id") String[] id,@RequestParam(value="mainId") String mainId){
		request.getSession().setAttribute("_t", leaseService.findOne(mainId));
		request.getSession().setAttribute("_d", leaseDetailService.findByIds(id));
		request.getSession().setAttribute("_detailIds", id);
		return "lease/lease/update";
	}
	
	@RequestMapping(value="updateSave",method=RequestMethod.POST)
	@ResponseBody
	public AjaxBean updateAjaxs(Lease t,@RequestParam(value="machineModels",required = false) String[] machineModels,
			@RequestParam(value="machineSerials",required = false) String[] machineSerials,
			@RequestParam(value="boardNos",required = false) String[] boardNos,@RequestParam(value="hardDisks",required = false) String[] hardDisks,
			@RequestParam(value="batteryNums",required = false) String[] batteryNums,
			@RequestParam(value="powerNums",required = false) String[] powerNums,@RequestParam(value="cdNums",required = false) String[] cdNums,
			@RequestParam(value="keyboardNums",required = false) String[] keyboardNums,@RequestParam(value="hireTimes",required = false) String[] hireTimes,
			@RequestParam(value="rentTimes",required = false) String[] rentTimes,@RequestParam(value="isDeposits",required = false) String[] isDeposits,
			@RequestParam(value="leasingAmounts",required = false) Float[] leasingAmounts,@RequestParam(value="returnTimes",required = false) String[] returnTimes,
			@RequestParam(value="extendedCharges",required = false) String[] extendedCharges,@RequestParam(value="amountFeess",required = false) Float[] amountFeess,
			@RequestParam(value="remarks",required = false) String[] remarks,
			@RequestParam(value="cpus",required = false) String[] cpus,
			@RequestParam(value="memoryInfs",required = false) String[] memoryInfs,
			@RequestParam(value="hardDiskInfs",required = false) String[] hardDiskInfs,
			@RequestParam(value="appearances",required = false) String[] appearances,
			@RequestParam(value="prices",required = false) Float[] prices,
			@RequestParam(value="chargePeriods",required = false) String[] chargePeriods,
			@RequestParam(value="returnStatuss",required = false) String[] returnStatuss,
			@RequestParam(value="ifCharges",required = false) String[] ifCharges,
			@RequestParam(value="chargePrices",required = false) Float[] chargePrices,
			@RequestParam(value="memoryNum1s",required = false) String[] memoryNum1s,
			@RequestParam(value="memoryNum2s",required = false) String[] memoryNum2s,
			@RequestParam(value="memoryNum3s",required = false) String[] memoryNum3s,
			@RequestParam(value="memoryNum4s",required = false) String[] memoryNum4s,
			HttpServletRequest request){
		try{
			User user=(User)request.getSession().getAttribute("USER");
			String date=DateTool.longFormat(new Date());
			String id=leaseNoService.updateMaxNo(user.getId(), date);
			if(machineModels!=null && machineModels.length>0){
				Lease tt=leaseService.findOne(t.getId());
				tt.setAdress(t.getAdress());
				tt.setTel(t.getTel());
				tt.setLeasePro(t.getLeasePro());
				tt.setCusName(t.getCusName());
				tt.setCusAdress(t.getCusAdress());
				tt.setCusTel(t.getCusTel());
				tt.setCusId(t.getCusId());
				tt.setCharge(t.getCharge());
				tt.setChargePeriod(t.getChargePeriod());
				tt.setChargePrice(t.getChargePrice());
				tt.setLicenseNum(t.getLicenseNum());
				tt.setOrganizationCode(t.getOrganizationCode());
				tt.setTaxReg(t.getTaxReg());
				tt.setCpu(t.getCpu());
				tt.setMemoryInf(t.getMemoryInf());
				tt.setHardDiskInf(t.getHardDiskInf());
				tt.setOperationStatus(t.getOperationStatus());
				tt.setAppearance(t.getAppearance());
				tt.setOperationNote(t.getOperationNote());
				tt.setConfirm(t.getConfirm());
				tt.setAcceptance(t.getAcceptance());
				tt.setAcceptanceTime(t.getAcceptanceTime());
				tt.setSignature(t.getSignature());
				tt.setSignatureTime(t.getSignatureTime());
				tt.setAttnSignature(t.getAttnSignature());
				tt.setAttnSignatureTime(t.getAttnSignatureTime());
				tt.setcUserId(user.getId());
				tt.setcUser(user.getuName());
				tt.setcDate(date);
				tt.setNo(t.getNo());
				tt.setContractNo(t.getContractNo());
				tt=leaseService.update(tt);
				String[] _ids = (String[])request.getSession().getAttribute("_detailIds");
				List<String> idsList=new ArrayList<String>();
				if(_ids!=null && _ids.length>0){
					for(String i:_ids){
						idsList.add(i);
					}
				}
				leaseDetailService.deleteByIds(idsList);
				for(int i=0;i<machineModels.length;i++){
					
					LeaseDetail detail=new LeaseDetail();
					detail.setLeaseId(tt.getId());
					if(machineModels.length==1){
						if(machineModels.length>0){
							detail.setMachineModel(machineModels[i]);
						}
						if(machineSerials.length>0){
							detail.setMachineSerial(machineSerials[i]);
						}
						if(boardNos.length>0){
							detail.setBoardNo(boardNos[i]);
						}
						if(hardDisks.length>0){
							detail.setHardDisk(hardDisks[i]);
						}
						if(batteryNums.length>0){
							detail.setBatteryNum(batteryNums[i]);
						}
//						if(memoryNums.length>0){
//							detail.setMemoryNum(memoryNums[i]);
//						}
						if(memoryNum1s.length>0){
							detail.setMemoryNum1(memoryNum1s[i]);
						}
						if(memoryNum2s.length>0){
							detail.setMemoryNum2(memoryNum2s[i]);
						}
						if(memoryNum3s.length>0){
							detail.setMemoryNum3(memoryNum3s[i]);
						}
						if(memoryNum4s.length>0){
							detail.setMemoryNum4(memoryNum4s[i]);
						}
						if(powerNums.length>0){
							detail.setPowerNum(powerNums[i]);
						}
						if(cdNums.length>0){
							detail.setCdNum(cdNums[i]);
						}
						if(keyboardNums.length>0){
							detail.setKeyboardNum(keyboardNums[i]);
						}
						if(hireTimes.length>0){
							detail.setHireTime(hireTimes[i]+" 00:00:00");
						}
						if(rentTimes.length>0){
							detail.setRentTime(rentTimes[i]+" 00:00:00");
						}
						if(leasingAmounts.length>0){
							detail.setIsDeposit(leasingAmounts[i]==null?"NO":"YES");
						}
						if(leasingAmounts.length>0){
							detail.setLeasingAmount(leasingAmounts[i]);
						}
						if(returnTimes.length>0){
							if(StringUtils.isNotEmpty(returnTimes[i])){
								detail.setReturnTime(returnTimes[i]);
							}
						}
						if(amountFeess.length>0){
							detail.setExtendedCharge(amountFeess[i]==null?"NO":"YES");
						}
						if(amountFeess.length>0){
							detail.setAmountFees(amountFeess[i]);
						}
						if(cpus.length>0){
							detail.setCpu(cpus[i]);
						}
						if(memoryInfs.length>0){
							detail.setMemoryInf(memoryInfs[i]);
						}
						if(hardDiskInfs.length>0){
							detail.setHardDiskInf(hardDiskInfs[i]);
						}
						if(appearances.length>0){
							detail.setAppearance(appearances[i]);
						}
						if(prices.length>0){
							detail.setPrice(prices[i]);
						}
						if(chargePeriods.length>0){
							detail.setChargePeriod(chargePeriods[i]);
						}
						
						if(returnStatuss.length>0){
							detail.setReturnStatus(returnStatuss[i]);
						}
						if(ifCharges!=null && ifCharges.length>0){
							detail.setIfCharge(ifCharges[i]);
						}
						if(chargePrices.length>0){
							detail.setChargePrice(chargePrices[i]);
						}
						if(remarks.length>0){
							detail.setRemark(remarks[i]);
						}
						leaseDetailService.save(detail);
					}else{
						detail.setMachineModel(machineModels[i]);
						detail.setMachineSerial(machineSerials[i]);
						detail.setBoardNo(boardNos[i]);
						detail.setHardDisk(hardDisks[i]);
						detail.setBatteryNum(batteryNums[i]);
//						detail.setMemoryNum(memoryNums[i]);
						detail.setMemoryNum1(memoryNum1s[i]);
						detail.setMemoryNum2(memoryNum2s[i]);
						detail.setMemoryNum3(memoryNum3s[i]);
						detail.setMemoryNum4(memoryNum4s[i]);
						
						detail.setPowerNum(powerNums[i]);
						detail.setCdNum(cdNums[i]);
						detail.setKeyboardNum(keyboardNums[i]);
						if(StringUtils.isNotEmpty(hireTimes[i])){
							detail.setHireTime(hireTimes[i]+" 00:00:00");
						}
						if(StringUtils.isNotEmpty(rentTimes[i])){
							detail.setRentTime(rentTimes[i]+" 00:00:00");
						}
						detail.setIsDeposit(leasingAmounts[i]==null?"NO":"YES");
						detail.setLeasingAmount(leasingAmounts[i]);
						if(StringUtils.isNotEmpty(returnTimes[i])){
							detail.setReturnTime(returnTimes[i]);
						}
						detail.setExtendedCharge(amountFeess[i]==null?"NO":"YES");
						detail.setAmountFees(amountFeess[i]);
						
							detail.setCpu(cpus[i]);
							detail.setMemoryInf(memoryInfs[i]);
							detail.setHardDiskInf(hardDiskInfs[i]);
							detail.setAppearance(appearances[i]);
							detail.setPrice(prices[i]);
							detail.setChargePeriod(chargePeriods[i]);
							detail.setReturnStatus(returnStatuss[i]);
							detail.setIfCharge(ifCharges==null?null:ifCharges[i]);
							detail.setChargePrice(chargePrices[i]);
						
						detail.setRemark(remarks[i]);
						leaseDetailService.save(detail);
					}
				}
			}else{
				t.setStatus(Constants.NUMBER_SIGN_0);
				leaseService.save(t);
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			System.out.println("==================="+ex.getMessage());
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	//上传
	@RequestMapping(value="upload",method=RequestMethod.POST)
	@ResponseBody
    public AjaxBean upload(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        try{
        	 CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
             request.getSession().getServletContext());
             if (multipartResolver.isMultipart(request)) {
                 MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                 Iterator<String> iter = multiRequest.getFileNames();
                 while (iter.hasNext()) {
                     MultipartFile file = multiRequest.getFile((String) iter.next());
                     if (file != null) {
                         String fileName = file.getOriginalFilename();
                         String path1 = Thread.currentThread().getContextClassLoader().getResource("").getPath() + "file" + File.separator;
                         //  下面的加的日期是为了防止上传的名字一样
                         String path2=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + fileName;
                         String path = path1 +path2 ;
                         File localFile = new File(path);
                         file.transferTo(localFile);
                         Lease lease = leaseService.findOne(request.getParameter("id"));
                         lease.setFilePath(path2);
                         leaseService.update(lease);
                     }
                 }
             }
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
    }
	
    @RequestMapping("toUpload")
    public String toUpload(String id,ModelMap map) {
    	map.put("t", leaseService.findOne(id));
        return "lease/lease/upload";
    }
 
    @RequestMapping("download")
    public String download(String fileName, HttpServletRequest request,
            HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName="
                + fileName);
        try {
            String path = Thread.currentThread().getContextClassLoader()
                    .getResource("").getPath()
                    + "file";//这个download目录为啥建立在classes下的
            InputStream inputStream = new FileInputStream(new File(path
                    + File.separator + fileName));
 
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
             // 这里主要关闭。
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
            //  返回值要注意，要不然就出现下面这句错误！
            //java+getOutputStream() has already been called for this response
        return null;
    }
}


package cn.mk.ndms.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_common_repair_service database table.
 * 
 */
@Entity
@Table(name="NM_TB_LEASE")
public class Lease extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	
	private String no;					//编号
	private String adress;				//地址
	private String tel;					//联系电话
	private String leasePro;			//租赁性质
	private String cusName;				//客户姓名
	private String cusAdress;			//客户地址
	private String cusTel;				//客户联系电话
	private String cusId;				//身份证
	private String charge;				//收费方式
	
	private Float chargePrice;				//收费金额
	
	private String chargePeriod;		//收费周期
	private String licenseNum;			//营业执照注册号
	private String organizationCode;	//组织机构代码证
	private String taxReg;				//税务登记证
	private String organizationFile;	//组织机构代码证附件
	private String taxRegFile;			//税务登记证附件
	private String licenseFile;		//营业执照注册号附件
	
	private String machineModel;		//机器型号
	private String machineSerial;		//机器序列号
	private String boardNo;				//主板编号
	private String hardDisk;			//硬盘编号
	private String batteryNum;			//电池编号
	private String memoryNum;			//内存编号
	private String powerNum;			//电源编号
	private String cdNum;				//光驱编号
	private String keyboardNum;			//键盘编号
	
	private Float price;				//租赁价格
	private Short ifCharge;				//是否收费 
	private String returnStatus;		//返回状态
	private String contractNo;			//合同编号
	
	private String hireTime;			//起租时间
	private String rentTime;			//到租时间
	private String isDeposit;			//是否有押金
	private Float leasingAmount;		//租赁金额
	private String returnTime;			//机器返回时间
	private String extendedCharge;		//超期是否收费
	private Float amountFees;			//收费金额
	private String remark;				//备注
	private String cpu;					//CPU信息
	private String memoryInf;			//内存信息
	private String hardDiskInf;			//硬盘信息
	private String operationStatus;		//运行状况
	private String appearance;			//外观
	private String operationNote;		//备件运行备注
	private String confirm;				//确认签字
	private String confirmTime;			//确认时间
	private String acceptance;			//验收人
	private String acceptanceTime;		//验收日期
	private String signature;			//客户签名
	private String signatureTime;		//签名日期
	private String attnSignature;		//经办人签字
	private String attnSignatureTime;	//经办日期
	private String status;				//状态
	private String cUserId;				//创建人ID
	private String cUser;				//创建人
	private String cDate;				//创建时间
	private String company;				//公司
	private String filePath;			// 
	
	private Set<LeaseDetail> leaseDetails;	//明细
	
	public Lease() {
	}
	
	@Column(name="NO")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	@Column(name="ADRESS")
	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Column(name="TEL")
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name="LEASE_PRO")
	public String getLeasePro() {
		return leasePro;
	}

	public void setLeasePro(String leasePro) {
		this.leasePro = leasePro;
	}

	@Column(name="CUS_NAME")
	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	@Column(name="CUS_ID")
	public String getCusId() {
		return cusId;
	}

	public void setCusId(String cusId) {
		this.cusId = cusId;
	}

	@Column(name="CHARGE")
	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	@Column(name="CHARGE_PERIOD")
	public String getChargePeriod() {
		return chargePeriod;
	}

	public void setChargePeriod(String chargePeriod) {
		this.chargePeriod = chargePeriod;
	}

	@Column(name="LICENSE_NUM")
	public String getLicenseNum() {
		return licenseNum;
	}

	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}

	@Column(name="ORGANIZATION_CODE")
	public String getOrganizationCode() {
		return organizationCode;
	}

	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}

	@Column(name="TAX_REG")
	public String getTaxReg() {
		return taxReg;
	}

	public void setTaxReg(String taxReg) {
		this.taxReg = taxReg;
	}

	@Column(name="MACHINE_MODEL")
	public String getMachineModel() {
		return machineModel;
	}

	public void setMachineModel(String machineModel) {
		this.machineModel = machineModel;
	}

	@Column(name="MACHINE_SERIAL")
	public String getMachineSerial() {
		return machineSerial;
	}

	public void setMachineSerial(String machineSerial) {
		this.machineSerial = machineSerial;
	}

	@Column(name="BOARD_NO")
	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	@Column(name="HARD_DISK")
	public String getHardDisk() {
		return hardDisk;
	}

	public void setHardDisk(String hardDisk) {
		this.hardDisk = hardDisk;
	}

	@Column(name="BATTERY_NUM")
	public String getBatteryNum() {
		return batteryNum;
	}

	public void setBatteryNum(String batteryNum) {
		this.batteryNum = batteryNum;
	}

	@Column(name="MEMORY_NUM")
	public String getMemoryNum() {
		return memoryNum;
	}

	public void setMemoryNum(String memoryNum) {
		this.memoryNum = memoryNum;
	}

	@Column(name="POWER_NUM")
	public String getPowerNum() {
		return powerNum;
	}

	public void setPowerNum(String powerNum) {
		this.powerNum = powerNum;
	}

	@Column(name="CD_NUM")
	public String getCdNum() {
		return cdNum;
	}

	public void setCdNum(String cdNum) {
		this.cdNum = cdNum;
	}

	@Column(name="KEYBOARD_NUM")
	public String getKeyboardNum() {
		return keyboardNum;
	}

	public void setKeyboardNum(String keyboardNum) {
		this.keyboardNum = keyboardNum;
	}

	@Column(name="HIRE_TIME")
	public String getHireTime() {
		return hireTime;
	}

	public void setHireTime(String hireTime) {
		this.hireTime = hireTime;
	}

	@Column(name="RENT_TIME")
	public String getRentTime() {
		return rentTime;
	}

	public void setRentTime(String rentTime) {
		this.rentTime = rentTime;
	}

	@Column(name="IS_DEPOSIT")
	public String getIsDeposit() {
		return isDeposit;
	}

	public void setIsDeposit(String isDeposit) {
		this.isDeposit = isDeposit;
	}

	@Column(name="LEASING_AMOUNT")
	public Float getLeasingAmount() {
		return leasingAmount;
	}

	public void setLeasingAmount(Float leasingAmount) {
		this.leasingAmount = leasingAmount;
	}

	@Column(name="RETURN_TIME")
	public String getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}

	@Column(name="EXTENDED_CHARGE")
	public String getExtendedCharge() {
		return extendedCharge;
	}

	public void setExtendedCharge(String extendedCharge) {
		this.extendedCharge = extendedCharge;
	}

	@Column(name="AMOUNT_FEES")
	public Float getAmountFees() {
		return amountFees;
	}

	public void setAmountFees(Float amountFees) {
		this.amountFees = amountFees;
	}

	@Column(name="REMARK")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Column(name="CPU")
	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	@Column(name="MEMORY_INF")
	public String getMemoryInf() {
		return memoryInf;
	}

	public void setMemoryInf(String memoryInf) {
		this.memoryInf = memoryInf;
	}

	@Column(name="HARD_DISK_INF")
	public String getHardDiskInf() {
		return hardDiskInf;
	}

	public void setHardDiskInf(String hardDiskInf) {
		this.hardDiskInf = hardDiskInf;
	}

	@Column(name="OPERATION_STATUS")
	public String getOperationStatus() {
		return operationStatus;
	}

	public void setOperationStatus(String operationStatus) {
		this.operationStatus = operationStatus;
	}

	@Column(name="APPEARANCE")
	public String getAppearance() {
		return appearance;
	}

	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}

	@Column(name="OPERATION_NOTE")
	public String getOperationNote() {
		return operationNote;
	}

	public void setOperationNote(String operationNote) {
		this.operationNote = operationNote;
	}

	@Column(name="ACCEPTANCE")
	public String getAcceptance() {
		return acceptance;
	}

	public void setAcceptance(String acceptance) {
		this.acceptance = acceptance;
	}

	@Column(name="ACCEPTANCE_TIME")
	public String getAcceptanceTime() {
		return acceptanceTime;
	}

	public void setAcceptanceTime(String acceptanceTime) {
		this.acceptanceTime = acceptanceTime;
	}
	
	@Column(name="SIGNATURE")
	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}
	
	@Column(name="SIGNATURE_TIME")
	public String getSignatureTime() {
		return signatureTime;
	}

	public void setSignatureTime(String signatureTime) {
		this.signatureTime = signatureTime;
	}

	@Column(name="ATTN_SIGNATURE")
	public String getAttnSignature() {
		return attnSignature;
	}

	public void setAttnSignature(String attnSignature) {
		this.attnSignature = attnSignature;
	}

	@Column(name="ATTN_SIGNATURE_TIME")
	public String getAttnSignatureTime() {
		return attnSignatureTime;
	}

	public void setAttnSignatureTime(String attnSignatureTime) {
		this.attnSignatureTime = attnSignatureTime;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="C_USER_ID")
	public String getcUserId() {
		return cUserId;
	}

	public void setcUserId(String cUserId) {
		this.cUserId = cUserId;
	}

	@Column(name="C_USER")
	public String getcUser() {
		return cUser;
	}

	public void setcUser(String cUser) {
		this.cUser = cUser;
	}

	@Column(name="C_DATE")
	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	@Column(name="COMPANY")
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Column(name="CUS_ADRESS")
	public String getCusAdress() {
		return cusAdress;
	}

	public void setCusAdress(String cusAdress) {
		this.cusAdress = cusAdress;
	}

	@Column(name="CUS_TEL")
	public String getCusTel() {
		return cusTel;
	}

	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	
	@Column(name="ORGANIZATION_FILE")
	public String getOrganizationFile() {
		return organizationFile;
	}

	public void setOrganizationFile(String organizationFile) {
		this.organizationFile = organizationFile;
	}
	
	@Column(name="TAX_REG_FILE")
	public String getTaxRegFile() {
		return taxRegFile;
	}

	public void setTaxRegFile(String taxRegFile) {
		this.taxRegFile = taxRegFile;
	}
	
	@Column(name="LICENSE_FILE")
	public String getLicenseFile() {
		return licenseFile;
	}

	public void setLicenseFile(String licenseFile) {
		this.licenseFile = licenseFile;
	}
	
	@Column(name="CONFIRM")
	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
	@Column(name="CONFIRM_TIME")
	public String getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}

	@OneToMany(targetEntity=LeaseDetail.class,fetch=FetchType.EAGER)
	@JoinColumn(name="LEASE_ID",insertable=false,updatable=false)
	public Set<LeaseDetail> getLeaseDetails() {
		return leaseDetails;
	}

	public void setLeaseDetails(Set<LeaseDetail> leaseDetails) {
		this.leaseDetails = leaseDetails;
	}

	@Column(name="PRICE")
	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name="IF_CHARGE")
	public Short getIfCharge() {
		return ifCharge;
	}

	public void setIfCharge(Short ifCharge) {
		this.ifCharge = ifCharge;
	}

	@Column(name="RETURN_STATUS")
	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	@Column(name="CONTRACT_NO")
	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	@Column(name="CHARGE_PRICE")
	public Float getChargePrice() {
		return chargePrice;
	}

	public void setChargePrice(Float chargePrice) {
		this.chargePrice = chargePrice;
	}

	@Column(name="FILE_PATH")
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	

}
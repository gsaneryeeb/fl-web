package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_common_repair_service database table.
 * 
 */
@Entity
@Table(name="NM_TB_LEASE_DETAIL")
public class LeaseDetail extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	
	
	private String leaseId;		//租赁ID
	private String machineModel;		//机器型号
	private String machineSerial;		//机器序列号
	private String boardNo;				//主板编号
	private String hardDisk;			//硬盘编号
	private String batteryNum;			//电池编号
	private String memoryNum;			//内存编号
	
	private String memoryNum1;			//内存编号1
	private String memoryNum2;			//内存编号2
	private String memoryNum3;			//内存编号3
	private String memoryNum4;			//内存编号4
	
	
	private String powerNum;			//电源编号
	private String cdNum;				//光驱编号
	private String keyboardNum;			//键盘编号
	
	private Float price;				//租赁价格
	private String ifCharge;			//是否收费 
	private Float chargePrice;			//费用
	private String returnStatus;		//返回状态
	private String contractNo;			//合同编号
	
	private String cpu;					//CPU信息
	private String memoryInf;			//内存信息
	
	
	
	private String hardDiskInf;			//硬盘信息
	private String appearance;			//外观
	private String chargePeriod;		//周期
	
	private String hireTime;			//起租时间
	private String rentTime;			//到租时间
	private String isDeposit;			//是否有押金
	private Float leasingAmount;		//租赁金额
	private String returnTime;			//机器返回时间
	private String extendedCharge;		//超期是否收费
	private Float amountFees;			//收费金额
	private String remark;				//备注
	private String status;				//状态
	private Lease lease;				//租赁
	public LeaseDetail() {
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

	@Column(name="STATUS")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="LEASE_ID")
	public String getLeaseId() {
		return leaseId;
	}

	public void setLeaseId(String leaseId) {
		this.leaseId = leaseId;
	}

	@ManyToOne(targetEntity=Lease.class,fetch=FetchType.LAZY)
	@JoinColumn(name="LEASE_ID",insertable=false,updatable=false)
	public Lease getLease() {
		return lease;
	}

	public void setLease(Lease lease) {
		this.lease = lease;
	}


	@Column(name="PRICE")
	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	@Column(name="IF_CHARGE")
	public String getIfCharge() {
		return ifCharge;
	}

	public void setIfCharge(String ifCharge) {
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

	@Column(name="APPEARANCE")
	public String getAppearance() {
		return appearance;
	}

	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}

	@Column(name="CHARGE_PERIOD")
	public String getChargePeriod() {
		return chargePeriod;
	}

	public void setChargePeriod(String chargePeriod) {
		this.chargePeriod = chargePeriod;
	}

	@Column(name="CHARGE_PRICE")
	public Float getChargePrice() {
		return chargePrice;
	}

	public void setChargePrice(Float chargePrice) {
		this.chargePrice = chargePrice;
	}
	
	@Column(name="MEMORY_NUM1")
	public String getMemoryNum1() {
		return memoryNum1;
	}

	public void setMemoryNum1(String memoryNum1) {
		this.memoryNum1 = memoryNum1;
	}

	@Column(name="MEMORY_NUM2")
	public String getMemoryNum2() {
		return memoryNum2;
	}

	public void setMemoryNum2(String memoryNum2) {
		this.memoryNum2 = memoryNum2;
	}

	@Column(name="MEMORY_NUM3")
	public String getMemoryNum3() {
		return memoryNum3;
	}

	public void setMemoryNum3(String memoryNum3) {
		this.memoryNum3 = memoryNum3;
	}

	@Column(name="MEMORY_NUM4")
	public String getMemoryNum4() {
		return memoryNum4;
	}

	public void setMemoryNum4(String memoryNum4) {
		this.memoryNum4 = memoryNum4;
	}

}
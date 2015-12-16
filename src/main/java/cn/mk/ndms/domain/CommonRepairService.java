package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_common_repair_service database table.
 * 
 */
@Entity
@Table(name="nm_tb_common_repair_service")
public class CommonRepairService extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	
	private String projectIdFk;			//项目ID
	private String stationIdFk;			//服务站ID
	private String station;				//服务站
	private String callno;				//CALLNO
	private String cusName;				//客户姓名
	private String applyDate;			//申请时间
	private String type;				//类型(保内,保外)
	private String machineModel;		//机器型号
	private String serialNumber;		//机器序列号
	private String applyPartsId;		//申请备件ID
	private String applyParts;			//申请备件号
	private String partsDes;			//备件描述	
	
	private String actualUsePartId;		//实际使用备件ID
	private String actualUsePart;		//实际使用备件
	
	
	private Integer applyNumber;		//申请数量
	
	private Integer useNumber;			//使用数
	private Integer inventoryNumber;	//库存数
	private String remark;				//备注
	
	private String shelves;				//货架号
	private String repairType;			//维修类型
	private String status;				//状态
	
	private String operUserId;			//操作人ID
	private String operUser;			//操作人
	private String finishDate;			//完成时间
	private String returnFlag;			//是否需要返件
	private String isReturn;			//是否已返备件
	
	private String cusAddress;			//客户地址
	private String cusDep;				//客户部门
	private String cusTel;				//联系电话
	private String cusContactTime;		//电话联系客户时间
	private String staffId;				//员工ID
	private String staffNo;				//员工号
	private String allocateEngineer;	//分配工程师
	private String allocateEngineerId;	//分配工程师ID
	private String serviceNo;			//服务单号
	private String fault;				//故障描述
	private String groupId;				//组号
	private String faultRemark;			//故障备注
	private String solutionTime;		//服务解决时间
	
	private String isRepeat;			//是否重维
	private String iis;					//IIS
	private String result;				//解决问题方案
	
	
	public CommonRepairService() {
	}

	@Column(name="ACTUAL_USE_PART")
	public String getActualUsePart() {
		return this.actualUsePart;
	}

	public void setActualUsePart(String actualUsePart) {
		this.actualUsePart = actualUsePart;
	}


	@Column(name="ACTUAL_USE_PART_ID")
	public String getActualUsePartId() {
		return this.actualUsePartId;
	}

	public void setActualUsePartId(String actualUsePartId) {
		this.actualUsePartId = actualUsePartId;
	}


	@Column(name="APPLY_DATE")
	public String getApplyDate() {
		return this.applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}


	@Column(name="APPLY_NUMBER")
	public Integer getApplyNumber() {
		return this.applyNumber;
	}

	public void setApplyNumber(Integer applyNumber) {
		this.applyNumber = applyNumber;
	}


	@Column(name="APPLY_PARTS")
	public String getApplyParts() {
		return this.applyParts;
	}

	public void setApplyParts(String applyParts) {
		this.applyParts = applyParts;
	}


	@Column(name="APPLY_PARTS_ID")
	public String getApplyPartsId() {
		return this.applyPartsId;
	}

	public void setApplyPartsId(String applyPartsId) {
		this.applyPartsId = applyPartsId;
	}

	@Column(name="CALLNO")
	public String getCallno() {
		return this.callno;
	}

	public void setCallno(String callno) {
		this.callno = callno;
	}


	@Column(name="CUS_NAME")
	public String getCusName() {
		return this.cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}


	@Column(name="FINISH_DATE")
	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}


	@Column(name="INVENTORY_NUMBER")
	public Integer getInventoryNumber() {
		return this.inventoryNumber;
	}

	public void setInventoryNumber(Integer inventoryNumber) {
		this.inventoryNumber = inventoryNumber;
	}


	@Column(name="MACHINE_MODEL")
	public String getMachineModel() {
		return this.machineModel;
	}

	public void setMachineModel(String machineModel) {
		this.machineModel = machineModel;
	}


	@Column(name="OPER_USER")
	public String getOperUser() {
		return this.operUser;
	}

	public void setOperUser(String operUser) {
		this.operUser = operUser;
	}


	@Column(name="OPER_USER_ID")
	public String getOperUserId() {
		return this.operUserId;
	}

	public void setOperUserId(String operUserId) {
		this.operUserId = operUserId;
	}


	@Column(name="PARTS_DES")
	public String getPartsDes() {
		return this.partsDes;
	}

	public void setPartsDes(String partsDes) {
		this.partsDes = partsDes;
	}


	@Column(name="PROJECT_ID_FK")
	public String getProjectIdFk() {
		return this.projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}

	@Column(name="REMARK")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Column(name="REPAIR_TYPE")
	public String getRepairType() {
		return this.repairType;
	}

	public void setRepairType(String repairType) {
		this.repairType = repairType;
	}


	@Column(name="SERIAL_NUMBER")
	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@Column(name="SHELVES")
	public String getShelves() {
		return this.shelves;
	}

	public void setShelves(String shelves) {
		this.shelves = shelves;
	}

	@Column(name="STATION")
	public String getStation() {
		return this.station;
	}

	public void setStation(String station) {
		this.station = station;
	}


	@Column(name="STATION_ID_FK")
	public String getStationIdFk() {
		return this.stationIdFk;
	}

	public void setStationIdFk(String stationIdFk) {
		this.stationIdFk = stationIdFk;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="USE_NUMBER")
	public Integer getUseNumber() {
		return this.useNumber;
	}

	public void setUseNumber(Integer useNumber) {
		this.useNumber = useNumber;
	}

	@Column(name="RETURN_FLAG")
	public String getReturnFlag() {
		return returnFlag;
	}

	public void setReturnFlag(String returnFlag) {
		this.returnFlag = returnFlag;
	}

	@Column(name="IS_RETURN")
	public String getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(String isReturn) {
		this.isReturn = isReturn;
	}

	@Column(name="TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	@Column(name="CUS_ADDRESS")
	public String getCusAddress() {
		return cusAddress;
	}

	public void setCusAddress(String cusAddress) {
		this.cusAddress = cusAddress;
	}

	@Column(name="CUS_DEP")	
	public String getCusDep() {
		return cusDep;
	}

	public void setCusDep(String cusDep) {
		this.cusDep = cusDep;
	}

	@Column(name="CUS_TEL")	
	public String getCusTel() {
		return cusTel;
	}

	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}

	@Column(name="CUS_CONTACT_TIME")	
	public String getCusContactTime() {
		return cusContactTime;
	}

	public void setCusContactTime(String cusContactTime) {
		this.cusContactTime = cusContactTime;
	}

	@Column(name="STAFF_ID")	
	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	@Column(name="STAFF_NO")
	public String getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}

	@Column(name="ALLOCATE_ENGINEER")
	public String getAllocateEngineer() {
		return allocateEngineer;
	}

	public void setAllocateEngineer(String allocateEngineer) {
		this.allocateEngineer = allocateEngineer;
	}

	@Column(name="ALLOCATE_ENGINEER_ID")
	public String getAllocateEngineerId() {
		return allocateEngineerId;
	}

	public void setAllocateEngineerId(String allocateEngineerId) {
		this.allocateEngineerId = allocateEngineerId;
	}

	@Column(name="SERVICE_NO")
	public String getServiceNo() {
		return serviceNo;
	}

	public void setServiceNo(String serviceNo) {
		this.serviceNo = serviceNo;
	}

	@Column(name="FAULT")
	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	@Column(name="GROUP_ID")
	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	@Column(name="FAULT_REMARK")
	public String getFaultRemark() {
		return faultRemark;
	}

	public void setFaultRemark(String faultRemark) {
		this.faultRemark = faultRemark;
	}

	@Column(name="SOLUTION_TIME")
	public String getSolutionTime() {
		return solutionTime;
	}

	public void setSolutionTime(String solutionTime) {
		this.solutionTime = solutionTime;
	}

	@Column(name="IS_REPEAT")
	public String getIsRepeat() {
		return isRepeat;
	}

	public void setIsRepeat(String isRepeat) {
		this.isRepeat = isRepeat;
	}

	@Column(name="IIS")
	public String getIis() {
		return iis;
	}

	public void setIis(String iis) {
		this.iis = iis;
	}

	@Column(name="RESULT")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
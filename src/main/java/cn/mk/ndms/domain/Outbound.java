package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_outbound database table.
 * 
 */
@Entity
@Table(name="nm_tb_outbound")
public class Outbound extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String projectIdFk;
	private String operDate;                // 用于出库时间
	private String callno;					//CALLNO
	private String rqNo;					//申请单
	private String cusName;					//客户姓名
	private String applyDate;				//申请时间
	private String applyParts;				//申请备件
	private String machineModel;		//机器型号
	private String serialNumber;		//机器序列号
	private String applyPartsId;			//申请备件ID
	private String partsDes;				//备件描述
	private String actualUsePart;			//实际使用备件
	private String actualUsePartId;			//实际使用备件ID
	private Integer applyNumber;			//申请数量
	private Integer useNumber;				//使用数
	private Integer inventoryNumber;		//库存数
	private String shelves;					//货架号
	private String repairType;				//维修类型
	private String newOrOld;				//是否新件

	private Short availability;				//是否可用
	private String fedex;					//快递公司
	private String expressNo;				//快递单号
	private String sendTime;				//发出时间
	private String arrivalTime;				//到达时间
	
	private String expressStaff;			//运输人员
	private String expressStaffId;			//运输人员ID
	private String expressFinishDate;		//运输时间
	
	
	private String outOrder;				//出库单号
	
	private String issueMan;				//库管发出人
	private String issueManId;				//库管发出人ID
	private String operUser;				//操作人
	private String operUserId;				//操作人ID
	private String finishDate;				//完成时间
	private String remark;				//备注
	
	private String station;				//服务站
	private String stationId;			//服务站ID
	private String stationNo;			//服务站No
	private String status;				//状态
	private String type;				//类型
	private String returnFlag;			//是否需要返件
	private String isReturn;			//是否已返备件
	
	private Project project;			//项目
	
	private String iis;					//IIS
	private String isRepeat;			//是否重维

	public Outbound() {
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


	@Column(name="ARRIVAL_TIME")
	public String getArrivalTime() {
		return this.arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	@Column(name="AVAILABILITY")
	public Short getAvailability() {
		return this.availability;
	}

	public void setAvailability(Short availability) {
		this.availability = availability;
	}

	@Column(name="CALLNO")
	public String getCallno() {
		return this.callno;
	}

	public void setCallno(String callno) {
		this.callno = callno;
	}


	@Column(name="EXPRESS_FINISH_DATE")
	public String getExpressFinishDate() {
		return this.expressFinishDate;
	}

	public void setExpressFinishDate(String expressFinishDate) {
		this.expressFinishDate = expressFinishDate;
	}


	@Column(name="EXPRESS_NO")
	public String getExpressNo() {
		return this.expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}


	@Column(name="EXPRESS_STAFF")
	public String getExpressStaff() {
		return this.expressStaff;
	}

	public void setExpressStaff(String expressStaff) {
		this.expressStaff = expressStaff;
	}


	@Column(name="EXPRESS_STAFF_ID")
	public String getExpressStaffId() {
		return this.expressStaffId;
	}

	public void setExpressStaffId(String expressStaffId) {
		this.expressStaffId = expressStaffId;
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


	@Column(name="ISSUE_MAN")
	public String getIssueMan() {
		return this.issueMan;
	}

	public void setIssueMan(String issueMan) {
		this.issueMan = issueMan;
	}


	@Column(name="ISSUE_MAN_ID")
	public String getIssueManId() {
		return this.issueManId;
	}

	public void setIssueManId(String issueManId) {
		this.issueManId = issueManId;
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


	@Column(name="OUT_ORDER")
	public String getOutOrder() {
		return this.outOrder;
	}

	public void setOutOrder(String outOrder) {
		this.outOrder = outOrder;
	}


	@Column(name="PARTS_DES")
	public String getPartsDes() {
		return this.partsDes;
	}

	public void setPartsDes(String partsDes) {
		this.partsDes = partsDes;
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


	@Column(name="RQ_NO")
	public String getRqNo() {
		return this.rqNo;
	}

	public void setRqNo(String rqNo) {
		this.rqNo = rqNo;
	}


	@Column(name="SEND_TIME")
	public String getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
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


	@Column(name="STATION_NO")
	public String getStationNo() {
		return this.stationNo;
	}

	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="TYPE")
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}


	@Column(name="USE_NUMBER")
	public Integer getUseNumber() {
		return this.useNumber;
	}

	public void setUseNumber(Integer useNumber) {
		this.useNumber = useNumber;
	}
	@Column(name="PROJECT_ID_FK")
	public String getProjectIdFk() {
		return projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}
	@Column(name="OPER_DATE")
	public String getOperDate() {
		return operDate;
	}

	public void setOperDate(String operDate) {
		this.operDate = operDate;
	}

	@Column(name="STATION_ID")
	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}

	@ManyToOne(targetEntity=Project.class,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_ID_FK",insertable=false,updatable=false)
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@Column(name="CUS_NAME")
	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	@Column(name="MACHINE_MODEL")
	public String getMachineModel() {
		return machineModel;
	}

	public void setMachineModel(String machineModel) {
		this.machineModel = machineModel;
	}

	@Column(name="SERIAL_NUMBER")
	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@Column(name="NEW_OR_OLD")
	public String getNewOrOld() {
		return newOrOld;
	}

	public void setNewOrOld(String newOrOld) {
		this.newOrOld = newOrOld;
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
	
	@Column(name="FEDEX")
	public String getFedex() {
		return fedex;
	}

	public void setFedex(String fedex) {
		this.fedex = fedex;
	}

	@Column(name="IIS")
	public String getIis() {
		return iis;
	}

	public void setIis(String iis) {
		this.iis = iis;
	}

	@Column(name="IS_REPEAT")
	public String getIsRepeat() {
		return isRepeat;
	}

	public void setIsRepeat(String isRepeat) {
		this.isRepeat = isRepeat;
	}

}
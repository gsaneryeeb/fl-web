package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_repair_service database table.
 * 
 */
@Entity
@Table(name="nm_tb_repair_service")
public class RepairService extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String projectIdFk;					//项目ID
	private String orders;						//维修单号
	private String ppid;						//PPID
	private Short repeats;						//是否重复
	private String repeatsType;					//重复维修下拉列表
	private String repeatsId;					//重复ID
	private String caseno;						//CASENO
	private String station;						//服务站
	private String stationId;					//服务站ID
	private String tel;							//联系电话
	private String machineModel;				//机器型号
	private String board;						//主板型号
	private String acceptUserId;				//接单人ID
	private String acceptDate;					//接单日期
	private String acceptUser;					//接单人
	
	private String warranty;					//保修日期
	private Double cost;						//费用
	private String stataionSendDate;			//服务站发件日期
	private String sendDate;					//派单日期
	private String faultDes;					//故障描述
	private String faultRemark;					//故障备注
	private String arrivalTime;					//到达时间
	private String engineer;					//工程师
	private String engineerId;					//工程师ID
	private String replacementMaterial;			//更换材料
	
	private String faultReason;					//故障原因
	
	private String result;						//故障处理结果
	
	private String surveyor;					//检测人
	private String surveyorDate;				//检测日期
	private String surveyorId;					//检测人ID
	private String remark;						//备注
	private String outOrder;					//出库单号
	private String transportMinistry;			//运输部
	private String expressNo;					//快递单号
	private String expressArrivalTime;			//快递到达时间
	private String expressSendTime;				//快递发出时间
	private String expressStaff;				//运输人员
	private String expressStaffId;				//运输人员ID
	private String expressFinishDate;			//运输完成时间
	
	private String libraryFinishDate;			//库管完成时间
	private String libraryStaff;				//库管人员
	private String libraryStaffId;				//库管人员ID
	private String status;						//状态
	
	private String ppidDes;						//PPID备注

	public RepairService() {
	}

	@Column(name="ARRIVAL_TIME")
	public String getArrivalTime() {
		return this.arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	@Column(name="BOARD")
	public String getBoard() {
		return this.board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	@Column(name="CASENO")
	public String getCaseno() {
		return this.caseno;
	}

	public void setCaseno(String caseno) {
		this.caseno = caseno;
	}

	@Column(name="ENGINEER")
	public String getEngineer() {
		return this.engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}


	@Column(name="ENGINEER_ID")
	public String getEngineerId() {
		return this.engineerId;
	}

	public void setEngineerId(String engineerId) {
		this.engineerId = engineerId;
	}


	@Column(name="EXPRESS_ARRIVAL_TIME")
	public String getExpressArrivalTime() {
		return this.expressArrivalTime;
	}

	public void setExpressArrivalTime(String expressArrivalTime) {
		this.expressArrivalTime = expressArrivalTime;
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


	@Column(name="FAULT_DES")
	public String getFaultDes() {
		return this.faultDes;
	}

	public void setFaultDes(String faultDes) {
		this.faultDes = faultDes;
	}


	@Column(name="FAULT_REASON")
	public String getFaultReason() {
		return this.faultReason;
	}

	public void setFaultReason(String faultReason) {
		this.faultReason = faultReason;
	}


	@Column(name="FAULT_REMARK")
	public String getFaultRemark() {
		return this.faultRemark;
	}

	public void setFaultRemark(String faultRemark) {
		this.faultRemark = faultRemark;
	}


	@Column(name="LIBRARY_FINISH_DATE")
	public String getLibraryFinishDate() {
		return this.libraryFinishDate;
	}

	public void setLibraryFinishDate(String libraryFinishDate) {
		this.libraryFinishDate = libraryFinishDate;
	}


	@Column(name="LIBRARY_STAFF")
	public String getLibraryStaff() {
		return this.libraryStaff;
	}

	public void setLibraryStaff(String libraryStaff) {
		this.libraryStaff = libraryStaff;
	}


	@Column(name="LIBRARY_STAFF_ID")
	public String getLibraryStaffId() {
		return this.libraryStaffId;
	}

	public void setLibraryStaffId(String libraryStaffId) {
		this.libraryStaffId = libraryStaffId;
	}


	@Column(name="MACHINE_MODEL")
	public String getMachineModel() {
		return this.machineModel;
	}

	public void setMachineModel(String machineModel) {
		this.machineModel = machineModel;
	}

	@Column(name="ORDERS")
	public String getOrders() {
		return this.orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}


	@Column(name="OUT_ORDER")
	public String getOutOrder() {
		return this.outOrder;
	}

	public void setOutOrder(String outOrder) {
		this.outOrder = outOrder;
	}

	@Column(name="PPID")
	public String getPpid() {
		return this.ppid;
	}

	public void setPpid(String ppid) {
		this.ppid = ppid;
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

	@Column(name="REPEATS")
	public Short getRepeats() {
		return this.repeats;
	}

	public void setRepeats(Short repeats) {
		this.repeats = repeats;
	}


	@Column(name="REPLACEMENT_MATERIAL")
	public String getReplacementMaterial() {
		return this.replacementMaterial;
	}

	public void setReplacementMaterial(String replacementMaterial) {
		this.replacementMaterial = replacementMaterial;
	}


	@Column(name="SEND_DATE")
	public String getSendDate() {
		return this.sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}


	@Column(name="STATAION_SEND_DATE")
	public String getStataionSendDate() {
		return this.stataionSendDate;
	}

	public void setStataionSendDate(String stataionSendDate) {
		this.stataionSendDate = stataionSendDate;
	}

	@Column(name="STATION")
	public String getStation() {
		return this.station;
	}

	public void setStation(String station) {
		this.station = station;
	}


	@Column(name="STATION_ID")
	public String getStationId() {
		return this.stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="SURVEYOR")
	public String getSurveyor() {
		return this.surveyor;
	}

	public void setSurveyor(String surveyor) {
		this.surveyor = surveyor;
	}


	@Column(name="SURVEYOR_DATE")
	public String getSurveyorDate() {
		return this.surveyorDate;
	}

	public void setSurveyorDate(String surveyorDate) {
		this.surveyorDate = surveyorDate;
	}


	@Column(name="SURVEYOR_ID")
	public String getSurveyorId() {
		return this.surveyorId;
	}

	public void setSurveyorId(String surveyorId) {
		this.surveyorId = surveyorId;
	}

	@Column(name="TEL")
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}


	@Column(name="TRANSPORT_MINISTRY")
	public String getTransportMinistry() {
		return this.transportMinistry;
	}

	public void setTransportMinistry(String transportMinistry) {
		this.transportMinistry = transportMinistry;
	}

		
		
		
	@Column(name="ACCEPT_USER_ID")
	public String getAcceptUserId() {
		return acceptUserId;
	}

	public void setAcceptUserId(String acceptUserId) {
		this.acceptUserId = acceptUserId;
	}

	@Column(name="ACCEPT_DATE")
	public String getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(String acceptDate) {
		this.acceptDate = acceptDate;
	}
	
	@Column(name="ACCEPT_USER")
	public String getAcceptUser() {
		return acceptUser;
	}

	public void setAcceptUser(String acceptUser) {
		this.acceptUser = acceptUser;
	}

	@Column(name="PPID_DES")
	public String getPpidDes() {
		return ppidDes;
	}

	public void setPpidDes(String ppidDes) {
		this.ppidDes = ppidDes;
	}
	
	@Column(name="REPEATS_ID")
	public String getRepeatsId() {
		return repeatsId;
	}

	public void setRepeatsId(String repeatsId) {
		this.repeatsId = repeatsId;
	}

	@Column(name="REPEATS_TYPE")
	public String getRepeatsType() {
		return repeatsType;
	}

	public void setRepeatsType(String repeatsType) {
		this.repeatsType = repeatsType;
	}
	@Column(name="WARRANTY")
	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	@Column(name="COST")
	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	@Column(name="EXPRESS_SEND_TIME")
	public String getExpressSendTime() {
		return expressSendTime;
	}

	public void setExpressSendTime(String expressSendTime) {
		this.expressSendTime = expressSendTime;
	}

	@Column(name="RESULT")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
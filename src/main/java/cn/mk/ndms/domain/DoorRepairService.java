package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_door_repair_service database table.
 * 
 */
@Entity
@Table(name="nm_tb_door_repair_service") 
public class DoorRepairService extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String ac;					//电源
	private String acceptDate;			//送修日期
	private String type;				//类型(保内,保外)
	private String takeDate;			//接受日期
	private String acceptPersonId;		//接收人ID
	private String acceptPersonName;	//接收人
	private String appearance;			//外观
	private Double referencePrice;		//参考价格
	private String battery;				//电池
	private String board;				//主板
	private String callno;				//CALLNO
	private String cusName;				//客户姓名
	private String cusTel;				//客户电话
	private Short faultHandling;		//故障处理
	private String faultHandlingRemark;	//故障处理备注
	private String faultType;			//故障类型
	private String fetchCus;			//客户取机签字
	private String fetchDate;			//待取机时间
	private String finishDate;			//完成时间
	private String firstDate;			//第一次保存时间
	private String hardDisk;			//硬盘
	private String hostNumber;			//主机编号
	private Short keepDiskDate;			//是否保留硬盘数据
	private String keyboard;			//键盘
	private String memory;				//内存
	private Short needPart;				//是否生成备件申请
	private String orders;				//维修单号
	private String other;				//其他
	private Double processCost;			//处理费用
	private String processDes;			//处理描述
	private String projectIdFk;			//项目编号
	private String repairCus;			//用户送修签字
	private String repairDate;			//维修时间
	private String repairFault;			//报修故障
	private String repairPersonId;		//维修工程师ID
	private String repairRersonName;	//维修工程师
	private String serviceAddress;		//服务地址
	private String serviceAgencies;		//产品服务机构
	private String status;				//状态
	private String tel;					//电话
	private String finishStatus;		//完成,不能修改
	private String returnFlag;			//是否需要返件
	private String isReturn;			//是否已返备件
	private Double inspectionFee;		//检验费
	private String feedback;			//反馈是否正常
	private String advice;				//意见
	private String opinion;				//建议
	
	public DoorRepairService() {
	}

	@Column(name="AC")
	public String getAc() {
		return this.ac;
	}

	public void setAc(String ac) {
		this.ac = ac;
	}


	@Column(name="ACCEPT_DATE")
	public String getAcceptDate() {
		return this.acceptDate;
	}

	public void setAcceptDate(String acceptDate) {
		this.acceptDate = acceptDate;
	}


	@Column(name="ACCEPT_PERSON_ID")
	public String getAcceptPersonId() {
		return this.acceptPersonId;
	}

	public void setAcceptPersonId(String acceptPersonId) {
		this.acceptPersonId = acceptPersonId;
	}


	@Column(name="ACCEPT_PERSON_NAME")
	public String getAcceptPersonName() {
		return this.acceptPersonName;
	}

	public void setAcceptPersonName(String acceptPersonName) {
		this.acceptPersonName = acceptPersonName;
	}

	@Column(name="APPEARANCE")
	public String getAppearance() {
		return this.appearance;
	}

	public void setAppearance(String appearance) {
		this.appearance = appearance;
	}

	@Column(name="BATTERY")
	public String getBattery() {
		return this.battery;
	}

	public void setBattery(String battery) {
		this.battery = battery;
	}

	@Column(name="BOARD")
	public String getBoard() {
		return this.board;
	}

	public void setBoard(String board) {
		this.board = board;
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


	@Column(name="CUS_TEL")
	public String getCusTel() {
		return this.cusTel;
	}

	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}


	@Column(name="FAULT_HANDLING")
	public Short getFaultHandling() {
		return this.faultHandling;
	}

	public void setFaultHandling(Short faultHandling) {
		this.faultHandling = faultHandling;
	}


	@Column(name="FAULT_HANDLING_REMARK")
	public String getFaultHandlingRemark() {
		return this.faultHandlingRemark;
	}

	public void setFaultHandlingRemark(String faultHandlingRemark) {
		this.faultHandlingRemark = faultHandlingRemark;
	}


	@Column(name="FAULT_TYPE")
	public String getFaultType() {
		return this.faultType;
	}

	public void setFaultType(String faultType) {
		this.faultType = faultType;
	}


	@Column(name="FETCH_CUS")
	public String getFetchCus() {
		return this.fetchCus;
	}

	public void setFetchCus(String fetchCus) {
		this.fetchCus = fetchCus;
	}


	@Column(name="FETCH_DATE")
	public String getFetchDate() {
		return this.fetchDate;
	}

	public void setFetchDate(String fetchDate) {
		this.fetchDate = fetchDate;
	}


	@Column(name="FINISH_DATE")
	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}


	@Column(name="FIRST_DATE")
	public String getFirstDate() {
		return this.firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}


	@Column(name="HARD_DISK")
	public String getHardDisk() {
		return this.hardDisk;
	}

	public void setHardDisk(String hardDisk) {
		this.hardDisk = hardDisk;
	}


	@Column(name="HOST_NUMBER")
	public String getHostNumber() {
		return this.hostNumber;
	}

	public void setHostNumber(String hostNumber) {
		this.hostNumber = hostNumber;
	}


	@Column(name="KEEP_DISK_DATE")
	public Short getKeepDiskDate() {
		return this.keepDiskDate;
	}

	public void setKeepDiskDate(Short keepDiskDate) {
		this.keepDiskDate = keepDiskDate;
	}

	@Column(name="KEYBOARD")
	public String getKeyboard() {
		return this.keyboard;
	}

	public void setKeyboard(String keyboard) {
		this.keyboard = keyboard;
	}

	@Column(name="MEMORY")
	public String getMemory() {
		return this.memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}


	@Column(name="NEED_PART")
	public Short getNeedPart() {
		return this.needPart;
	}

	public void setNeedPart(Short needPart) {
		this.needPart = needPart;
	}

	@Column(name="ORDERS")
	public String getOrders() {
		return this.orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}

	@Column(name="OTHER")
	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}


	@Column(name="PROCESS_COST")
	public Double getProcessCost() {
		return this.processCost;
	}

	public void setProcessCost(Double processCost) {
		this.processCost = processCost;
	}


	@Column(name="PROCESS_DES")
	public String getProcessDes() {
		return this.processDes;
	}

	public void setProcessDes(String processDes) {
		this.processDes = processDes;
	}


	@Column(name="PROJECT_ID_FK")
	public String getProjectIdFk() {
		return this.projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}


	@Column(name="REPAIR_CUS")
	public String getRepairCus() {
		return this.repairCus;
	}

	public void setRepairCus(String repairCus) {
		this.repairCus = repairCus;
	}


	@Column(name="REPAIR_DATE")
	public String getRepairDate() {
		return this.repairDate;
	}

	public void setRepairDate(String repairDate) {
		this.repairDate = repairDate;
	}


	@Column(name="REPAIR_FAULT")
	public String getRepairFault() {
		return this.repairFault;
	}

	public void setRepairFault(String repairFault) {
		this.repairFault = repairFault;
	}


	@Column(name="REPAIR_PERSON_ID")
	public String getRepairPersonId() {
		return this.repairPersonId;
	}

	public void setRepairPersonId(String repairPersonId) {
		this.repairPersonId = repairPersonId;
	}


	@Column(name="REPAIR_RERSON_NAME")
	public String getRepairRersonName() {
		return this.repairRersonName;
	}

	public void setRepairRersonName(String repairRersonName) {
		this.repairRersonName = repairRersonName;
	}


	@Column(name="SERVICE_ADDRESS")
	public String getServiceAddress() {
		return this.serviceAddress;
	}

	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress;
	}


	@Column(name="SERVICE_AGENCIES")
	public String getServiceAgencies() {
		return this.serviceAgencies;
	}

	public void setServiceAgencies(String serviceAgencies) {
		this.serviceAgencies = serviceAgencies;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="TEL")
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name="TAKE_DATE")
	public String getTakeDate() {
		return takeDate;
	}

	public void setTakeDate(String takeDate) {
		this.takeDate = takeDate;
	}

	@Column(name="FINISH_STATUS")
	public String getFinishStatus() {
		return finishStatus;
	}

	public void setFinishStatus(String finishStatus) {
		this.finishStatus = finishStatus;
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

	@Column(name="REFERENCE_PRICE")
	public Double getReferencePrice() {
		return referencePrice;
	}

	public void setReferencePrice(Double referencePrice) {
		this.referencePrice = referencePrice;
	}

	@Column(name="INSPECTION_FEE")
	public Double getInspectionFee() {
		return inspectionFee;
	}

	public void setInspectionFee(Double inspectionFee) {
		this.inspectionFee = inspectionFee;
	}

	@Column(name="FEEDBACK")
	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	@Column(name="ADVICE")
	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}

	@Column(name="OPINION")
	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}



}
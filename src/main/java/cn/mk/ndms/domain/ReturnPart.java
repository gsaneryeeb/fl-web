package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_return_parts database table.
 * 
 */
@Entity
@Table(name="nm_tb_return_parts")
public class ReturnPart extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	
	private String rqId;			//申请号
	private String rqType;			//申请类型(IBM,客户上门)
	private String distributionDate;		//分配时间
	private String parts;			//申请备件号
	
	private String partsName;			//申请备件名称
	
	private String outOrder;		//出库单
	private String callno;			//CALLNO
	private String station;			//station
	private String relParts;		//实际返件号
	private String relPartsId;		//实际返件ID
	private Integer number;			//数量
	private String returnType;		//返新/返旧/新损/无旧件
	private String returnDate;		//返回日期
	private String returnStatus;	//返件状态
	private Short scrap;			//是否报废
	private String distribution;	//分配
	private String duty;			//职责
	private String initFailureTest; //检验初始故障
	private String remark;			//备注
	private String repairResult;	//维修结果
	private String status;			//状态
	private String transportUserId; //运输管理员ID
	private String transportUser;	//运输管理员
	private String transportDate;	//运输管理员时间
	private String repairDate;		//维修时间
	private String repairUserId;	//维修人员ID
	private String repairUser;		//维修人员
	private String inOrder;			//入库单	
	private String printNo;			//打印单号
	private String printId;			//打印ID
	private String supiroId;		//供应商ID
	private String supiroName;		//供应商名字
	
	
	public ReturnPart() {
	}
	@Column(name="CALLNO")
	public String getCallno() {
		return this.callno;
	}

	public void setCallno(String callno) {
		this.callno = callno;
	}

	@Column(name="DISTRIBUTION")
	public String getDistribution() {
		return this.distribution;
	}

	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}

	@Column(name="DUTY")
	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}


	@Column(name="IN_ORDER")
	public String getInOrder() {
		return this.inOrder;
	}

	public void setInOrder(String inOrder) {
		this.inOrder = inOrder;
	}


	@Column(name="INIT_FAILURE_TEST")
	public String getInitFailureTest() {
		return this.initFailureTest;
	}

	public void setInitFailureTest(String initFailureTest) {
		this.initFailureTest = initFailureTest;
	}


	@Column(name="OUT_ORDER")
	public String getOutOrder() {
		return this.outOrder;
	}

	public void setOutOrder(String outOrder) {
		this.outOrder = outOrder;
	}

	@Column(name="PARTS")
	public String getParts() {
		return this.parts;
	}

	public void setParts(String parts) {
		this.parts = parts;
	}


	@Column(name="REL_PARTS")
	public String getRelParts() {
		return this.relParts;
	}

	public void setRelParts(String relParts) {
		this.relParts = relParts;
	}

	@Column(name="REMARK")
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	@Column(name="REPAIR_DATE")
	public String getRepairDate() {
		return this.repairDate;
	}

	public void setRepairDate(String repairDate) {
		this.repairDate = repairDate;
	}


	@Column(name="REPAIR_RESULT")
	public String getRepairResult() {
		return this.repairResult;
	}

	public void setRepairResult(String repairResult) {
		this.repairResult = repairResult;
	}


	@Column(name="REPAIR_USER")
	public String getRepairUser() {
		return this.repairUser;
	}

	public void setRepairUser(String repairUser) {
		this.repairUser = repairUser;
	}


	@Column(name="REPAIR_USER_ID")
	public String getRepairUserId() {
		return this.repairUserId;
	}

	public void setRepairUserId(String repairUserId) {
		this.repairUserId = repairUserId;
	}


	@Column(name="RETURN_STATUS")
	public String getReturnStatus() {
		return this.returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	@Column(name="SCRAP")
	public Short getScrap() {
		return this.scrap;
	}

	public void setScrap(Short scrap) {
		this.scrap = scrap;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="TRANSPORT_DATE")
	public String getTransportDate() {
		return this.transportDate;
	}

	public void setTransportDate(String transportDate) {
		this.transportDate = transportDate;
	}


	@Column(name="TRANSPORT_USER")
	public String getTransportUser() {
		return this.transportUser;
	}

	public void setTransportUser(String transportUser) {
		this.transportUser = transportUser;
	}


	@Column(name="TRANSPORT_USER_ID")
	public String getTransportUserId() {
		return this.transportUserId;
	}

	public void setTransportUserId(String transportUserId) {
		this.transportUserId = transportUserId;
	}
	
	@Column(name="RQ_ID")
	public String getRqId() {
		return rqId;
	}
	public void setRqId(String rqId) {
		this.rqId = rqId;
	}
	
	@Column(name="RQ_TYPE")
	public String getRqType() {
		return rqType;
	}
	public void setRqType(String rqType) {
		this.rqType = rqType;
	}
	
	@Column(name="DISTRIBUTION_DATE")
	public String getDistributionDate() {
		return distributionDate;
	}
	public void setDistributionDate(String distributionDate) {
		this.distributionDate = distributionDate;
	}
	
	@Column(name="REL_PARTS_ID")
	public String getRelPartsId() {
		return relPartsId;
	}
	public void setRelPartsId(String relPartsId) {
		this.relPartsId = relPartsId;
	}
	
	@Column(name="RETURN_DATE")
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	
	@Column(name="RETURN_TYPE")
	public String getReturnType() {
		return returnType;
	}
	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}
	@Column(name="STATION")
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	
	@Column(name="NUMBER")
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	@Column(name="PRINT_NO")
	public String getPrintNo() {
		return printNo;
	}
	public void setPrintNo(String printNo) {
		this.printNo = printNo;
	}
	
	@Column(name="PRINT_ID")
	public String getPrintId() {
		return printId;
	}
	public void setPrintId(String printId) {
		this.printId = printId;
	}
	
	@Column(name="SUPIRO_ID")
	public String getSupiroId() {
		return supiroId;
	}
	public void setSupiroId(String supiroId) {
		this.supiroId = supiroId;
	}
	
	@Column(name="SUPIRO_NAME")
	public String getSupiroName() {
		return supiroName;
	}
	public void setSupiroName(String supiroName) {
		this.supiroName = supiroName;
	}
	
	@Column(name="PARTS_NAME")
	public String getPartsName() {
		return partsName;
	}
	public void setPartsName(String partsName) {
		this.partsName = partsName;
	}

}
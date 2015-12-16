package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_storage database table.
 * 
 */
@Entity
@Table(name="nm_tb_storage")
public class Storage extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String inOrder;  			//入库单号
	private String supplierId;			//供应商ID
	private String supplierName;		//供应商		
	private String source;			    //来源
	
	private String partId;				//备件号ID
	private String part;				//备件NO
	private String partName;			//备件Name
	private String engineerId;			//工程师ID
	private String engineerName;		//工程师
	private Double wac;					//wac
	private Integer number;				//数量
	private Double price;				//单价
	private String shelfNo;				//货架号
	private Double total;				//总价	
	
	private String operUserId;			//操作人ID
	private String operUserName;		//操作人
	private String operDate;			//操作日期	
	
	private String status;				//状态	
	
	private Part p;			//备件
	
	private String issueMan;			//库管操作
	private String allotEngineer;		//分配工程师
	private String allotEngineerId;		//分配工程师ID	
	private String expressNo;			//快递单号
	private String express;				//快递公司
	private String testResult;			//检验结果（测试状态）
	private Integer amountQuantity;		//检验数量
	private Integer intactQuantity;		//完好数量
	private Integer damageQuantity;		//损坏数量
	private String sendTime;			//发出时间
	private String arriveTime;			//到达时间
	private String fault;				//故障原因
	
	private String partRemark;			//备件描述
	private Double expressFree;			//快递费
	private String speakForStatus;		//订购状态
	private String faultStatus;			//故障状态
	private Integer returnNum;			//返件数量
	private String ordersStatus;		//订单状态
	private String engineerStatus;		//工程师测试状态
	private String assignedDate;		//分配日期
	private String expressDate;			//检验时间
	private String transportStatus;		//运输状态
	private String arrivalDate;			//到货日期
	private String ordersDate;			//订购日期
	private String upId;				//上级编号

	
	
	
	public Storage() {
	}

	@Column(name="ENGINEER_ID")
	public String getEngineerId() {
		return this.engineerId;
	}

	public void setEngineerId(String engineerId) {
		this.engineerId = engineerId;
	}


	@Column(name="ENGINEER_NAME")
	public String getEngineerName() {
		return this.engineerName;
	}

	public void setEngineerName(String engineerName) {
		this.engineerName = engineerName;
	}


	@Column(name="IN_ORDER")
	public String getInOrder() {
		return this.inOrder;
	}

	public void setInOrder(String inOrder) {
		this.inOrder = inOrder;
	}

	@Column(name="NUMBER")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}


	@Column(name="OPER_DATE")
	public String getOperDate() {
		return this.operDate;
	}

	public void setOperDate(String operDate) {
		this.operDate = operDate;
	}


	@Column(name="OPER_USER_ID")
	public String getOperUserId() {
		return this.operUserId;
	}

	public void setOperUserId(String operUserId) {
		this.operUserId = operUserId;
	}


	@Column(name="OPER_USER_NAME")
	public String getOperUserName() {
		return this.operUserName;
	}

	public void setOperUserName(String operUserName) {
		this.operUserName = operUserName;
	}

	@Column(name="PART")
	public String getPart() {
		return this.part;
	}

	public void setPart(String part) {
		this.part = part;
	}


	@Column(name="PART_ID")
	public String getPartId() {
		return this.partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	@Column(name="PRICE")
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}


	@Column(name="SHELF_NO")
	public String getShelfNo() {
		return this.shelfNo;
	}

	public void setShelfNo(String shelfNo) {
		this.shelfNo = shelfNo;
	}

	@Column(name="SOURCE")
	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="SUPPLIER_ID")
	public String getSupplierId() {
		return this.supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}


	@Column(name="SUPPLIER_NAME")
	public String getSupplierName() {
		return this.supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	@Column(name="TOTAL")
	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	@Column(name="WAC")
	public Double getWac() {
		return wac;
	}

	public void setWac(Double wac) {
		this.wac = wac;
	}

	@ManyToOne(targetEntity=Part.class,fetch=FetchType.EAGER)
	@JoinColumn(name="PART_ID",insertable=false,updatable=false)
	public Part getP() {
		return p;
	}

	public void setP(Part p) {
		this.p = p;
	}
	
	@Column(name="ISSUE_MAN")
	public String getIssueMan() {
		return issueMan;
	}

	public void setIssueMan(String issueMan) {
		this.issueMan = issueMan;
	}

	@Column(name="ALLOT_ENGINEER")
	public String getAllotEngineer() {
		return allotEngineer;
	}

	public void setAllotEngineer(String allotEngineer) {
		this.allotEngineer = allotEngineer;
	}

	@Column(name="ALLOT_ENGINEER_ID")
	public String getAllotEngineerId() {
		return allotEngineerId;
	}

	public void setAllotEngineerId(String allotEngineerId) {
		this.allotEngineerId = allotEngineerId;
	}

	@Column(name="EXPRESS_NO")
	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	@Column(name="EXPRESS")
	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	@Column(name="TEST_RESULT")
	public String getTestResult() {
		return testResult;
	}

	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}

	@Column(name="AMOUNT_QUANTITY")
	public Integer getAmountQuantity() {
		return amountQuantity;
	}

	public void setAmountQuantity(Integer amountQuantity) {
		this.amountQuantity = amountQuantity;
	}

	@Column(name="INTACT_QUANTITY")
	public Integer getIntactQuantity() {
		return intactQuantity;
	}

	public void setIntactQuantity(Integer intactQuantity) {
		this.intactQuantity = intactQuantity;
	}

	@Column(name="DAMAGE__QUANTITY")
	public Integer getDamageQuantity() {
		return damageQuantity;
	}

	public void setDamageQuantity(Integer damageQuantity) {
		this.damageQuantity = damageQuantity;
	}

	@Column(name="SEND_TIME")
	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	@Column(name="ARRIVE_TIME")
	public String getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}

	@Column(name="FAULT")
	public String getFault() {
		return fault;
	}

	public void setFault(String fault) {
		this.fault = fault;
	}

	
	@Column(name="PART_REMARK")
	public String getPartRemark() {
		return partRemark;
	}

	public void setPartRemark(String partRemark) {
		this.partRemark = partRemark;
	}

	@Column(name="EXPRESS_FREE")
	public Double getExpressFree() {
		return expressFree;
	}

	public void setExpressFree(Double expressFree) {
		this.expressFree = expressFree;
	}

	@Column(name="SPEAK_FOR_STATUS")
	public String getSpeakForStatus() {
		return speakForStatus;
	}

	public void setSpeakForStatus(String speakForStatus) {
		this.speakForStatus = speakForStatus;
	}

	@Column(name="FAULT_STATUS")
	public String getFaultStatus() {
		return faultStatus;
	}

	public void setFaultStatus(String faultStatus) {
		this.faultStatus = faultStatus;
	}

	@Column(name="RETURN_NUM")
	public Integer getReturnNum() {
		return returnNum;
	}

	public void setReturnNum(Integer returnNum) {
		this.returnNum = returnNum;
	}

	@Column(name="ORDERS_STATUS")
	public String getOrdersStatus() {
		return ordersStatus;
	}

	public void setOrdersStatus(String ordersStatus) {
		this.ordersStatus = ordersStatus;
	}

	@Column(name="ENGINEER_STATUS")
	public String getEngineerStatus() {
		return engineerStatus;
	}

	public void setEngineerStatus(String engineerStatus) {
		this.engineerStatus = engineerStatus;
	}

	@Column(name="ASSIGNED_DATE")
	public String getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}

	@Column(name="TRANSPORT_STATUS")
	public String getTransportStatus() {
		return transportStatus;
	}

	public void setTransportStatus(String transportStatus) {
		this.transportStatus = transportStatus;
	}

	@Column(name="ARRIVAL_DATE")
	public String getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	@Column(name="ORDERS_DATE")
	public String getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}

	@Column(name="EXPRESS_DATE")
	public String getExpressDate() {
		return expressDate;
	}

	public void setExpressDate(String expressDate) {
		this.expressDate = expressDate;
	}

	@Column(name="UP_ID")
	public String getUpId() {
		return upId;
	}

	public void setUpId(String upId) {
		this.upId = upId;
	}

	@Column(name="PART_NAME")
	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

}
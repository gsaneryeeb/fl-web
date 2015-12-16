package cn.mk.ndms.util;

public class ReturnPartVo {
	
	private String id;				//ID
	private String rqId; 			// RQ_ID
	private String rqType;			// RQ_TYPE
	private String callNo;
	private String station;
	private String applyParts; 		// 申请备件号-parts
	private String actualUsePart;			//实际使用备件
	private String applyPartsName; 		// 申请备件号-parts
	private String returnPartsId; 	// 返回备件号
	private String returnParts; 	// 返回备件号
	private String returnDate; 		// 返回日期
	private String status;			//状态
	private String returnStatus;	//返件状态
	private String outOrder;		//出库单号
	private String scrap;			//是否报销
	private String distribution;	//分配
	private String duty;			//职责
	private String distributionDate;		//分配时间
	private Integer number;			//数量

	public String getCallNo() {
		return callNo;
	}

	public void setCallNo(String callNo) {
		this.callNo = callNo;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public String getApplyParts() {
		return applyParts;
	}

	public void setApplyParts(String applyParts) {
		this.applyParts = applyParts;
	}

	public String getReturnPartsId() {
		return returnPartsId;
	}

	public void setReturnPartsId(String returnPartsId) {
		this.returnPartsId = returnPartsId;
	}

	public String getReturnParts() {
		return returnParts;
	}

	public void setReturnParts(String returnParts) {
		this.returnParts = returnParts;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getRqId() {
		return rqId;
	}

	public void setRqId(String rqId) {
		this.rqId = rqId;
	}

	public String getRqType() {
		return rqType;
	}

	public void setRqType(String rqType) {
		this.rqType = rqType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getActualUsePart() {
		return actualUsePart;
	}

	public void setActualUsePart(String actualUsePart) {
		this.actualUsePart = actualUsePart;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOutOrder() {
		return outOrder;
	}

	public void setOutOrder(String outOrder) {
		this.outOrder = outOrder;
	}

	public String getScrap() {
		return scrap;
	}

	public void setScrap(String scrap) {
		this.scrap = scrap;
	}

	public String getDistribution() {
		return distribution;
	}

	public void setDistribution(String distribution) {
		this.distribution = distribution;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getDistributionDate() {
		return distributionDate;
	}

	public void setDistributionDate(String distributionDate) {
		this.distributionDate = distributionDate;
	}

	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getApplyPartsName() {
		return applyPartsName;
	}

	public void setApplyPartsName(String applyPartsName) {
		this.applyPartsName = applyPartsName;
	}
}

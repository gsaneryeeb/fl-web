package cn.mk.ndms.modules.part.web.vo;

public class DynamicVo {
	private String partId;			//备件号ID
	private String type;			//类型(出库,入库,调整)
	private String parts;			//备件
	private String pdate;			//打印时间
	private String rack;			//货架号
	private Integer relNumber;		//实盘数量
	private Integer sysNumber;		//系统数量
	private Integer calculatorNumber;	//计算出入库后的数据
	private Integer virtualNumber;	//虚拟数量
	private String remarks;			//备注
	private String years;			//年
	private String months;			//月 
	private String days;			//日
	private String status;			//状态
	private String operUser;		//操作人
	private String operUserId;		//操作人ID
	private Integer inStoreage;		//入库
	private Integer outStoreage;	//出库
	private Integer adjust;			//调整 
	private String no;		//noÍ
	
	
	
	public String getPartId() {
		return partId;
	}
	public void setPartId(String partId) {
		this.partId = partId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getParts() {
		return parts;
	}
	public void setParts(String parts) {
		this.parts = parts;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getRack() {
		return rack;
	}
	public void setRack(String rack) {
		this.rack = rack;
	}
	public Integer getRelNumber() {
		return relNumber;
	}
	public void setRelNumber(Integer relNumber) {
		this.relNumber = relNumber;
	}
	public Integer getSysNumber() {	
		return sysNumber;
	}
	public void setSysNumber(Integer sysNumber) {
		this.sysNumber = sysNumber;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOperUser() {
		return operUser;
	}
	public void setOperUser(String operUser) {
		this.operUser = operUser;
	}
	public String getOperUserId() {
		return operUserId;
	}
	public void setOperUserId(String operUserId) {
		this.operUserId = operUserId;
	}
	public Integer getInStoreage() {
		return inStoreage==null?0:inStoreage;
	}
	public void setInStoreage(Integer inStoreage) {
		this.inStoreage = inStoreage;
	}
	public Integer getOutStoreage() {
		return outStoreage==null?0:outStoreage;
	}
	public void setOutStoreage(Integer outStoreage) {
		this.outStoreage = outStoreage;
	}
	public Integer getAdjust() {
		return adjust==null?0:adjust;
	}
	public void setAdjust(Integer adjust) {
		this.adjust = adjust;
	}
	public Integer getVirtualNumber() {
		return virtualNumber==null?0:virtualNumber;
	}
	public void setVirtualNumber(Integer virtualNumber) {
		this.virtualNumber = virtualNumber;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Integer getCalculatorNumber() {
		int inNum = this.inStoreage==null?0:this.inStoreage;
		int outNum = this.outStoreage==null?0:this.outStoreage;
		int adNum = this.adjust==null?0:this.adjust;
		return inNum-outNum+adNum;
	}
	public void setCalculatorNumber(Integer calculatorNumber) {
		this.calculatorNumber = calculatorNumber;
	}
}

package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_dynamic database table.
 * 
 */
@Entity
@Table(name="nm_tb_dynamic")
public class Dynamic extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	
	private String partId;			//备件号ID
	private String type;			//类型(出库,入库,调整)
	private String parts;			//备件
	private String pdate;			//打印时间
	private String rack;			//货架号
	private Integer relNumber;		//实盘数量
	private Integer sysNumber;		//系统数量
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

	public Dynamic() {
	}
	@Column(name="ADJUST")
	public Integer getAdjust() {
		return this.adjust;
	}

	public void setAdjust(Integer adjust) {
		this.adjust = adjust;
	}

	@Column(name="DAYS")
	public String getDays() {
		return this.days;
	}

	public void setDays(String days) {
		this.days = days;
	}


	@Column(name="IN_STOREAGE")
	public Integer getInStoreage() {
		return this.inStoreage;
	}

	public void setInStoreage(Integer inStoreage) {
		this.inStoreage = inStoreage;
	}

	@Column(name="MONTHS")
	public String getMonths() {
		return this.months;
	}

	public void setMonths(String months) {
		this.months = months;
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


	@Column(name="OUT_STOREAGE")
	public Integer getOutStoreage() {
		return this.outStoreage;
	}

	public void setOutStoreage(Integer outStoreage) {
		this.outStoreage = outStoreage;
	}


	@Column(name="PART_ID")
	public String getPartId() {
		return this.partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	@Column(name="PARTS")
	public String getParts() {
		return this.parts;
	}

	public void setParts(String parts) {
		this.parts = parts;
	}

	@Column(name="PDATE")
	public String getPdate() {
		return this.pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	@Column(name="RACK")
	public String getRack() {
		return this.rack;
	}

	public void setRack(String rack) {
		this.rack = rack;
	}


	@Column(name="REL_NUMBER")
	public Integer getRelNumber() {
		return this.relNumber;
	}

	public void setRelNumber(Integer relNumber) {
		this.relNumber = relNumber;
	}

	@Column(name="REMARKS")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="SYS_NUMBER")
	public Integer getSysNumber() {
		return this.sysNumber;
	}

	public void setSysNumber(Integer sysNumber) {
		this.sysNumber = sysNumber;
	}

	@Column(name="YEARS")
	public String getYears() {
		return this.years;
	}

	public void setYears(String years) {
		this.years = years;
	}
	@Column(name="TYPE")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
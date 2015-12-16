package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_store_adjustment database table.
 * 
 */
@Entity
@Table(name="nm_tb_store_adjustment")
public class StoreAdjustment extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String no;					//调整单号
	private Integer number;			//调整数量
	private String partsId;			//备件号
	private String partName;		//备件名称
	private String parts;			//备件
	private Double wac;				//wac
	private Double price;			//单价
	private String type;			//类型
	private Double totalPrice;		//总价
	
	private String applyDate;		//申请时间
	private String applyReason;		//申请原因
	private String applyUserId;		//申请人员ID
	private String applyUserName;
	
	private String approvalRemark;	//审批备注
	private String approvalUser;	//审批人
	private String approvalUserId;	//审批人ID
	private String approvalDate;	//审批时间
	
	private String baseTube;		//库管
	private String baseTubeId;		//库管ID
	private String confimTime;		//确认时间
	
	private String status;			//状态
	
	
	
	
	private Integer tubeAsc;		//库管排序
	
	private Integer managerAsc;		//经理排序

	public StoreAdjustment() {
	}

	@Column(name="APPLY_DATE")
	public String getApplyDate() {
		return this.applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}


	@Column(name="APPLY_REASON")
	public String getApplyReason() {
		return this.applyReason;
	}

	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}


	@Column(name="APPLY_USER_ID")
	public String getApplyUserId() {
		return this.applyUserId;
	}

	public void setApplyUserId(String applyUserId) {
		this.applyUserId = applyUserId;
	}


	@Column(name="APPLY_USER_NAME")
	public String getApplyUserName() {
		return this.applyUserName;
	}

	public void setApplyUserName(String applyUserName) {
		this.applyUserName = applyUserName;
	}


	@Column(name="APPROVAL_REMARK")
	public String getApprovalRemark() {
		return this.approvalRemark;
	}

	public void setApprovalRemark(String approvalRemark) {
		this.approvalRemark = approvalRemark;
	}


	@Column(name="APPROVAL_USER")
	public String getApprovalUser() {
		return this.approvalUser;
	}

	public void setApprovalUser(String approvalUser) {
		this.approvalUser = approvalUser;
	}


	@Column(name="APPROVAL_USER_ID")
	public String getApprovalUserId() {
		return this.approvalUserId;
	}

	public void setApprovalUserId(String approvalUserId) {
		this.approvalUserId = approvalUserId;
	}


	@Column(name="BASE_TUBE")
	public String getBaseTube() {
		return this.baseTube;
	}

	public void setBaseTube(String baseTube) {
		this.baseTube = baseTube;
	}


	@Column(name="BASE_TUBE_ID")
	public String getBaseTubeId() {
		return this.baseTubeId;
	}

	public void setBaseTubeId(String baseTubeId) {
		this.baseTubeId = baseTubeId;
	}


	@Column(name="CONFIM_TIME")
	public String getConfimTime() {
		return this.confimTime;
	}

	public void setConfimTime(String confimTime) {
		this.confimTime = confimTime;
	}

	@Column(name="NUMBER")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}


	@Column(name="PARTS_ID")
	public String getPartsId() {
		return this.partsId;
	}

	public void setPartsId(String partsId) {
		this.partsId = partsId;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Column(name="TOTAL_PRICE")
	public Double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Column(name="WAC")
	public Double getWac() {
		return this.wac;
	}

	public void setWac(Double wac) {
		this.wac = wac;
	}

	@Column(name="PRICE")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name="TUBE_ASC")
	public Integer getTubeAsc() {
		return tubeAsc;
	}

	public void setTubeAsc(Integer tubeAsc) {
		this.tubeAsc = tubeAsc;
	}

	@Column(name="MANAGER_ASC")
	public Integer getManagerAsc() {
		return managerAsc;
	}

	public void setManagerAsc(Integer managerAsc) {
		this.managerAsc = managerAsc;
	}
	
	@Column(name="APPROVAL_DATE")
	public String getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}

	@Column(name="NO")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	@Column(name="PARTS")
	public String getParts() {
		return parts;
	}

	public void setParts(String parts) {
		this.parts = parts;
	}

	@Column(name="TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name="PART_NAME")
	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

}
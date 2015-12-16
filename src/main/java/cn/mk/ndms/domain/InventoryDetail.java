package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_inventory_detail database table.
 * 
 */
@Entity
@Table(name="nm_tb_inventory_detail")
public class InventoryDetail extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String cdate;			//创建时间
	private String cycleId;			//主ID
	
	private Integer number;			//库存
	private String operUser;		//操作人 
	private String operUserId;
	private String partId;			//备件号 
	private String part;			//备件
	private String pdate;			//打印日期
	private String shelvNo;			//货架号 
	private String status;
	private Integer sudoku;			//初盘数 
	private Integer infrequently;	//复盘数
	
	private Integer dif;			//差异数
	
	private Short DifIs;			//是否有差异 

	public InventoryDetail() {
	}
	@Column(name="CDATE")
	public String getCdate() {
		return this.cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}


	@Column(name="CYCLE_ID")
	public String getCycleId() {
		return this.cycleId;
	}

	public void setCycleId(String cycleId) {
		this.cycleId = cycleId;
	}

	@Column(name="INFREQUENTLY")
	public Integer getInfrequently() {
		return this.infrequently;
	}

	public void setInfrequently(Integer infrequently) {
		this.infrequently = infrequently;
	}

	@Column(name="NUMBER")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
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


	@Column(name="PART_ID")
	public String getPartId() {
		return this.partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	@Column(name="PDATE")
	public String getPdate() {
		return this.pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}


	@Column(name="SHELV_NO")
	public String getShelvNo() {
		return this.shelvNo;
	}

	public void setShelvNo(String shelvNo) {
		this.shelvNo = shelvNo;
	}

	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="SUDOKU")
	public Integer getSudoku() {
		return this.sudoku;
	}

	public void setSudoku(Integer sudoku) {
		this.sudoku = sudoku;
	}
	
	@Column(name="DIF")
	public Integer getDif() {
		return dif;
	}
	public void setDif(Integer dif) {
		this.dif = dif;
	}
	
	@Column(name="DIF_IS")
	public Short getDifIs() {
		return DifIs;
	}
	public void setDifIs(Short difIs) {
		DifIs = difIs;
	}
	
	@Column(name="PART")
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}

}
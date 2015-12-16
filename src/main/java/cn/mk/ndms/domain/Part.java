package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_parts database table.
 * 
 */
@Entity
@Table(name="nm_ts_parts")
public class Part extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private Short flag;					
	private Integer locks;			//锁定
	private String no;				//NO
	private Integer number;			//数量
	private String name;			//名称
	private Integer newNumber;		//新件
	private String model;			//机器型号
	private Integer oldNumber;		//维修旧件
	private String partDes;			//备注
	private String partFru;			//替代FRU
	private String rack;			//货架
	private Double price;		//单价
	private Double wac;			//wac
	public Part() {
	}

	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}

	@Column(name="LOCKS")
	public Integer getLocks() {
		return this.locks;
	}

	public void setLocks(Integer locks) {
		this.locks = locks;
	}

	@Column(name="NO")
	public String getNo() {
		return this.no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	@Column(name="NUMBER")
	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}


	@Column(name="PART_DES")
	public String getPartDes() {
		return this.partDes;
	}

	public void setPartDes(String partDes) {
		this.partDes = partDes;
	}


	@Column(name="PART_FRU")
	public String getPartFru() {
		return this.partFru;
	}

	public void setPartFru(String partFru) {
		this.partFru = partFru;
	}

	@Column(name="RACK")
	public String getRack() {
		return this.rack;
	}

	public void setRack(String rack) {
		this.rack = rack;
	}

	@Column(name="NEW_NUMBER")
	public Integer getNewNumber() {
		return newNumber;
	}

	public void setNewNumber(Integer newNumber) {
		this.newNumber = newNumber;
	}

	@Column(name="OLD_NUMBER")
	public Integer getOldNumber() {
		return oldNumber;
	}

	public void setOldNumber(Integer oldNumber) {
		this.oldNumber = oldNumber;
	}
	@Column(name="PRICE")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	@Column(name="WAC")
	public Double getWac() {
		return wac;
	}

	public void setWac(Double wac) {
		this.wac = wac;
	}
	@Column(name="MODEL")
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Column(name="NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
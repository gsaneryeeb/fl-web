package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_tb_inventory_cycle database table.
 * 
 */
@Entity
@Table(name="nm_tb_inventory_cycle")
public class InventoryCycle extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String status;
	private String year;		//年
	private String quarter;		//季度
	private String months;		//月
	
	private String type;		//执行类型	Y/Q/M

	public InventoryCycle() {
	}
	@Column(name="STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="YEAR")
	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	@Column(name="QUARTER")
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	@Column(name="MONTHS")
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	
	@Column(name="TYPE")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
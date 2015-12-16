package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;

/**
 * The persistent class for the nm_ts_auth database table.
 * 
 */
@Entity
@Table(name = "NM_TB_WAC")
public class Wac extends BaseEntity<String> {
	private static final long serialVersionUID = 1L;
	private String partId;
	private String partNo;
	private Double wac;
	private Double price;
	private String years;
	private String months;
	private String days;
	private Short flag;

	public Wac() {

	}

	@Column(name = "PART_ID")
	public String getPartId() {
		return partId;
	}

	public void setPartId(String partId) {
		this.partId = partId;
	}

	@Column(name = "PART_NO")
	public String getPartNo() {
		return partNo;
	}

	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}

	@Column(name = "WAC")
	public Double getWac() {
		return wac;
	}

	public void setWac(Double wac) {
		this.wac = wac;
	}

	@Column(name = "YEARS")
	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	@Column(name = "MONTHS")
	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	@Column(name = "DAYS")
	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	@Column(name = "FLAG")
	public Short getFlag() {
		return flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}
	@Column(name = "PRICE")
	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
}
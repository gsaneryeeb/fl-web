package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_service_cover database table.
 * 
 */
@Entity
@Table(name="nm_ts_service_cover")
public class ServiceCover extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private Short flag;
	private String name;
	private String no;

	public ServiceCover() {
	}
	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}

	@Column(name="NAME")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="NO")
	public String getNo() {
		return this.no;
	}

	public void setNo(String no) {
		this.no = no;
	}

}
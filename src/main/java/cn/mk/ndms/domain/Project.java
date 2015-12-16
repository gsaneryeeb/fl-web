package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_project database table.
 * 
 */
@Entity
@Table(name="nm_ts_project")
public class Project extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String cname;
	private String no;
	@Column(name="NO")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	private Short flag;
	private String type;
	private String typeId;

	public Project() {
	}

	@Column(name="CNAME")
	public String getCname() {
		return this.cname;
	}
	
	public void setCname(String cname) {
		this.cname = cname;
	}

	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}

	@Column(name="TYPE")
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}


	@Column(name="TYPE_ID")
	public String getTypeId() {
		return this.typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

}
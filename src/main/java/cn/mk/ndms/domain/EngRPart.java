package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_eng_r_parts database table.
 * 
 */
@Entity
@Table(name="nm_ts_eng_r_parts")
public class EngRPart extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private Short flag;
	private String roleIdFk;
	private String serviceCoverIdFk;

	public EngRPart() {
	}

	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}


	@Column(name="ROLE_ID_FK")
	public String getRoleIdFk() {
		return this.roleIdFk;
	}

	public void setRoleIdFk(String roleIdFk) {
		this.roleIdFk = roleIdFk;
	}


	@Column(name="SERVICE_COVER_ID_FK")
	public String getServiceCoverIdFk() {
		return this.serviceCoverIdFk;
	}

	public void setServiceCoverIdFk(String serviceCoverIdFk) {
		this.serviceCoverIdFk = serviceCoverIdFk;
	}

}
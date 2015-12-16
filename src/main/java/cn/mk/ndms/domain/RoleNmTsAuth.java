package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_role_nm_ts_auth database table.
 * 
 */
@Entity
@Table(name="nm_ts_role_nm_ts_auth")
public class RoleNmTsAuth extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String authId;
	private String roleId;

	private Auth auth;
	
	@ManyToOne(targetEntity=Auth.class,fetch=FetchType.LAZY)
	@JoinColumn(name="AUTH_ID",insertable=false,updatable=false)
	public Auth getAuth() {
		return auth;
	}

	public void setAuth(Auth auth) {
		this.auth = auth;
	}

	@ManyToOne(targetEntity=Role.class,fetch=FetchType.LAZY)
	@JoinColumn(name="ROLE_ID",insertable=false,updatable=false)
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	private Role role;
	
	public RoleNmTsAuth() {
	}

	@Column(name="AUTH_ID")
	public String getAuthId() {
		return this.authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}


	@Column(name="ROLE_ID")
	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

}
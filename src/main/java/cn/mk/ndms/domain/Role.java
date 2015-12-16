package cn.mk.ndms.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_role database table.
 * 
 */
@Entity
@Table(name="nm_ts_role")
public class Role extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private Short availability;
	private String cname;
	private String ename;

	private Set<RoleNmTsAuth> roleNmTsAuth;
	
	@OneToMany(targetEntity=RoleNmTsAuth.class,fetch=FetchType.LAZY,mappedBy="role",cascade={CascadeType.ALL})
	public Set<RoleNmTsAuth> getRoleNmTsAuth() {
		return roleNmTsAuth;
	}


	public void setRoleNmTsAuth(Set<RoleNmTsAuth> roleNmTsAuth) {
		this.roleNmTsAuth = roleNmTsAuth;
	}

	public Role() {
	}

	@Column(name="AVAILABILITY")
	public Short getAvailability() {
		return this.availability;
	}

	public void setAvailability(Short availability) {
		this.availability = availability;
	}

	@Column(name="CNAME")
	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Column(name="ENAME")
	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

}
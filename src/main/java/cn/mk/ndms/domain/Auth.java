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
 * The persistent class for the nm_ts_auth database table.
 * 
 */
@Entity
@Table(name="nm_ts_auth")
public class Auth extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String des;
	private Short flag;
	private String name;
	private Set<AuthNmTsResource> authNmTsResource;
	
	private Set<RoleNmTsAuth> roleNmTsAuth;
	
	@OneToMany(targetEntity=RoleNmTsAuth.class,fetch=FetchType.LAZY,mappedBy="auth",cascade={CascadeType.ALL})
	public Set<RoleNmTsAuth> getRoleNmTsAuth() {
		return roleNmTsAuth;
	}

	public void setRoleNmTsAuth(Set<RoleNmTsAuth> roleNmTsAuth) {
		this.roleNmTsAuth = roleNmTsAuth;
	}

	@OneToMany(targetEntity=AuthNmTsResource.class,fetch=FetchType.LAZY,mappedBy="auth",cascade={CascadeType.ALL})
	public Set<AuthNmTsResource> getAuthNmTsResource() {
		return authNmTsResource;
	}

	public void setAuthNmTsResource(Set<AuthNmTsResource> authNmTsResource) {
		this.authNmTsResource = authNmTsResource;
	}

	public Auth() {
	}

	@Column(name="DES")
	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
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

}
package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_auth_nm_ts_resources database table.
 * 
 */
@Entity
@Table(name="nm_ts_auth_nm_ts_resources")
public class AuthNmTsResource extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String authId;
	private String resourceId;
	
	private Auth auth;
	
	private Resource resource;
	
	@ManyToOne(targetEntity=Resource.class,fetch=FetchType.LAZY)
	@JoinColumn(name="RESOURCE_ID",insertable=false,updatable=false)
	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	@ManyToOne(targetEntity=Auth.class,fetch=FetchType.LAZY)
	@JoinColumn(name="AUTH_ID",insertable=false,updatable=false)
	public Auth getAuth() {
		return auth;
	}

	public void setAuth(Auth auth) {
		this.auth = auth;
	}

	@Column(name="RESOURCE_ID")
	public String getResourceId() {
		return resourceId;
	}

	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}

	public AuthNmTsResource() {
	}

	@Column(name="AUTH_ID")
	public String getAuthId() {
		return this.authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}
}
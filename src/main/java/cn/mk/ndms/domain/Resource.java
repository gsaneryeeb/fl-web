package cn.mk.ndms.domain;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_resources database table.
 * 
 */
@Entity
@Table(name="nm_ts_resources")
public class Resource extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String name;
	private String des;
	private Short flag;
	private Integer sort;
	private String superior;
	private String url;

	private List<Resource> resourceses;
	
	private Set<AuthNmTsResource> authNmTsResource;
	
	public void setAuthNmTsResource(Set<AuthNmTsResource> authNmTsResource) {
		this.authNmTsResource = authNmTsResource;
	}


	@OneToMany(targetEntity=AuthNmTsResource.class,fetch=FetchType.LAZY,mappedBy="resource",cascade={CascadeType.ALL})
	public Set<AuthNmTsResource> getAuthNmTsResource() {
		return authNmTsResource;
	}
	
	
	@OneToMany(targetEntity=Resource.class,fetch=FetchType.LAZY)
	@JoinColumn(name="SUPERIOR",insertable=false,updatable=false)
	public List<Resource> getResourceses() {
		return resourceses;
	}
	public void setResourceses(List<Resource> resourceses) {
		this.resourceses = resourceses;
	}
	public Resource() {
	}
	@Column(name="NAME")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Column(name="SORT")
	public Integer getSort() {
		return this.sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Column(name="SUPERIOR")
	public String getSuperior() {
		return this.superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}

	@Column(name="URL")
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isContainUrl(String url){
		if (url != null && !("").equals(url)) {
			if (url.equals(this.url)) {
				return true;
			} else {
				List<Resource> resourceses = getResourceses();
				if (resourceses == null || resourceses.size() == 0) {
					return false;
				} else {
					for (Resource resource : resourceses) {
						if (url.equals(resource.getUrl())) {
							return true;
						} else {
							if(resource.isContainUrl(url)){
								return true;
							}
						}
					}
				}
			}
		}
		return false;
	}
}
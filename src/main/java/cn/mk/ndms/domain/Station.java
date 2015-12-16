package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_station database table.
 * 
 */
@Entity
@Table(name="nm_ts_station")
public class Station extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private Short flag;
	private String name;
	private String no;
	private String projectIdFk;
	
	private Project project;
	
	@ManyToOne(targetEntity=Project.class,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_ID_FK",insertable=false,updatable=false)
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Station() {
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


	@Column(name="PROJECT_ID_FK")
	public String getProjectIdFk() {
		return this.projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}

}
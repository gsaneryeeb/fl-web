package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_project_r_user database table.
 * 
 */
@Entity
@Table(name="nm_ts_project_r_user")
public class ProjectRUser extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String projectIdFk;
	private String userIdFk;

	private User user;
	
	private Project project;
	
	@ManyToOne(targetEntity=User.class,fetch=FetchType.LAZY)
	@JoinColumn(name="USER_ID_FK",insertable=false,updatable=false)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(targetEntity=Project.class,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_ID_FK",insertable=false,updatable=false)
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ProjectRUser() {
	}

	@Column(name="PROJECT_ID_FK")
	public String getProjectIdFk() {
		return this.projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}


	@Column(name="USER_ID_FK")
	public String getUserIdFk() {
		return this.userIdFk;
	}

	public void setUserIdFk(String userIdFk) {
		this.userIdFk = userIdFk;
	}

}
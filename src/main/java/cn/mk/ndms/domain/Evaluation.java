package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_evaluation database table.
 * 
 */
@Entity
@Table(name="nm_ts_evaluation")
public class Evaluation extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String content;			//评分内容
	private String evaluation;		//评分
	private String evaluationProject;		//评分项
	private Short flag;

	public Evaluation() {
	}

	@Column(name="CONTENT")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name="EVALUATION")
	public String getEvaluation() {
		return this.evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}


	@Column(name="EVALUATION_PROJECT")
	public String getEvaluationProject() {
		return this.evaluationProject;
	}

	public void setEvaluationProject(String evaluationProject) {
		this.evaluationProject = evaluationProject;
	}

	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}

}
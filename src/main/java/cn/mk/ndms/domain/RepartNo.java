package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_auth database table.
 * 
 */
@Entity
@Table(name="NM_TB_REPAIR_NO")
public class RepartNo extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String no;
	private String type;
	private String cdate;
	private String userId;
	
	
	
	public RepartNo(){
		
	}
	@Column(name="NO")
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	
	@Column(name="TYPE")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="CDATE")
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	@Column(name="USER_ID")
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}
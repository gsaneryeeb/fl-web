package cn.mk.ndms.modules.sys.web.vo;

import javax.persistence.Column;

public class UserRecord {

	private String[] rolelx;
	private String[] uNamelx;
	private String role;
	private String uName;

	public String[] getRolelx() {
		return rolelx;
	}

	public void setRolelx(String[] rolelx) {
		this.rolelx = rolelx;
	}

	public String[] getuNamelx() {
		return uNamelx;
	}

	public void setuNamelx(String[] uNamelx) {
		this.uNamelx = uNamelx;
	}

	@Column(name="ROLE")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	@Column(name="U_NAME")
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	
}

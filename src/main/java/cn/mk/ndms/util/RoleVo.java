package cn.mk.ndms.util;

public class RoleVo {
	private String id;
	private Short availability;
	private String cname;
	private String ename;
	
	public RoleVo(String id,Short availability,String cname,String ename){
		this.id=id;
		this.availability=availability;
		this.cname=cname;
		this.ename=ename;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Short getAvailability() {
		return availability;
	}
	public void setAvailability(Short availability) {
		this.availability = availability;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
}

package cn.mk.ndms.util;


public class Resources {
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String name;
	private String des;
	private Short flag;
	private Integer sort;
	private String superior;
	private String url;
	
	public Resources(){
		
	}
	public Resources(String id,String name,String des,Short flag,Integer sort,String superior,String url){
		this.id=id;
		this.name=name;
		this.des=des;
		this.flag=flag;
		this.sort=sort;
		this.superior=superior;
		this.url=url;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Short getFlag() {
		return flag;
	}
	public void setFlag(Short flag) {
		this.flag = flag;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getSuperior() {
		return superior;
	}
	public void setSuperior(String superior) {
		this.superior = superior;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public boolean isContainUrl(String url){
		if (url != null && !("").equals(url)) {
			if (url.equals(this.url)) {
				return true;
			} 
		}
		return false;
	}
}

package cn.mk.ndms.util;

import java.util.Collection;

import cn.mk.ndms.domain.Resource;

/** 
 * @author 作者 :范津
 * @version 创建时间：2014年4月2日 下午5:21:23
 * 类说明 
 */
public class Menu {
	private String en;
	private String cn;
	private String url;
	private String superior;
	public Menu(){
		
	}
	
	public Menu(String cn,String en,String url,String superior){
		this.cn=cn;
		this.en=en;
		this.url=url;
		this.superior=superior;
	}
	
	public String getEn() {
		return en;
	}
	public void setEn(String en) {
		this.en = en;
	}
	public String getCn() {
		return cn;
	}
	public void setCn(String cn) {
		this.cn = cn;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getSuperior() {
		return superior;
	}

	public void setSuperior(String superior) {
		this.superior = superior;
	}
	
	public static String getStaticUrl(Resource menu,Collection<Resource> resources){
		String url="#";
		if(resources!=null && !resources.isEmpty()){
			for(Resource rs:resources){
				if(rs.getSuperior()!=null){
					if(menu.getId().toString().equals(rs.getSuperior().toString())){
						return url.equals(rs.getUrl())==true?getStaticUrl(rs,resources):rs.getUrl();
					}
				}
			}
		}
		return url;
	}
}

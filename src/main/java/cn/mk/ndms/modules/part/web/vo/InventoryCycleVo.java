package cn.mk.ndms.modules.part.web.vo;

import java.util.List;
import java.util.Map;

import cn.mk.ndms.domain.Part;


public class InventoryCycleVo {
	
	private String cycleId;
	
	private String cycleType;
	
	private String cycleQ;
	
	private String cycleM;
	
	private String cycleY;
	
	private Map<String,Part> mapPart;			//原始
	
	private List<Part> initParts;				//原始
	
	private Map<String,PartVo> mapPartVo;		//页面vo

	public String getCycleId() {
		return cycleId;
	}

	public void setCycleId(String cycleId) {
		this.cycleId = cycleId;
	}

	public String getCycleType() {
		return cycleType;
	}

	public void setCycleType(String cycleType) {
		this.cycleType = cycleType;
	}

	public String getCycleQ() {
		return cycleQ;
	}

	public void setCycleQ(String cycleQ) {
		this.cycleQ = cycleQ;
	}

	public String getCycleM() {
		return cycleM;
	}

	public void setCycleM(String cycleM) {
		this.cycleM = cycleM;
	}

	public String getCycleY() {
		return cycleY;
	}

	public void setCycleY(String cycleY) {
		this.cycleY = cycleY;
	}

	public Map<String, Part> getMapPart() {
		return mapPart;
	}

	public void setMapPart(Map<String, Part> mapPart) {
		this.mapPart = mapPart;
	}

	public List<Part> getInitParts() {
		return initParts;
	}

	public void setInitParts(List<Part> initParts) {
		this.initParts = initParts;
	}

	public Map<String, PartVo> getMapPartVo() {
		return mapPartVo;
	}

	public void setMapPartVo(Map<String, PartVo> mapPartVo) {
		this.mapPartVo = mapPartVo;
	}
	
}

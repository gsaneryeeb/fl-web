package cn.mk.ndms.modules.service.web.vo;

public class ReturnVo {
	
	private String id;
	
	private String station;				//服务站
	
	private int doorNums;
	
	private int	commNums;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public int getDoorNums() {
		return doorNums;
	}

	public void setDoorNums(int doorNums) {
		this.doorNums = doorNums;
	}

	public int getCommNums() {
		return commNums;
	}

	public void setCommNums(int commNums) {
		this.commNums = commNums;
	}

	
}

package cn.mk.ndms.modules.service.web.vo;

public class StationVo {
	
	private String id;
	
	private String station;				//服务站
	
	private String stationId;			//服务站ID
	
	private String stationNo;			//编号
	
	private Long amounts;				//申请数量
	
	private String type;				//维修类型

	public StationVo(String id,String station,String stationId,String stationNo,Long amounts,String type){
		this.id=id;
		this.station=station;
		this.stationId=stationId;
		this.stationNo=stationNo;
		this.amounts=amounts;
		this.type=type;
	}
	
	
	
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

	public String getStationId() {
		return stationId;
	}

	public void setStationId(String stationId) {
		this.stationId = stationId;
	}

	public String getStationNo() {
		return stationNo;
	}

	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}

	public Long getAmounts() {
		return amounts;
	}

	public void setAmounts(Long amounts) {
		this.amounts = amounts;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}

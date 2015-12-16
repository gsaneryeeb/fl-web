package cn.mk.ndms.modules.part.web.vo;



public class PartVo {
	
	private String id;				//备件ID
	
	private String no;				//备件号
	
	private String rack;

	private Integer number;
	
	private Integer newNumber;
	
	private Integer oldNumber;
	
	private Integer initNumber;		//初盘
	
	private boolean check_boolean;	//是否进行复盘
	
	private Integer checkNumber;	//复盘
	
	private Integer diffNumber;		//差异
	
	private boolean diff_boolean;	//是否进行差异
	
	private String partName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRack() {
		return rack;
	}

	public void setRack(String rack) {
		this.rack = rack;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getNewNumber() {
		return newNumber;
	}

	public void setNewNumber(Integer newNumber) {
		this.newNumber = newNumber;
	}

	public Integer getOldNumber() {
		return oldNumber;
	}

	public void setOldNumber(Integer oldNumber) {
		this.oldNumber = oldNumber;
	}

	public Integer getInitNumber() {
		return initNumber;
	}

	public void setInitNumber(Integer initNumber) {
		this.initNumber = initNumber;
	}

	public Integer getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(Integer checkNumber) {
		this.checkNumber = checkNumber;
	}

	public Integer getDiffNumber() {
		return diffNumber;
	}

	public void setDiffNumber(Integer diffNumber) {
		this.diffNumber = diffNumber;
	}

	public boolean isCheck_boolean() {
		return check_boolean;
	}

	public void setCheck_boolean(boolean check_boolean) {
		this.check_boolean = check_boolean;
	}

	public boolean isDiff_boolean() {
		return diff_boolean;
	}

	public void setDiff_boolean(boolean diff_boolean) {
		this.diff_boolean = diff_boolean;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName =partName;
	}

}

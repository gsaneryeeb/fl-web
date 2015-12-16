package cn.mk.ndms.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;

/**
 * The persistent class for the nm_tb_helpdesk database table.
 * 
 */
@Entity
@Table(name = "nm_tb_helpdesk")
public class Helpdesk extends BaseEntity<String> {
	private static final long serialVersionUID = 1L;
	private String projectIdFk; // 项目编号
	private String acceptPersonId; // 接收人ID
	private String acceptPersonName; // 接收人
	private String acceptDate; // 接受时间
	private String department; // 部门
	private String finishDate; // 服务完成时间
	private String machineModel; // 机器型号
	private String name; // 姓名
	private String operFinishDate; // 操作完成时间
	private String orders; // 维修单号
	private String serialNumber; // 机器序列号
	private String serviceContent; // 服务内容
	private String serviceEvaluation1; // 服务评价1
	private String serviceEvaluation2; // 服务评价2
	private String serviceEvaluation3; // 服务评价3
	private String serviceEvaluation4; // 服务评价4
	private String serviceEvaluation5; // 服务评价5
	private String staffNo; // 员工编号
	private String status; // 状态
	private String tel; // 联系电话
	private String totalTime; // 共计时间
	private String warrantyPeriod; // 保修时间

	private Project project;

	private String type; // 服务类型
	private String contentCheck; // 服务内容多选
	private String startDate; // 服务开始时间
	private String repairTime; // 报修时间
	private String officeSpace; // 办公地点
	private String tableNumber; // 桌号
	private String portNumber; // 端口号
	private String projectName; // 项目单位
	private String head; // 负责人

	public Helpdesk() {
	}

	@Column(name = "ACCEPT_PERSON_ID")
	public String getAcceptPersonId() {
		return this.acceptPersonId;
	}

	public void setAcceptPersonId(String acceptPersonId) {
		this.acceptPersonId = acceptPersonId;
	}

	@Column(name = "ACCEPT_PERSON_NAME")
	public String getAcceptPersonName() {
		return this.acceptPersonName;
	}

	public void setAcceptPersonName(String acceptPersonName) {
		this.acceptPersonName = acceptPersonName;
	}

	@Column(name = "DEPARTMENT")
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Column(name = "FINISH_DATE")
	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	@Column(name = "MACHINE_MODEL")
	public String getMachineModel() {
		return this.machineModel;
	}

	public void setMachineModel(String machineModel) {
		this.machineModel = machineModel;
	}

	@Column(name = "NAME")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "OPER_FINISH_DATE")
	public String getOperFinishDate() {
		return this.operFinishDate;
	}

	public void setOperFinishDate(String operFinishDate) {
		this.operFinishDate = operFinishDate;
	}

	@Column(name = "ORDERS")
	public String getOrders() {
		return this.orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}

	@Column(name = "SERIAL_NUMBER")
	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	@Column(name = "SERVICE_CONTENT")
	public String getServiceContent() {
		return this.serviceContent;
	}

	public void setServiceContent(String serviceContent) {
		this.serviceContent = serviceContent;
	}

	@Column(name = "SERVICE_EVALUATION1")
	public String getServiceEvaluation1() {
		return this.serviceEvaluation1;
	}

	public void setServiceEvaluation1(String serviceEvaluation1) {
		this.serviceEvaluation1 = serviceEvaluation1;
	}

	@Column(name = "SERVICE_EVALUATION2")
	public String getServiceEvaluation2() {
		return this.serviceEvaluation2;
	}

	public void setServiceEvaluation2(String serviceEvaluation2) {
		this.serviceEvaluation2 = serviceEvaluation2;
	}

	@Column(name = "SERVICE_EVALUATION3")
	public String getServiceEvaluation3() {
		return this.serviceEvaluation3;
	}

	public void setServiceEvaluation3(String serviceEvaluation3) {
		this.serviceEvaluation3 = serviceEvaluation3;
	}

	@Column(name = "SERVICE_EVALUATION4")
	public String getServiceEvaluation4() {
		return this.serviceEvaluation4;
	}

	public void setServiceEvaluation4(String serviceEvaluation4) {
		this.serviceEvaluation4 = serviceEvaluation4;
	}

	@Column(name = "SERVICE_EVALUATION5")
	public String getServiceEvaluation5() {
		return this.serviceEvaluation5;
	}

	public void setServiceEvaluation5(String serviceEvaluation5) {
		this.serviceEvaluation5 = serviceEvaluation5;
	}

	@Column(name = "STAFF_NO")
	public String getStaffNo() {
		return this.staffNo;
	}

	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}

	@Column(name = "STATUS")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "TEL")
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "TOTAL_TIME")
	public String getTotalTime() {
		return this.totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	@Column(name = "WARRANTY_PERIOD")
	public String getWarrantyPeriod() {
		return this.warrantyPeriod;
	}

	public void setWarrantyPeriod(String warrantyPeriod) {
		this.warrantyPeriod = warrantyPeriod;
	}

	@Column(name = "ACCEPT_DATE")
	public String getAcceptDate() {
		return acceptDate;
	}

	public void setAcceptDate(String acceptDate) {
		this.acceptDate = acceptDate;
	}

	@Column(name = "PROJECT_ID_FK")
	public String getProjectIdFk() {
		return projectIdFk;
	}

	public void setProjectIdFk(String projectIdFk) {
		this.projectIdFk = projectIdFk;
	}

	@ManyToOne(targetEntity = Project.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_ID_FK", insertable = false, updatable = false)
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@Column(name = "TYPE")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "CONTENT_CHECK")
	public String getContentCheck() {
		return contentCheck;
	}

	public void setContentCheck(String contentCheck) {
		this.contentCheck = contentCheck;
	}

	@Column(name = "START_DATE")
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	@Column(name = "REPAIR_TIME")
	public String getRepairTime() {
		return repairTime;
	}

	public void setRepairTime(String repairTime) {
		this.repairTime = repairTime;
	}

	@Column(name = "OFFICE_SPACE")
	public String getOfficeSpace() {
		return officeSpace;
	}

	public void setOfficeSpace(String officeSpace) {
		this.officeSpace = officeSpace;
	}

	@Column(name = "TABLE_NUMBER")
	public String getTableNumber() {
		return tableNumber;
	}

	public void setTableNumber(String tableNumber) {
		this.tableNumber = tableNumber;
	}

	@Column(name = "PORT_NUMBER")
	public String getPortNumber() {
		return portNumber;
	}

	public void setPortNumber(String portNumber) {
		this.portNumber = portNumber;
	}

	@Column(name = "PROJECT_NAME")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Column(name = "HEAD")
	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

}
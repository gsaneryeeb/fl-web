package cn.mk.ndms.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.springframework.base.entity.BaseEntity;


/**
 * The persistent class for the nm_ts_user database table.
 * 
 */
@Entity
@Table(name="nm_ts_user")
public class User extends BaseEntity<String>  {
	private static final long serialVersionUID = 1L;
	private String authIdFk;	
	private Short flag;			//状态
	private String qq;			//QQ
	private String roleIdFk;	//角色
	private String tel;			//电话
	private String uName;		//姓名
	private String uPass;		//密码
	private String userName;	//账户
	private String userNo;		//编号
	
	private String identityCard;	//身份证号码
	private String homeAdress;		//家庭住址
	private String entryDate;		//入职日期
	private String periodProbationStart;	//试用期期限开始
	private String periodProbationEnd;	//试用期期限结束
	private String signingContract;	//签订合同日期
	private String contractDateStart;	//合同开始日期
	private String contractDateEnd;	//合同结束日期
	private String departureDate;	//离职日期
	private String accountNature;	//户口性质
	private String insuranceOnTime;	//上保险时间
	
//	private Role role;
	
	private Set<ProjectRUser> projectRUser;
	
	@OneToMany(targetEntity=ProjectRUser.class,fetch=FetchType.LAZY,mappedBy="user",cascade={CascadeType.ALL})
	public Set<ProjectRUser> getProjectRUser() {
		return projectRUser;
	}

	public void setProjectRUser(Set<ProjectRUser> projectRUser) {
		this.projectRUser = projectRUser;
	}

//	@ManyToOne(targetEntity=Role.class,fetch=FetchType.LAZY)
//	@JoinColumn(name="ROLE_ID_FK",insertable=false,updatable=false)
//	public Role getRole() {
//		return role;
//	}
//
//	public void setRole(Role role) {
//		this.role = role;
//	}

	public User() {
	}

	@Column(name="AUTH_ID_FK")
	public String getAuthIdFk() {
		return this.authIdFk;
	}

	public void setAuthIdFk(String authIdFk) {
		this.authIdFk = authIdFk;
	}

	@Column(name="FLAG")
	public Short getFlag() {
		return this.flag;
	}

	public void setFlag(Short flag) {
		this.flag = flag;
	}

	@Column(name="QQ")
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}


	@Column(name="ROLE_ID_FK")
	public String getRoleIdFk() {
		return this.roleIdFk;
	}

	public void setRoleIdFk(String roleIdFk) {
		this.roleIdFk = roleIdFk;
	}

	@Column(name="TEL")
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name="USER_NAME")
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	@Column(name="USER_NO")
	public String getUserNo() {
		return this.userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	@Column(name="U_NAME")
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	@Column(name="U_PASS")
	public String getuPass() {
		return uPass;
	}

	public void setuPass(String uPass) {
		this.uPass = uPass;
	}

	@Column(name="IDENTITY_CARD")
	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	@Column(name="HOME_ADRESS")
	public String getHomeAdress() {
		return homeAdress;
	}

	public void setHomeAdress(String homeAdress) {
		this.homeAdress = homeAdress;
	}

	@Column(name="ENTRY_DATE")
	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	@Column(name="SIGNING_CONTRACT")
	public String getSigningContract() {
		return signingContract;
	}

	public void setSigningContract(String signingContract) {
		this.signingContract = signingContract;
	}

	@Column(name="CONTRACT_DATE_START")
	public String getContractDateStart() {
		return contractDateStart;
	}

	public void setContractDateStart(String contractDateStart) {
		this.contractDateStart = contractDateStart;
	}

	@Column(name="CONTRACT_DATE_END")
	public String getContractDateEnd() {
		return contractDateEnd;
	}

	public void setContractDateEnd(String contractDateEnd) {
		this.contractDateEnd = contractDateEnd;
	}

	@Column(name="DEPARTURE_DATE")
	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	@Column(name="ACCOUNT_NATURE")
	public String getAccountNature() {
		return accountNature;
	}

	public void setAccountNature(String accountNature) {
		this.accountNature = accountNature;
	}

	@Column(name="INSURANCE_ON_TIME")
	public String getInsuranceOnTime() {
		return insuranceOnTime;
	}

	public void setInsuranceOnTime(String insuranceOnTime) {
		this.insuranceOnTime = insuranceOnTime;
	}

	@Column(name="PERIOD_PROBATION_START")
	public String getPeriodProbationStart() {
		return periodProbationStart;
	}

	public void setPeriodProbationStart(String periodProbationStart) {
		this.periodProbationStart = periodProbationStart;
	}

	@Column(name="PERIOD_PROBATION_END")
	public String getPeriodProbationEnd() {
		return periodProbationEnd;
	}

	public void setPeriodProbationEnd(String periodProbationEnd) {
		this.periodProbationEnd = periodProbationEnd;
	}
}
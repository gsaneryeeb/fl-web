package cn.mk.ndms.util;
 
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/** 
 * @author 作者 :范津 
 * @version 创建时间：Feb 21, 2014 11:46:42 AM 
 * 类说明 
 */
public class Constants {

	public enum serviceType{
		HELP_DESK,CUSTOMER_SERVICE,REPAIR,IBM,C,W,T,A,R
	}
	
	public static final String HELP_DESK_NO_PRE_FIX="H";
	
	public static final String CUSTOMER_SERVICE_NO_PRE_FIX="C";
	
	public static final String REPAIR_NO_PRE_FIX="R";
	
	public static final String OUT_NO_PRE_FIX="O";
	
	public static final String IN_NO_PRE_FIX="W";
	
	public static final String RETURN_NO_PRE_FIX_CJ="CJ";
	
	public static final String RETURN_NO_PRE_FIX_EJ="EJ";
	
	public static final String TEST_NO_PRE_FIX="T";		
	
	public static final String CG_NO_PRE_FIX="C";		
	
	public static final String ADJUST_NO_PRE_FIX="A";		
	
	public static final String INVENTORY_CYCLE_Q="Q";	
	
	public static final String INVENTORY_CYCLE_M="M";	
	
	public static final String INVENTORY_CYCLE_Y="Y";	
	
	public static final String NEW="new";
	
	public static final String OLD="old";
	
	public static final String CYCLE_ID="CYCLE_ID";
	
	public static final String INVENTORYCYCLE_VO="INVENTORYCYCLE_VO";
	
	public static final String DYNAMIC_VO="DYNAMIC_VO";
	
	public static final String CYCLE_TYPE="CYCLE_TYPE";
	
	public static final String CYCLE_Q="CYCLE_Q";
	
	public static final String CYCLE_M="CYCLE_M";
	
	public static final String CYCLE_Y="CYCLE_Y";
	
	public static final String SERVICE_TYPE_HELP_DESK_NO="03";

	public static final String SERVICE_TYPE_CUSTOMER_SERVICE_NO="04";
	
	public static final String SERVICE_TYPE_REPAIR_NO="02";
	
	public static final String SERVICE_TYPE_IBM_NO="01";
	
	public static final String SEARCH_PARAMETERS="SEARCH_PARAMETERS";
	
	public static final String ROLE_ENGINEER="engineer";
	
	public static final String DICTIONARYS_RESOURCES="资源管理";
	
	public static final String SUPIRO_PAGENAME="供应商管理";
	
	public static final String ROLE_PAGENAME="角色管理";
	
	public static final String PROJECT_PAGENAME="项目管理";
	
	public static final String WAC_PAGENAME="WAC管理";
	
	public static final String AUTH_PAGENAME="权限管理";
	
	public static final String STATION_PAGENAME="服务站管理";
	
	public static final String FAULT_PAGENAME="故障现象管理";
	
	public static final String PART_PAGENAME="备件信息管理";
	
	public static final String USER_PAGENAME="用户信息管理";
	
	public static final String INVENTORYCYCLE_PAGENAME="盘点管理";
	
	public static final String DOORREPAIRSERVICE_PAGENAME="客户上门维修服务管理";
	
	public static final String COMMONREPAIRSERVICE_PAGENAME="普通维修服务管理";

	public static final String HELPDESK_PAGENAME="HELP DESK管理";

	public static final String EVALUATION_PAGENAME="服务评分管理";
	
	public static final String RETURN_STATION_NAME="利华服务站";
	
	public static final String OUTBOUND_PAGENAME="备件出库信息";
	
	public static final String REPAIR_SERVICE_PAGENAME="送修服务管理";
	
	public static final String EXPRESS_PAGENAME="备件运输管理";
	
	public static final String RETURNPART_PAGENAME="返件处理";

	public static final String RETURNPART_PRINT_PAGENAME="返件补打";
	
	public static final String RETURNPART_SELECT_PAGENAME="返件查询";
	
	public static final String STORAGE_PAGENAME="备件入库";
	
	public static final String PURCHASE_PAGENAME="采购管理";
	
	public static final String PURCHASE_TEST_PAGENAME="订购测试";
	
	public static final String PURCHASE_BACK_PAGENAME="采购退回";
	
	public static final String DYNAMIC_PAGENAME="异动盘点管理";
	
	public static final String STORAGE_ADJUSTMENT_PAGENAME="库存调整";
	
	public static final String LEASE_PAGENAME="租赁管理";
	
	public static final String NOTARRIVE_EN="NOTARRIVE";
	
	public static final String NOTARRIVE_CN="未到货";
	
	public static final String ARRIVED_CN="已到货";
	
	public static final String ARRIVED_EN="ARRIVED";
	
	public static final String READ_ONLY_YES="readonly=readonly";
	
	public static final String CLASS_HIDE="class=hide";

	public static final String CLASS_NOT_HIDE="class";
	
	public static final String READ_ONLY_NO="";
	
	public static final String READ_ONLY_ONE="READ_ONLY_ONE";
	
	public static final String FIRST_HIDE="FIRST_HIDE";
	
	public static final String FIRST_SHOW="FIRST_SHOW";
	
	public static final String READ_ONLY_TWO="READ_ONLY_TWO";
	
	public static final String READ_ONLY_THRESS="READ_ONLY_THRESS";
	
	public static final String READ_ONLY_FORE="READ_ONLY_FORE";
	
	public static final String ENGINEER="engineer";
	
	public static final String FINISH="finish";
	
	public static final String AGREE="agree";
	
	public static final String CANCEL="cancel";
	
	public static final String REL_REPORT="REL_REPORT";
	
	public static final Map<String,String> MAP_PURCHASE_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","待收货");		
			put("1","已收货");	
			put("8","未到货");		
			put("9","已到货");	
			put("2","已分配工程师");
			put("-1","取消");		
			put("3","待测试");	
			put("4","完好");
			put("5","故障");
			put("6","待运输");		
			put("7","已发出");		
		}
	};
	
	public static final Map<String,String> MAP_LEASE_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","保存");		
			put("1","完成");		
			put("-1","取消");		
			put("2","续签处理中");		
			put("-2","续签处理完成");		
			put("3","提前退处理中");		
			put("-3","退处理完成");
		}
	};
	
	
	
	public static final Map<String,String> MAP_STORE_ADJUSTMENT_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","待审批");		//2			pm	1
			put("1","已调整");		//4		 		4
			put("2","已审批");		//1				3
			put("3","拒绝");			//3				2
			put("4","确认拒绝");		//5				5
		}
	};
	
	public static final Map<String,String> MAP_RETURN_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","未返回");
			put("1","已返件");
			put("2","已分配");
			put("3","待维修");
			put("4","待维中");
			put("5","修好入库");
			put("-1","报废");
		}
	};
	
	public static final Map<String,String> MAP_RETURN_PART_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","返新");
			put("1","返旧");
			put("2","新损");
			put("3","无旧件");
			put("4","DOA");
			put("5","非损");
		}
	};
	
	public static final Map<String,String> MAP_HELPDESK_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","已保修");
			put("1","已完成");
			put("2","未修复");
			put("-1","取消");
		}
	};
	
	
	public static final Map<String,String> MAP_REPAIRSERVICE_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
//			put("0","已送修");		
//			put("2","已分配");
//			put("3","维修");
//			put("4","在途");
//			put("1","签收");
//			put("-1","重复");
			put("0","在途");		
			put("2","已送修");
			put("3","维修");
			put("4","待运输");
			put("1","签收");
			put("-1","取消");
			put("5","重复");
		}
	};
	
	
	public static final Map<String,String> MAP_COMMON_REPAIRSERVICE_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","未处理");
			put("2","Pending");
			put("3","待运输");
			put("4","已发出");
			put("1","签收");
			put("-1","取消");
		}
	};

	public static final Map<String,String> MAP_FAULT_TYPE=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("SOFT","软件服务");
			put("HARD","硬件服务");
			put("SENCEND_REPER","二级维修");
		}
	};
	
	public static final Map<String,String> MAP_DOOR_REPAIR_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","待修");
			put("6","待修未申请");
			put("3","待修已申请");
			put("4","已修待取机");
			put("5","已修");
			put("1","完成");
			put("2","未修复");
			put("-2","客户放弃维修");
			put("-1","取消");
		}
	};
	
	public static final Map<String,String> MAP_OUT_PART_STATUS=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","未处理");
			put("2","已发出");
			put("3","已出库");
			put("4","Pending");
			put("1","已签收");
			put("-1","取消");
		}
	};

	public static final Map<String,String> MAP_PROJECT_TYPE=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("01","普通维修服务");
			put("02","送修服务");
			put("03","HELPDESK服务");
			put("04","客户上门维修");
			// 普通服务维修处，维修类型
			put("MEDICAL","保外服务");
			put("NON_LOSS","保内非损");
			put("MEDICAL_LOSS","保外非损");
		}
	};
	
	public static final Map<String,String> MAP_REPEAR_TYPE=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
//			put("0","首次维修");
//			put("1","重维");
//			put("2","未修复");
//			put("3","未开单重维");
			put("5","开单维修");
			put("4","不开单维修");
		}
	};
	
	public static final Map<String,String> MAP_HELPDESK_TYPE=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("SYS","系统运维");
			put("LINE","网络与机房服务");
			put("SERVER","服务器运维");
		}
	};
	
	public static final Map<String,String> ENGINEER_MAP=new LinkedHashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("FIRST","初检工程师");
			put("SECOND","二级维修工程师");
		}
	};
	
	public static final String FIRST="FIRST";
	
	public static final String SECOND="SECOND";
	
	public static final String ACTION_GET="get";
	
	public static final String ACTION_POST="post";
	
	public static final String CALL_NO_PRI_FIX="SM-";
	
	public static final String CALL_NO_BY_DOOR_PRI_FIX="S";
	
	public static final String NUMBER_0 = "0";
	public static final String NUMBER_00 = "00";
	public static final String NUMBER_000 = "000";
	public static final String NUMBER_0000 = "0000";
	
	
	public static final String NUMBER_SIGN_00 = "-1";
	public static final String NUMBER_SIGN_0 = "0";
	public static final String NUMBER_SIGN_1 = "1";
	public static final String NUMBER_SIGN_2 = "2";
	public static final String NUMBER_SIGN_3 = "3";
	public static final String NUMBER_SIGN_4 = "4";
	public static final String NUMBER_SIGN_5 = "5";
	public static final String NUMBER_SIGN_6 = "6";
	public static final String NUMBER_SIGN_7 = "7";
	public static final String NUMBER_SIGN_8 = "8";
	public static final String NUMBER_SIGN_9 = "9";
	
	public static final String NUMBER_SIGN__2 = "-2";
	public static final String NUMBER_SIGN__3 = "-3";
	public static final String NUMBER_SIGN__4 = "-4";
	public static final String NUMBER_SIGN__5 = "-5";
	public static final Double wac_per=0.35;
	
	public static final Short SHORT_SIGN_00 = Short.valueOf("-1");
	public static final Short SHORT_SIGN_0 = Short.valueOf("0");
	public static final Short SHORT_SIGN_1 = Short.valueOf("1");
	public static final Short SHORT_SIGN_2 = Short.valueOf("2");
	
	
	public static final String DOA_TYPE = "DOA";
	
	public static final String RETURN_TYPE = "RETURN";

	public static final String NOTRETURN_TYPE = "NOTRETURN";
	
	public static final Map<String,String> sourcesMap=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("RETURN","返件");
			put("DOA","DOA");
			put("PURCHASE","新采购");
		}
	};
	
	public static final Map<String,String> FAULTSTATUS_MAP=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","退钱");
			put("1","返件");
		}
	};
	
	public static final Map<String,String> SPEAKFORSTATUSMAP=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("NOTARRIVE","未到货");		
			put("ARRIVED","已到货");	
		}
	};
	
	public static final Map<String,String> TRANSPORT_MAP=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("0","待运输");		
			put("1","已发出");	
		}
	};
	
	public static final Map<String,String> RESULT_MAP=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("REPAIRED","修复");		
			put("NOT_REPAIRED","未修复");	
		}
	};
	
	public static final Map<String,String> ENGINEERSTATUSMAP=new HashMap<String,String>(){
		static final long serialVersionUID = 1L;
		{
			put("UNTESTED","待测试");		
			put("INTACT","完好");	
			put("FAULT","故障");	
		}
	};
	
	public static final Map<String,Menu> menuMap=new HashMap<String,Menu>(){
		static final long serialVersionUID = 1L;
		{
			put("SYSTEM",new Menu("系统管理","SYSTEM","#","SYSTEM"));
			put("PART",new Menu("备件管理","PART MANAGEMENT","#","PAT"));
			put("PURCHASE",new Menu("采购管理","PURCHASE MANAGEMENT","#","PURCHASE"));
			put("SERVICE",new Menu("服务管理","SERVICE MANAGEMENT","#","SERVICE"));
			put("TRANSPORT",new Menu("运输管理","TRANSPORT MANAGEMENT","#","TRANSPORT"));
			put("RETURN",new Menu("返件管理","RETURN PART MANAGEMENT","#","RETURN"));
			put("TESTING",new Menu("订购测试","TESTING ORDER","#","TESTING"));
			put("INVENTORY",new Menu("系统盘点","INVENTORY","#","INVENTORY"));
			put("STATISTICS",new Menu("统计查询","STATISTICAL REPORT","#","STATISTICS"));
			
		}
	};
	

}

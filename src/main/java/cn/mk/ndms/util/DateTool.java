package cn.mk.ndms.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;


/**
 * @author 作者 :范津
 * @version 创建时间：2014年3月20日 上午9:44:42 类说明
 */
public class DateTool {
	
	private static DateFormat shortFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static DateFormat yearDayFormat = new SimpleDateFormat("yyyyMMdd");
	private static DateFormat longFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static long dateDiffDay(String startTime, String endTime){
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long nd = 1000 * 24 * 60 * 60;
		long diff;
		long day=-1;
		try {
			diff = sd.parse(endTime).getTime() - sd.parse(startTime).getTime();
			day = diff / nd;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day;
	}

	public static String addDate(String startTime){
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sd.parse(startTime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		c.add(Calendar.MONTH, 3);
		return longFormat.format(c.getTime());
	}
	
	/** <b>Format : yyyy-MM-dd</b> */
	public static String shortFormat(Date date){
		return shortFormat.format(date);
	}
	
	public static String yearDayFormat(Date date){
		return yearDayFormat.format(date);
	}
	
	/** <b>Format : yyyy-MM-dd HH:mm:ss</b> */
	public static String longFormat(Date date){
		return longFormat.format(date);
	}
	/** <b>Format : yyyy-MM-dd HH:mm:ss</b> 
	 * @throws ParseException */
	public static Date longParse(String date) throws ParseException{
		return longFormat.parse(date);
	}

	public static boolean isBefore(String date) throws ParseException{
		Calendar calendar=Calendar.getInstance();
		Calendar now=Calendar.getInstance();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		now.setTime(sdf.parse(date));
		return calendar.before(now);
	}
	
	public static String yesterDay() {
		SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");
		Date beginDate = new Date();
		Calendar date = Calendar.getInstance();
		date.setTime(beginDate);
		date.set(Calendar.DATE, date.get(Calendar.DATE) - 1);
		return dft.format(date.getTime());
	}
	public static String sla(String status,String station,String startTime){
		String result="";
		if(StringUtils.isNotEmpty(startTime)){
			if(startTime.length()!=19){
				if(startTime.length()==16){
					startTime+=":00";
				}
			}
			if(!Constants.NUMBER_SIGN_1.equals(status)){
				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long nd = 1000 * 24 * 60 * 60;
				long diff;
				long day=-1;
				try {
					diff = Calendar.getInstance().getTime().getTime() - sd.parse(startTime).getTime();
					day = diff / nd;
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				if(station.indexOf("北京")!=-1){
					if(day==2){
						result="background-color: #FF7F24;";
					}
					if(day>=3){
						result="background-color: #FF3030;";
					}
				}else{
					if(day>=6){
						result="background-color: #FF7F24;";
					}
				}
			}
		}
		return result;
	}
	public static void main(String[] args) {
		System.out.println(DateTool.addDate("2015-03-02 00:00:00"));
	}
}

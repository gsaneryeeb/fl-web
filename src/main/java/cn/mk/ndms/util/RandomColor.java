package cn.mk.ndms.util;
 
import java.util.Random;
 
/**
 * @author:sll
 * @date:2014-4-8 下午4:29:51
 */
public class RandomColor {
 
    /**
     * 随机色
     * @return
     */
    public static String getRandomColor()
    {
        String red; 
        String green;
        String blue;
        Random random = new Random();  
        red = Integer.toHexString(random.nextInt(256)).toUpperCase();
        green = Integer.toHexString(random.nextInt(256)).toUpperCase(); 
        blue = Integer.toHexString(random.nextInt(256)).toUpperCase();  
        red = red.length()==1 ? "0" + red : red ;  
        green = green.length()==1 ? "0" + green : green ; 
        blue = blue.length()==1 ? "0" + blue : blue ;
        String color = "#"+red+green+blue;
        return color;
    }
}

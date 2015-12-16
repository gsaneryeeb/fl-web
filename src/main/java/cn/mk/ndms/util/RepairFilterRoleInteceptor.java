package cn.mk.ndms.util;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.mk.ndms.domain.User;

import com.springframework.base.util.FkConstant;
 
/**
 * @author:sll
 * @date:2014-4-8 下午4:29:51
 */
public class RepairFilterRoleInteceptor implements HandlerInterceptor {

	@SuppressWarnings("unused")
	private String mappingURL;//利用正则映射到需要拦截的路径    
    public void setMappingURL(String mappingURL) {    
            this.mappingURL = mappingURL;    
    }  
     
	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		Map<String,String> role=new HashMap<String,String>();
		User user=(User)request.getSession().getAttribute("USER");
		List<RoleVo> roleVoList=(List<RoleVo>)request.getSession().getAttribute("ROLEVO");
		if(roleVoList!=null && !roleVoList.isEmpty()){
			String id="";
			for(RoleVo userRole:roleVoList){
				if("scheduling".equals(userRole.getEname())){	//调度
					role.put(request.getParameter("filterItct"), user.getId());
					role.put("ORISNULL_status", "0");
				}else if("engineer".equals(userRole.getEname())){//工程师
					id+="2-";
					
				}else if("transportation_manager".equals(userRole.getEname())){//运输
					id+="0-3-4-5-";
				}
			}
			if(id.length()>1){
				role.put("OR_status", id.substring(0,id.length()-1));
			}
		}
		request.getSession().setAttribute(FkConstant.SEARCH_BY_ROLE, role);
        return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
 
   
}

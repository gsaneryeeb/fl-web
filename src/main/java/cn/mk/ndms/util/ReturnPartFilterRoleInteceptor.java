package cn.mk.ndms.util;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.springframework.base.util.FkConstant;
 
/**
 * @author:sll
 * @date:2014-4-8 下午4:29:51
 */
public class ReturnPartFilterRoleInteceptor implements HandlerInterceptor {

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
		List<RoleVo> roleVoList=(List<RoleVo>)request.getSession().getAttribute("ROLEVO");
		if(roleVoList!=null && !roleVoList.isEmpty()){
			String id="";
			for(RoleVo roleVo:roleVoList){
				id+=roleVo.getEname()+"-";
			}
			if(StringUtils.isNotEmpty(id)){
				role.put(request.getParameter("filterItct"), id.substring(0,id.length()-1));
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

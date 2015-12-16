package cn.mk.ndms.modules.sys.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Menu;
import cn.mk.ndms.util.Resources;

@Controller
@RequestMapping("sys")
public class SysController {

	@RequestMapping(value="toLogin")
	public String toLogin(Model model,HttpServletRequest request,HttpServletResponse response){
		if(request.getSession().getAttribute("USER")==null){
			String username = request.getParameter("username");
			model.addAttribute("username", username);
			// 如果是ajax请求响应头会有，x-requested-with；
			if (request.getHeader("x-requested-with") != null
					&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
				// 在响应头设置session状态
				response.setHeader("sessionstatus", "timeout");
				return "common/error";
			}
			return "sys/login";
		}else{
			return "redirect:/sys/main";
		}
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "sys/login";
	}

	@RequestMapping(value = "main")
	public String toMain(HttpServletRequest request) {
		return "main";
	}

	@RequestMapping(value = "toMain")
	public String main() {
		return "common/toMain";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "left")
	public String left(String model, HttpServletRequest request) {
		try {
			Menu menu = (Menu) Constants.menuMap.get(model);
			Map<String, String> keys = (Map<String, String>) request.getSession().getAttribute("KEY_RESOURCES");
			Map<String, Resources> roles = (Map<String, Resources>) request.getSession().getAttribute("TOP_RESOURCES");
			Resources role=roles.get(keys.get(model));
			Map<String,List<Resources>> downList=(Map<String,List<Resources>>)request.getSession().getAttribute("USER_RESOURCES");
			request.getSession().setAttribute("menu", menu);
			List<Resources> r=downList.get(role.getId());
			request.getSession().setAttribute("leftMenuList",r );
			return "redirect:/sys/main";
		} catch (Exception ex) {
			System.out.println("ex=" + ex.getMessage());
			return "redirect:/sys/logout";
		}
	}
}

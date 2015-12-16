package cn.mk.ndms.modules.sys.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.mk.ndms.util.Constants;

@Controller
@RequestMapping("sys/report")
public class ReportController
{
	@RequestMapping(value="toReport")
	public String toMain(ModelMap map,HttpServletRequest request){
		request.setAttribute(Constants.REL_REPORT, request.getParameter("url"));
		return "sys/report/reports";
	}
}


package cn.mk.ndms.modules.sys.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Evaluation;
import cn.mk.ndms.modules.sys.service.EvaluationService;
import cn.mk.ndms.util.Constants;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/evaluation")
public class EvaluationController extends GenericCRUDController<Evaluation, String>
{
	@Autowired
	private EvaluationService evaluationService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.EVALUATION_PAGENAME;
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Evaluation t){
		try{
			Evaluation tt=evaluationService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			evaluationService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


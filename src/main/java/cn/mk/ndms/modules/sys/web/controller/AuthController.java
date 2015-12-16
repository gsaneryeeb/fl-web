package cn.mk.ndms.modules.sys.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mk.ndms.domain.Auth;
import cn.mk.ndms.domain.AuthNmTsResource;
import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.modules.sys.service.AuthNmTsResourceService;
import cn.mk.ndms.modules.sys.service.AuthService;
import cn.mk.ndms.modules.sys.service.ResourceService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Tree;
import cn.mk.ndms.util.TreeOper;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/auth")
public class AuthController extends GenericCRUDController<Auth, String>
{
	@Autowired
	private AuthService authService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private AuthNmTsResourceService authNmTsResourceService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.AUTH_PAGENAME;
	}
	
	@RequestMapping(value="edit")
	public String edit(Model map,String id){
		map.addAttribute("t", authService.findOne(id));
		map.addAttribute("_fuc","修改");
		return "sys/auth/oper";
	}
	
	@RequestMapping(value="getResources")
	@ResponseBody
	public List<Tree> getResources(String id){
		if(id!=null && !"".equals(id.toString())){
			Auth auth=authService.getOne(id);
			if(auth.getAuthNmTsResource()!=null && !auth.getAuthNmTsResource().isEmpty()){
				Set<AuthNmTsResource> re=auth.getAuthNmTsResource();
				List<Resource> listvar= new ArrayList<Resource>();
				for(AuthNmTsResource r:re){
					listvar.add(r.getResource());
				}
				return TreeOper.treeValueSetResources(resourceService.findAllSupior(),listvar);
			}else{
				return TreeOper.treeValueSetResources(resourceService.findAllSupior());
			}
		}else{
			return TreeOper.treeValueSetResources(resourceService.findAllSupior());
		}
	}
	
	
	@RequestMapping(value="save")
	@ResponseBody
	public AjaxBean save(Auth auth,String ids){
		try{
			Auth au=authService.save(auth);
			if(StringUtils.isNotEmpty(ids)){
				Set<Resource> resources=new HashSet<Resource>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				resources.addAll(resourceService.findByIds(Arrays.asList(lIds)));
				
				for(Resource rs:resources){
					AuthNmTsResource rr=new AuthNmTsResource();
					rr.setResourceId(rs.getId());
					rr.setAuthId(au.getId());
					authNmTsResourceService.save(rr);
				}
			}
			
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
	
	@RequestMapping(value="update")
	@ResponseBody
	public AjaxBean update(Auth auth,String ids){
		try{
			Auth au=authService.update(auth);
			if(StringUtils.isNotEmpty(ids)){
				Set<Resource> resources=new HashSet<Resource>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				resources.addAll(resourceService.findByIds(Arrays.asList(lIds)));
				
				List<AuthNmTsResource> roleResourceList=authNmTsResourceService.findByAuthId(auth.getId());
				if(roleResourceList!=null && !roleResourceList.isEmpty()){
					authNmTsResourceService.deleteAll(roleResourceList);
				}
				for(Resource rs:resources){
					AuthNmTsResource rr=new AuthNmTsResource();
					rr.setResourceId(rs.getId());
					rr.setAuthId(au.getId());
					authNmTsResourceService.save(rr);
				}
			}else{
				List<AuthNmTsResource> roleResourceList=authNmTsResourceService.findByAuthId(auth.getId());
				if(roleResourceList!=null && !roleResourceList.isEmpty()){
					authNmTsResourceService.deleteAll(roleResourceList);
				}
			}
			
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
	
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Auth t){
		try{
			Auth tt=authService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			authService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
}


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
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.RoleNmTsAuth;
import cn.mk.ndms.modules.sys.service.AuthService;
import cn.mk.ndms.modules.sys.service.RoleNmTsAuthService;
import cn.mk.ndms.modules.sys.service.RoleService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.Tree;
import cn.mk.ndms.util.TreeOper;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/role")
public class RoleController extends GenericCRUDController<Role, String>
{
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	private RoleNmTsAuthService roleNmTsAuthService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.ROLE_PAGENAME;
	}
	
	@RequestMapping(value="edit")
	public String edit(Model map,String id){
		map.addAttribute("t", roleService.findOne(id));
		map.addAttribute("_fuc","修改");
		return "sys/role/oper";
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(Role t){
		try{
			Role tt=roleService.findOne(t.getId());
			if(t.getAvailability().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setAvailability(Constants.SHORT_SIGN_1);
			}else{
				tt.setAvailability(Constants.SHORT_SIGN_0);
			}
			roleService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="getRoles")
	@ResponseBody
	public List<Tree> getRoles(String id){
		if(id!=null && !"".equals(id.toString())){
			Role role=roleService.getOne(id);
			if(role.getRoleNmTsAuth()!=null && !role.getRoleNmTsAuth().isEmpty()){
				Set<RoleNmTsAuth> re=role.getRoleNmTsAuth();
				List<Auth> listvar= new ArrayList<Auth>();
				for(RoleNmTsAuth r:re){
					listvar.add(r.getAuth());
				}
				return TreeOper.treeValueSetRoles(authService.findAll(),listvar);
			}else{
				return TreeOper.treeValueSetRoles(authService.findAll());
			}
		}else{
			return TreeOper.treeValueSetRoles(authService.findAll());
		}
	}
	
	
	@RequestMapping(value="save")
	@ResponseBody
	public AjaxBean save(Role role,String ids){
		try{
			Role ro=roleService.save(role);
			if(StringUtils.isNotEmpty(ids)){
				Set<Auth> auths=new HashSet<Auth>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				auths.addAll(authService.findByIds(Arrays.asList(lIds)));
				
				for(Auth rs:auths){
					RoleNmTsAuth rr=new RoleNmTsAuth();
					rr.setAuthId(rs.getId());
					rr.setRoleId(ro.getId());
					roleNmTsAuthService.save(rr);
				}
			}
			
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
	
	@RequestMapping(value="update")
	@ResponseBody
	public AjaxBean update(Role role,String ids){
		try{
			Role ro=roleService.update(role);
			if(StringUtils.isNotEmpty(ids)){
				Set<Auth> auths=new HashSet<Auth>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				auths.addAll(authService.findByIds(Arrays.asList(lIds)));
				
				List<RoleNmTsAuth> roleNmTsAuthList=roleNmTsAuthService.findByRoleId(ro.getId());
				if(roleNmTsAuthList!=null && !roleNmTsAuthList.isEmpty()){
					roleNmTsAuthService.deleteAll(roleNmTsAuthList);
				}
				for(Auth rs:auths){
					RoleNmTsAuth rr=new RoleNmTsAuth();
					rr.setAuthId(rs.getId());
					rr.setRoleId(ro.getId());
					roleNmTsAuthService.save(rr);
				}
			}else{
				List<RoleNmTsAuth> roleNmTsAuthList=roleNmTsAuthService.findByRoleId(ro.getId());
				if(roleNmTsAuthList!=null && !roleNmTsAuthList.isEmpty()){
					roleNmTsAuthService.deleteAll(roleNmTsAuthList);
				}
			}
			
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
}


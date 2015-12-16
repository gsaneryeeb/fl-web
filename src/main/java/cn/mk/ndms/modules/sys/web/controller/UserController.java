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

import cn.mk.ndms.domain.Project;
import cn.mk.ndms.domain.ProjectRUser;
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.service.ProjectRUserService;
import cn.mk.ndms.modules.sys.service.ProjectService;
import cn.mk.ndms.modules.sys.service.RoleService;
import cn.mk.ndms.modules.sys.service.UserService;
import cn.mk.ndms.util.Constants;
import cn.mk.ndms.util.MD5Util;
import cn.mk.ndms.util.Tree;
import cn.mk.ndms.util.TreeOper;

import com.springframework.base.bean.AjaxBean;
import com.springframework.base.controller.GenericCRUDController;

@Controller
@RequestMapping("sys/user")
public class UserController extends GenericCRUDController<User, String>
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ProjectRUserService projectRUserService;
	
	@Autowired
	private RoleService roleService;
	
	@ModelAttribute(value = "pagename")
	public String setPageName()
	{
		return Constants.USER_PAGENAME;
	}
	
	@ModelAttribute(value = "roles")
	public List<Role> setRoles()
	{
		return roleService.findAllByStatus();
	}
	
	@RequestMapping(value="changeFlag")
	@ResponseBody
	public AjaxBean changeFlagAjax(User t){
		try{
			User tt=userService.findOne(t.getId());
			if(t.getFlag().toString().equals(Constants.NUMBER_SIGN_0)){
				tt.setFlag(Constants.SHORT_SIGN_1);
			}else{
				tt.setFlag(Constants.SHORT_SIGN_0);
			}
			userService.update(tt);
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
	}
	
	@RequestMapping(value="edit")
	public String edit(Model map,String id){
		User user=userService.getOne(id);
		user.setuPass(MD5Util.convertMD5(user.getuPass()));
		map.addAttribute("t",user);
		
		map.addAttribute("_fuc","修改");
		return "sys/user/oper";
	}
	
	@RequestMapping(value="getProjects")
	@ResponseBody
	public List<Tree> getProjects(String id){
		if(id!=null && !"".equals(id.toString())){
			User user=userService.getOne(id);
			if(user.getProjectRUser()!=null && !user.getProjectRUser().isEmpty()){
				Set<ProjectRUser> re=user.getProjectRUser();
				List<Project> listvar= new ArrayList<Project>();
				for(ProjectRUser r:re){
					listvar.add(r.getProject());
				}
				return TreeOper.treeValueSetProject(projectService.findAllByStatus(),listvar);
			}else{
				return TreeOper.treeValueSetProject(projectService.findAllByStatus());
			}
		}else{
			return TreeOper.treeValueSetProject(projectService.findAllByStatus());
		}
	}
	
	@RequestMapping(value="getRoles")
	@ResponseBody
	public List<Tree> getRoles(String id){
		if(id!=null && !"".equals(id.toString())){
			User user=userService.getOne(id);
			if(user.getRoleIdFk()!=null && user.getRoleIdFk().length()>0){
				String allRole=user.getRoleIdFk();
				String[] roles=allRole.split(",");
				List<Role> listvar= new ArrayList<Role>();
				for(String r:roles){
					listvar.add(roleService.findOne(r));
				}
				return TreeOper.treeValueSetRole(roleService.findAllByStatus(),listvar);
			}else{
				return TreeOper.treeValueSetRole(roleService.findAllByStatus());
			}
		}else{
			return TreeOper.treeValueSetRole(roleService.findAllByStatus());
		}
	}
	
	@RequestMapping(value="save")
	@ResponseBody
	public AjaxBean save(User auth,String ids,String roleIdFk){
		try{
		auth.setuPass(MD5Util.convertMD5(auth.getuPass()));
			User au=userService.save(auth);
			if(StringUtils.isNotEmpty(ids)){
				Set<Project> resources=new HashSet<Project>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				resources.addAll(projectService.findByIds(Arrays.asList(lIds)));
				
				for(Project rs:resources){
					ProjectRUser rr=new ProjectRUser();
					rr.setProjectIdFk(rs.getId());
					rr.setUserIdFk(au.getId());
					projectRUserService.save(rr);
				}
			}
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
	
	@RequestMapping(value="update")
	@ResponseBody
	public AjaxBean update(User user,String ids){
		try{
			user.setuPass(MD5Util.convertMD5(user.getuPass()));
			User au=userService.update(user);
			if(StringUtils.isNotEmpty(ids)){
				Set<Project> resources=new HashSet<Project>();
				String[] sIds=ids.split(",");
				String[] lIds=(String[])ConvertUtils.convert(sIds, String.class);
				resources.addAll(projectService.findByIds(Arrays.asList(lIds)));
				
				List<ProjectRUser> roleResourceList=projectRUserService.findByUserId(user.getId());
				if(roleResourceList!=null && !roleResourceList.isEmpty()){
					projectRUserService.deleteAll(roleResourceList);
				}
				for(Project rs:resources){
					ProjectRUser rr=new ProjectRUser();
					rr.setProjectIdFk(rs.getId());
					rr.setUserIdFk(au.getId());
					projectRUserService.save(rr);
				}
			}else{
				List<ProjectRUser> projectUserList=projectRUserService.findByUserId(user.getId());
				if(projectUserList!=null && !projectUserList.isEmpty()){
					projectRUserService.deleteAll(projectUserList);
				}
			}
			
			return AjaxBean.getInstance("success");
		}catch(Exception ex){
			return AjaxBean.getInstance("error",ex.getMessage());
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


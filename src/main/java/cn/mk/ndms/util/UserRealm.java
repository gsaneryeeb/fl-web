package cn.mk.ndms.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import cn.mk.ndms.domain.Project;
import cn.mk.ndms.domain.ProjectRUser;
import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.domain.Role;
import cn.mk.ndms.domain.User;
import cn.mk.ndms.modules.sys.repository.RoleRepository;
import cn.mk.ndms.modules.sys.service.UserService;



/**
 * @author 作者 :孙丽丽
 * @version 创建时间：Feb 12,2014 4:43:06 PM 类说明
 */
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;	
	
	@Autowired
	private RoleRepository roleRepository;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// TODO Auto-generated method stub
		Subject currentUser = SecurityUtils.getSubject(); 
		SimpleAuthorizationInfo authorizationInfoSession=(SimpleAuthorizationInfo)currentUser.getSession().getAttribute("APPLICATION_AUTHORIZATION");
		if(authorizationInfoSession==null){
			String username = (String) principals.getPrimaryPrincipal();
			Map<String,Resource> rIds = userService.findResourceByUserName(username);
			SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
			if(rIds!=null && rIds.size()>0){
				Set<String> sroles=new HashSet<String>();
				Map<String,List<Resources>> mapResources=new LinkedHashMap<String,List<Resources>>();
				Map<String,Resources> topMapResources=new LinkedHashMap<String,Resources>();
				Map<String,String> topMapKey=new LinkedHashMap<String,String>();
				for(Resource r:rIds.values()){
					if(StringUtils.isEmpty(r.getSuperior())){
						topMapResources.put(r.getId(), new Resources(r.getId(),r.getName(),r.getDes(),r.getFlag(),r.getSort(),r.getSuperior(),r.getUrl()));	
						mapResources.put(r.getId(), mapResources.get(r.getId()));
						topMapKey.put(r.getUrl(), r.getId());
					}else{
						List<Resources> _downList=mapResources.get(r.getSuperior());
						if(_downList==null || _downList.size()==0){
							_downList=new ArrayList<Resources>();
						}
						_downList.add(new Resources(r.getId(),r.getName(),r.getDes(),r.getFlag(),r.getSort(),r.getSuperior(),r.getUrl()));
						mapResources.put(r.getSuperior(), _downList);
					}
					sroles.add(r.getName());
				}
				currentUser.getSession().setAttribute("USER_RESOURCES", mapResources);
				currentUser.getSession().setAttribute("TOP_RESOURCES", topMapResources);
				currentUser.getSession().setAttribute("KEY_RESOURCES", topMapKey);
				authorizationInfo.setRoles(sroles);
				currentUser.getSession().setAttribute("APPLICATION_ROLE", sroles);
				currentUser.getSession().setAttribute("APPLICATION_AUTHORIZATION", authorizationInfo);
				return authorizationInfo;
			}else{
				authorizationInfo.setRoles(null);
			}
		}else{
			return authorizationInfoSession;
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		
		String username = token.getUsername();
		if (username != null && !"".equals(username)) {
			String password=String.valueOf(token.getPassword());
			User u = userService.findByUserNameAndUPass(username, MD5Util.convertMD5(password));
			Map<String,List<ProjectVo>> projectMap=new HashMap<String,List<ProjectVo>>();
			Set<ProjectRUser> pRus=u.getProjectRUser();
			if(pRus!=null && pRus.size()>0){
				for(ProjectRUser pRu:pRus){
					Project p=pRu.getProject();
					List<ProjectVo> _pList=projectMap.get(p.getTypeId());
					if(_pList==null || _pList.isEmpty()){
						_pList=new ArrayList<ProjectVo>();
					}
					ProjectVo vo=new ProjectVo();
					vo.setCname(p.getCname());
					vo.setFlag(p.getFlag());
					vo.setNo(p.getNo());
					vo.setType(p.getType());
					vo.setTypeId(p.getTypeId());
					vo.setId(p.getId());
					_pList.add(vo);
					projectMap.put(p.getTypeId(), _pList);
				}
			}
			u.setuPass(MD5Util.convertMD5(u.getuPass()));
			if (u != null) {
				AuthenticationInfo info=new SimpleAuthenticationInfo(u.getUserName(),u.getuPass(), getName());
				Subject currentUser = SecurityUtils.getSubject(); 
				currentUser.getSession().setAttribute("USER", u);
				
				
				String roleIds=u.getRoleIdFk();
				String[] strRoleIds=null;
				if(roleIds!=null && roleIds.length()>0){
					strRoleIds=roleIds.split(",");
				}
				List<RoleVo> roleVoList=new ArrayList<RoleVo>();
				for(String r:strRoleIds){
					Role role=roleRepository.findOne(r);
					RoleVo vo=new RoleVo(role.getId(),role.getAvailability(),role.getCname(),role.getEname());
					roleVoList.add(vo);
				}
				currentUser.getSession().setAttribute("ROLEVO", roleVoList);
				currentUser.getSession().setAttribute("USER_PROJECT", projectMap);
				return info;
			}
		}
		return null;
	}
}

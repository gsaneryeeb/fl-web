package cn.mk.ndms.util;

import java.util.ArrayList;
import java.util.List;

import cn.mk.ndms.domain.Auth;
import cn.mk.ndms.domain.Project;
import cn.mk.ndms.domain.Resource;
import cn.mk.ndms.domain.Role;

/**
 * @author 作者 :路普
 * @version 创建时间：2014年3月18日 上午10:01:01 类说明
 */
public class TreeOper {

	

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Tree> treeValueSetResources(List<Resource> listNodes) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null
						&& listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					if (listNodes.get(i).getResourceses() != null
							&& !listNodes.get(i).getResourceses().isEmpty()) {
						List<Resource> listvar = new ArrayList(listNodes
								.get(i).getResourceses());
						treeNode.setChildren(treeValueSetResources(listvar));
					} else {
						treeNode.setChildren(null);
					}

					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getName());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Tree> treeValueSetResources(List<Resource> listNodes,
			List<Resource> reSet) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		List<Resource> rList = new ArrayList(reSet);
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null
						&& listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					if (listNodes.get(i).getResourceses() != null
							&& !listNodes.get(i).getResourceses().isEmpty()) {
						List<Resource> listvar = new ArrayList(listNodes
								.get(i).getResourceses());
						treeNode.setChildren(treeValueSetResources(listvar,
								reSet));
					} else {
						treeNode.setChildren(null);
					}
					for (Resource r : rList) {
						if (r.getId().toString()
								.equals(listNodes.get(i).getId().toString())) {
							treeNode.setChecked(true);
							break;
						}
					}
					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getName());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}

	
	
/////////////////////////////////////////////////////Role
	public static List<Tree> treeValueSetRoles(List<Auth> listNodes) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null && listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);
					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getName());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Tree> treeValueSetRoles(List<Auth> listNodes,
			List<Auth> reSet) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		List<Auth> rList = new ArrayList(reSet);
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null && listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);
					
					for (Auth r : rList) {
						if (r.getId().toString().equals(listNodes.get(i).getId().toString())) {
							treeNode.setChecked(true);
							break;
						}
					}
					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getName());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}
	
/////////////////////////////////////////////////////////////////////////////////////////project
	public static List<Tree> treeValueSetProject(List<Project> listNodes) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null && listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);

					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getCname());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Tree> treeValueSetProject(List<Project> listNodes,
			List<Project> reSet) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		List<Project> rList = new ArrayList(reSet);
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getFlag() != null
						&& listNodes.get(i).getFlag().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);
					for (Project r : rList) {
						if (r.getId().toString().equals(listNodes.get(i).getId().toString())) {
							treeNode.setChecked(true);
							break;
						}
					}
					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getCname());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}
	
	
	//添加role
	public static List<Tree> treeValueSetRole(List<Role> listNodes) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getAvailability() != null && listNodes.get(i).getAvailability().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);

					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getCname());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static List<Tree> treeValueSetRole(List<Role> listNodes,
			List<Role> reSet) {
		List<Tree> treeTempList = new ArrayList<Tree>();
		List<Role> rList = new ArrayList(reSet);
		if (listNodes != null && !listNodes.isEmpty()) {
			for (int i = 0; i < listNodes.size(); i++) {
				if (listNodes.get(i).getAvailability() != null
						&& listNodes.get(i).getAvailability().intValue() == 1) {
					Tree treeNode = new Tree();
					treeNode.setChildren(null);
					for (Role r : rList) {
						if (r.getId().toString().equals(listNodes.get(i).getId().toString())) {
							treeNode.setChecked(true);
							break;
						}
					}
					treeNode.setId(listNodes.get(i).getId().toString());
					treeNode.setDataid(listNodes.get(i).getId().toString());
					treeNode.setName(listNodes.get(i).getCname());
					treeNode.setOpen(true);
					treeNode.setFlagClass(true);
					treeTempList.add(treeNode);
				}
			}
		}
		return treeTempList;
	}
}

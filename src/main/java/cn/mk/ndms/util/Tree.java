package cn.mk.ndms.util;

import java.util.List;

/**
 * 树
 * 
 * @author fan jin
 * 
 * @date:2012-11-27 下午4:23:56
 * @version :
 */
public class Tree {
	
	private String id;				
	private String name;			
	private List<Tree> nodes;	
	private boolean checked;		
	private boolean isHidden;		
	private boolean flagClass;         
	private String dataid;				
	private boolean open;
	private List<Tree> children;
	private boolean IsParent;
	private String pid;
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	private boolean drag;
	private boolean dropRoot;		//不想成为根节点
	private boolean nocheck;
	private boolean chkDisabled;


	public boolean isDrag() {
		return drag;
	}

	public void setDrag(boolean drag) {
		this.drag = drag;
	}

	public boolean isIsParent() {
		return IsParent;
	}

	public void setIsParent(boolean isParent) {
		IsParent = isParent;
	}

	public List<Tree> getChildren() {
		return children;
	}

	public void setChildren(List<Tree> children) {
		this.children = children;
	}


	public String toString(){
		return "id="+id+",name="+name+",nodes="+nodes+",checked="+checked;
	}
	
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isHidden() {
		return isHidden;
	}

	public void setHidden(boolean isHidden) {
		this.isHidden = isHidden;
	}

	public List<Tree> getNodes() {
		return nodes;
	}

	public void setNodes(List<Tree> nodes) {
		this.nodes = nodes;
	}

	public boolean isFlagClass() {
		return flagClass;
	}

	public void setFlagClass(boolean flagClass) {
		this.flagClass = flagClass;
	}

	public String getDataid() {
		return dataid;
	}

	public void setDataid(String dataid) {
		this.dataid = dataid;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isDropRoot() {
		return dropRoot;
	}

	public void setDropRoot(boolean dropRoot) {
		this.dropRoot = dropRoot;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}

	public boolean isChkDisabled() {
		return chkDisabled;
	}

	public void setChkDisabled(boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}

}

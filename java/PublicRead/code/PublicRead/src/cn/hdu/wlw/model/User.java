package cn.hdu.wlw.model;

import java.util.Date;

import cn.hdu.wlw.console.util.Base64Util;
import cn.hdu.wlw.console.util.FileUtil;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class User extends Entity implements java.io.Serializable {
	
	// Fields    
	private String account;
	private String password;
	private String name;
	private String icon;

	private Date createTime;
	
	// Constructors
	
	/** default constructor */
    public User() {
    }

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 储存图片
	 * @param image base64编码
	 */
	public void setImageIcon(String image){
		String fileName = "/upload/image/" + new Date().getTime() + ".jpg";
		if(FileUtil.write(Base64Util.decode(image), fileName)){
			this.icon = fileName;
		}
	}
	
	/**
	 * 获取图片的base64
	 * @return 图片的base64
	 */
	public String getIconImage(){
		return Base64Util.encode(FileUtil.read(icon));
	}

	@Override
	public String toString() {
		return "User [account=" + account + ", password=" + password + ", name=" + name + ", icon=" + icon 
				+ ", createTime=" + createTime + ", imageIcon=" + getIconImage() + "]";
	}
	
	public JSONObject toJSON() {
		JSONObject obj = JSONObject.fromObject(this);
		obj.remove("password");
		obj.remove("icon");
		return obj;
	}

    
}

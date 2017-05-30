package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class UserTag extends Entity implements java.io.Serializable {
	
	// Fields    
	private User user;
	private Tag tag;
	private Date createTime;
	
	// Constructors
	
	/** default constructor */
    public UserTag() {
    }

	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Tag getTag() {
		return tag;
	}


	public void setTag(Tag tag) {
		this.tag = tag;
	}

}

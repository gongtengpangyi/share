package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class FlockUser extends Entity implements java.io.Serializable {

	// Fields
	private User user;
	private Integer type;
	private String nickName;
	private Flock flock;
	private Date createTime;

	// Constructors

	/** default constructor */
	public FlockUser() {
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Flock getFlock() {
		return flock;
	}

	public void setFlock(Flock flock) {
		this.flock = flock;
	}

}

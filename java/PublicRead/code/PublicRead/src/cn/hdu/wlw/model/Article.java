package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class Article extends Entity implements java.io.Serializable {

	// Fields
	private String title;
	private Date createTime;
	private String content;
	private User user;
	private Integer type;

	// Constructors

	/** default constructor */
	public Article() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Override
	public String toString() {
		return "Article [title=" + title + ", createTime=" + createTime + ", content=" + content + "]";
	}

}

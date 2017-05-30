package cn.hdu.wlw.model;

import java.util.Date;

public class UserRead extends Entity {

	private static final long serialVersionUID = 1L;

	private User user;
	private Article article;
	private Date readTime;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Date getReadTime() {
		return readTime;
	}

	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}

}

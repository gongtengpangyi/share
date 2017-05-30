package cn.hdu.wlw.model;

import java.util.Date;

public class UserFind extends Entity {

	private static final long serialVersionUID = 1L;

	private User user;
	private Article article;
	private String key;
	private Date findTime;
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

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

	public Date getFindTime() {
		return findTime;
	}

	public void setFindTime(Date findTime) {
		this.findTime = findTime;
	}

}

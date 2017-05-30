package cn.hdu.wlw.model;

import java.util.Date;

public class UserLikeArticle extends Entity {

	private static final long serialVersionUID = 1L;

	private User user;
	private Article article;
	private Date likeTime;

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

	public Date getLikeTime() {
		return likeTime;
	}

	public void setLikeTime(Date likeTime) {
		this.likeTime = likeTime;
	}

	

}

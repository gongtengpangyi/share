package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class ArticleTag extends Entity implements java.io.Serializable {
	
	// Fields    
	private Article article;
	private Tag tag;
	private Date createTime;
	
	// Constructors
	
	/** default constructor */
    public ArticleTag() {
    }

	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Article getArticle() {
		return article;
	}


	public void setArticle(Article article) {
		this.article = article;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

}

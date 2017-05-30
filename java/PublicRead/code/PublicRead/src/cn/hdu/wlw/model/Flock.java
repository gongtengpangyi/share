package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class Flock extends Entity implements java.io.Serializable {

	// Fields
	private String name;
	private Tag tag;
	private Date createTime;

	// Constructors

	/** default constructor */
	public Flock() {
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

}

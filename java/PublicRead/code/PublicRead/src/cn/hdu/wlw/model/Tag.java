package cn.hdu.wlw.model;

import java.util.Date;

@SuppressWarnings("serial")
public class Tag extends Entity implements java.io.Serializable {
	
	// Fields    
	private String name;
	private Date createTime;
	
	// Constructors
	
	/** default constructor */
    public Tag() {
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	

}

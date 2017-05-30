package cn.hdu.wlw.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Entity implements Serializable {

	
	public final static Long STATE_DELETE = 0L;
	public final static Long STATE_ENABLE = 1L;
	public final static Long STATE_DISABLE = 2L;
	
	
	protected Long id;
	protected Long state = STATE_ENABLE;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getState() {
		return state;
	}

	public void setState(Long state) {
		this.state = state;
	}
	
}

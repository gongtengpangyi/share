package cn.hdu.wlw.model;

@SuppressWarnings("serial")
public class UserCare extends Entity implements java.io.Serializable {
	
	// Fields    
	private User user;
	private User toUser;
	
	// Constructors
	
	/** default constructor */
    public UserCare() {
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	
}

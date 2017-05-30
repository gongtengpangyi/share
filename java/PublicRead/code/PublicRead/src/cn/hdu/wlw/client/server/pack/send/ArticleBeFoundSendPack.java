package cn.hdu.wlw.client.server.pack.send;

import cn.hdu.wlw.client.server.pack.SendPack;
import cn.hdu.wlw.model.User;

public class ArticleBeFoundSendPack extends SendPack {
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String sendString() {		
		return super.sendString() +";userId:" + getUser().getId() + ";userName:" + getUser().getName();
	}
	

}

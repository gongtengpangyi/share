package cn.hdu.wlw.client.server.pack;

import java.util.Map;

import cn.hdu.wlw.client.server.BasePack;
import cn.hdu.wlw.client.server.ClientThread;

public abstract class RecvPack extends BasePack {
	private String accessToken;
	private Long userId;
	private String type;
	
	/**
	 * 收到对应消息的处理
	 * @param socket 发送方的socket
	 */
	public abstract void parse(ClientThread clientThread);
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public RecvPack instance(Map<String, String> map){
		this.setCode(map.get("code"));
		this.setAccessToken(map.get("accessToken"));
		this.setType(map.get("type"));
		return this;
	}
}

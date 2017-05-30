package cn.hdu.wlw.client.server.pack.recv;

import java.util.Map;

import cn.hdu.wlw.client.server.ClientThread;
import cn.hdu.wlw.client.server.pack.RecvPack;
import cn.hdu.wlw.client.server.pack.SendPack;
import cn.hdu.wlw.client.server.pack.send.HertSendPack;

public class HertRecvPack extends RecvPack {
	HertSendPack sendPack = (HertSendPack) SendPack.newInstance("hert");
	private Boolean isInit;

	@Override
	public void parse(ClientThread clientThread) {
		Long userId = clientThread.getUserId(getAccessToken());
		if(isInit) {			
			clientThread.saveInMap(userId);
		}
		clientThread.sendPack(userId, sendPack);
	}

	@Override
	public HertRecvPack instance(Map<String, String> map) {
		super.instance(map);
		this.isInit = Boolean.valueOf(map.get("init"));
		return this;
	}
	

}

package cn.hdu.wlw.client.server.pack.recv;

import java.util.Map;

import cn.hdu.wlw.client.server.ClientThread;
import cn.hdu.wlw.client.server.pack.RecvPack;

public class SuccessRecvPack extends RecvPack {
	private Long packId;
	
	public Long getPackId() {
		return packId;
	}

	public void setPackId(Long packId) {
		this.packId = packId;
	}

	@Override
	public void parse(ClientThread clientThread) {
		clientThread.getPackUtil().sendSuccess(packId);
	}

	@Override
	public RecvPack instance(Map<String, String> map) {
		super.instance(map);
		this.setPackId(Long.valueOf(map.get("packId")));
		return this;
	}
	

}

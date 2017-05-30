package cn.hdu.wlw.client.server.pack.send;

import java.util.Map;

import cn.hdu.wlw.client.server.pack.SendPack;

// 用于回复客户端请求成功与否的消息
public class BackSendPack extends SendPack{
	private String result;
	private String backType;
	
	@Override
	public SendPack instance(Map<String, String> map) {
		super.instance(map);
		this.result = map.get("result");
		this.backType = map.get("backType");
		return this;
	}

	@Override
	public String sendString() {
		return "result:" + result + ";" + "backType:" + backType + ";" + super.sendString();
	}
	

}

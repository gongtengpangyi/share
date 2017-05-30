package cn.hdu.wlw.client.server.pack;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.hdu.wlw.client.server.BasePack;

public abstract class SendPack extends BasePack {
	private SimpleDateFormat format = new SimpleDateFormat(CODE_FORMAT);

	/**
	 * 生成发送字符串
	 * @return 发送字符串
	 */
	public String sendString() {
		Pattern p = Pattern.compile("send\\.(.*?)SendPack");
        Matcher m = p.matcher(getClass().getName());
        m.find();
        return "code:" + getCode() + ";type:" + m.group(1).toLowerCase();
	}

	@Override
	public SendPack instance(Map<String, String> map) {
		this.setCode(format.format(new Date()));
		return this;
	}

	public static SendPack newInstance(String type) {
		String data = "send:true;type:" + type;
		return (SendPack) BasePack.newInstance(data);
	}
	
}

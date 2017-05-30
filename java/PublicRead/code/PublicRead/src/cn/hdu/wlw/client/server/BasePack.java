package cn.hdu.wlw.client.server;

import java.util.HashMap;
import java.util.Map;

public abstract class BasePack {
	public static final String CODE_FORMAT = "YYYYMMddHHmmssSSS";
	private String code;

	/**
	 * 初始化
	 * @param map 参数键值对
	 * @return
	 */
	public abstract BasePack instance(Map<String, String> map);
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	/**
	 * 初始化,给外部开放的初始化接口
	 * @param data 字符流
	 * @return
	 */
	public static BasePack newInstance(String data) {
		Map<String, String> parms = analyze(data);
		String classUrl = "cn.hdu.wlw.client.server.pack";
		if(parms.get("send")!=null && parms.get("send").equals("true")) {
			classUrl = classUrl + ".send." + parms.get("type").substring(0, 1).toUpperCase() 
					+ parms.get("type").substring(1) + "SendPack";
		} else {
			classUrl = classUrl + ".recv." + parms.get("type").substring(0, 1).toUpperCase() 
					+ parms.get("type").substring(1) + "RecvPack";
		}
		try {
			BasePack pack = (BasePack) Class.forName(classUrl).newInstance();
			return pack.instance(parms);
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 解析字符流
	 * @param data 字符流
	 * @return 键值对
	 */
	public static Map<String, String> analyze(String data) {
		String[] strs = data.split(";");
		Map<String, String> parms = new HashMap<String, String>();
		for(String str : strs) {
			String[] keyVal = str.split(":");
			if(keyVal.length == 2) {
				parms.put(keyVal[0], keyVal[1]);
			}
		}
		return parms;
	}
}

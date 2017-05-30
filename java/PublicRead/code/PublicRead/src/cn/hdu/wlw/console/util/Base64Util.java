package cn.hdu.wlw.console.util;

public class Base64Util {
	/**
	 * base64解码
	 * @param str base64字符串
	 * @return 字节流
	 */
	public static byte[] decode(String str) {
		byte[] bt = null;
		try {
			sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
			bt = decoder.decodeBuffer(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bt;
	}

	/**
	 * base64编码
	 * @param b 字节流
	 * @return base64字符串
	 */
	public static String encode(byte[] b) {
		if (b == null) {
			return null;
		}
		return (new sun.misc.BASE64Encoder()).encode(b);
	}

}

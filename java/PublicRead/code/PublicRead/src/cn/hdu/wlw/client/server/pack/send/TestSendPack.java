package cn.hdu.wlw.client.server.pack.send;

import java.util.Map;

import org.junit.Test;

import cn.hdu.wlw.client.server.pack.SendPack;


public class TestSendPack extends SendPack{
	private String testParam;
	
	public String getTestParam() {
		return testParam;
	}

	public void setTestParam(String testParam) {
		this.testParam = testParam;
	}

	@Override
	public SendPack instance(Map<String, String> map) {
		super.instance(map);
		this.setTestParam(map.get("param"));
		return this;
	}
	
	@Override
	public String toString() {
		return "TestPack [testParam=" + testParam + "; code= " + getCode() + "]";
	}

	@Override
	public String sendString() {
		return "testParam:" + testParam + ";" + super.sendString();
	}
	
	@Test
	public void test(){
//		TestSendPack pack = (TestSendPack) SendPack.newInstance("test");
//		pack.setTestParam("xxxx");
		HertSendPack pack = (HertSendPack) SendPack.newInstance("hert");
		System.out.println(pack.sendString());
	}

}

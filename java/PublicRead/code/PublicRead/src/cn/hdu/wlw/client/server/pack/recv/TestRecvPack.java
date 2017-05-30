package cn.hdu.wlw.client.server.pack.recv;

import java.util.Map;

import org.junit.Test;

import cn.hdu.wlw.client.server.BasePack;
import cn.hdu.wlw.client.server.ClientThread;
import cn.hdu.wlw.client.server.pack.RecvPack;


public class TestRecvPack extends RecvPack{
	private String testParam;
	
	public String getTestParam() {
		return testParam;
	}

	public void setTestParam(String testParam) {
		this.testParam = testParam;
	}

	@Override
	public TestRecvPack instance(Map<String, String> map) {
		super.instance(map);
		this.setTestParam(map.get("param"));
		return this;
	}
	
	@Override
	public String toString() {
		return "TestPack [testParam=" + testParam + "; code= " + getCode() +"; accessToken= " + getAccessToken() + "]";
	}
	
	@Test
	public void test(){
		TestRecvPack pack = (TestRecvPack) BasePack.newInstance("accessToken:shja;code:123245434;type:test;param:1111");
		System.out.println(pack.toString());
	}

	@Override
	public void parse(ClientThread cthread) {
		// TODO Auto-generated method stub
		
	}


}

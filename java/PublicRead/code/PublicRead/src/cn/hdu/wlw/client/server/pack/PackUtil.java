package cn.hdu.wlw.client.server.pack;

import java.util.Date;
import java.util.List;

import cn.hdu.wlw.client.server.ClientThread;
import cn.hdu.wlw.console.biz.PackBiz;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.model.Pack;

public class PackUtil {
	private PackBiz packBiz;
	private UserBiz userBiz;
	
	public void setPackBiz(PackBiz packBiz) {
		this.packBiz = packBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	/**
	 * 记录发送消息
	 * @param sendPack 发送消息
	 * @param toUserId 接受者id
	 * @return 记录id
	 */
	public Long memorySend(SendPack sendPack, Long toUserId) {
		Pack hisPack = new Pack();
		hisPack.setUser(userBiz.findById(toUserId));
		hisPack.setCreateTime(new Date());
		hisPack.setContent(sendPack.sendString());
		hisPack.setType(1);
		hisPack.setFlag(0);
		packBiz.save(hisPack);
		return hisPack.getId();
	}
	
	/**
	 * 记录接收消息
	 * @param data 接收的消息
	 * @param fromUserId 发送者id
	 */
	public void memoryRecv(String data, Long fromUserId) {
		Pack hisPack = new Pack();
		hisPack.setUser(userBiz.findById(fromUserId));
		hisPack.setCreateTime(new Date());
		hisPack.setContent(data);
		hisPack.setType(0);
		packBiz.save(hisPack);
	}
	
	/**
	 * 发送用户未被接收成功的消息
	 * @param toUserId 接收者id
	 */
	public void sendNotSendPack(Long toUserId, ClientThread clientThread) {
		List<Pack> packs = packBiz.findNotSuccess(toUserId);
		clientThread.sendHisPacks(toUserId, packs);
	}
	
	/**
	 * 发送成功之后记录
	 * @param packId 记录的id
	 */
	public void sendSuccess(Long packId) {
		Pack pack = packBiz.findById(packId);
		pack.setFlag(1);
		packBiz.update(pack);
	}
}

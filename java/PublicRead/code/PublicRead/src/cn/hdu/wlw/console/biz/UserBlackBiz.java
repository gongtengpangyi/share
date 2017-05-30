package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.UserBlack;

public interface UserBlackBiz extends BaseBiz<UserBlack> {
	/**
	 * 判断是否是黑名单内
	 * @param userId 用户id
	 * @param toUserId 对方id
	 * @return 黑名单用户
	 */
	public UserBlack isBlack(Long userId, Long toUserId);
	
	/**
	 * 查找黑名单
	 * @param userId 用户id
	 * @return 名单列表
	 */
	public List<UserBlack> getBlackList(Long userId);
}

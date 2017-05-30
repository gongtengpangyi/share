package cn.hdu.wlw.console.biz;

import cn.hdu.wlw.model.User;

public interface UserBiz extends BaseBiz<User> {
	/**
	 * 根据账号查找
	 * @param account 账号
	 * @return 查找到的用户
	 */
	public User findByAccount(String account);
}

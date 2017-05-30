package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.UserRead;

public interface UserReadBiz extends BaseBiz<UserRead> {
	/**
	 * 查找用户读文章
	 * @param userId 用户Id
	 * @param pageIndex 页码
	 * @return 列表
	 */
	public List<UserRead> findByUserId(Long userId, int pageIndex);
	
	/**
	 * 查找好友读文章
	 * @param userId 用户Id
	 * @param pageIndex 页码
	 * @return 列表
	 */
	public List<UserRead> findByCareUserId(Long userId, int pageIndex);
}

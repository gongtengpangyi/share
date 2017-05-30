package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.UserCare;

public interface UserCareBiz extends BaseBiz<UserCare> {
	/**
	 * 判断是否为关注的
	 * @param userId 用户id
	 * @param toUserId 对方id
	 * @return 关注实体
	 */
	public UserCare isCare(Long userId, Long toUserId);
	
	/**
	 * 查找白名单
	 * @param userId 用户id
	 * @return 名单列表
	 */
	public List<UserCare> getCareList(Long userId);
	
	/**
	 * 查找粉丝
	 * @param userId 用户id
	 * @return 名单列表
	 */
	public List<UserCare> getBeCaredList(Long userId);
	
	/**
	 * 我关注的数量
	 * @param userId 用户id
	 * @return 
	 */
	public int countCare(Long userId);
	
	/**
	 * 关注我的数量
	 * @param userId 用户id
	 * @return 
	 */
	public int countBeCared(Long userId);
}

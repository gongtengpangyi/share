package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.UserTag;

public interface UserTagBiz extends BaseBiz<UserTag> {
	/**
	 * 根据标签查找用户
	 * @param tagId 标签id
	 * @return 用户标签关系列表
	 */
	public List<UserTag> findByTagId(Long tagId);
	
	/**
	 * 根据用户查找标签
	 * @param userId 用户id
	 * @return 用户标签关系列表
	 */
	public List<UserTag> findByUserId(Long userId);
	
	/**
	 * 根据用户和标签查找
	 * @param userId 用户id
	 * @param tagId 标签id
	 * @return 结果
	 */
	public UserTag findByUserIdAndTagId(Long userId, Long tagId);
}

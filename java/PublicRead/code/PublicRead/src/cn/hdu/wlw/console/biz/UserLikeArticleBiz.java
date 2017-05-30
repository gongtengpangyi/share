package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.UserLikeArticle;

public interface UserLikeArticleBiz extends BaseBiz<UserLikeArticle> {
	/**
	 * 查找用户点赞文章
	 * @param userId 用户Id
	 * @param pageIndex 页码
	 * @return 列表
	 */
	public List<UserLikeArticle> findByUserId(Long userId, int pageIndex);
	
	/**
	 * 查找指定用户是否点赞过这篇文章
	 * @param userId 用户id
	 * @param articleId 文章id
	 * @return 用户文章点赞关系对象
	 */
	public UserLikeArticle findByUserIdAndArticleId(Long userId, Long articleId);

	
	/**
	 * 查找好友读文章
	 * @param userId 用户Id
	 * @param pageIndex 页码
	 * @return 列表
	 */
	public List<UserLikeArticle> findByCareUserId(Long userId, int pageIndex);
}

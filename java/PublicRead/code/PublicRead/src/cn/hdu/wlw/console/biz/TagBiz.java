package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.Tag;

public interface TagBiz extends BaseBiz<Tag> {
	/**
	 * 分页搜索
	 * @param pageIndex 页码
	 * @return 标签集合
	 */
	public List<Tag> findListPager(int pageIndex);
	
	/**
	 * 根据标签名搜索
	 * @param tagName 标签名
	 * @return 标签对象
	 */
	public Tag findByName(String tagName);
}

package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.Pack;

public interface PackBiz extends BaseBiz<Pack> {
	public List<Pack> findNotSuccess(Long userId);
}

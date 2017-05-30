package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.FlockUser;

public interface FlockUserBiz extends BaseBiz<FlockUser> {
	/**
	 * 
	 * @param flockId
	 * @return
	 */
	public List<FlockUser> findByFlockId(Long flockId);
	
	/**
	 * 
	 * @param userId
	 * @return
	 */
	public List<FlockUser> findByUserId(Long userId, int pageIndex);
	
	/**
	 * 
	 * @param userId
	 * @param flockId
	 * @return
	 */
	public FlockUser findByUserAndFlock(Long userId, Long flockId);
}

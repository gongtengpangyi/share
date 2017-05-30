/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_user_day_active_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_user_day_active_list);

pr(Admin_user_day_active_list).init = function(){
    console.log("admin-Admin_user_day_active_list");
}
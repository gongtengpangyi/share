/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_user_all_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_user_all_list);

pr(Admin_user_all_list).init = function(){
    console.log("admin-Admin_user_all_list");
}
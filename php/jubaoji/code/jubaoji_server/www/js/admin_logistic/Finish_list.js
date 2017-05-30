/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_logistic_finish_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_logistic_finish_list);

pr(Admin_logistic_finish_list).init = function(){
    console.log("admin-left");
}
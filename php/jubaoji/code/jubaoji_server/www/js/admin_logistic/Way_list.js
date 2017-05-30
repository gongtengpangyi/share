/**
 * 已发货
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_logistic_way_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_logistic_way_list);

pr(Admin_logistic_way_list).init = function(){
    console.log("admin-Admin_logistic_way_list");
}
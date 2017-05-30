/**
 * 未发货
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_logistic_waiting_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_logistic_waiting_list);

pr(Admin_logistic_waiting_list).init = function(){
    console.log("Admin_logistic_waiting_list");
}
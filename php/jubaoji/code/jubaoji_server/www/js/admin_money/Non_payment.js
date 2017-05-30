/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_money_non_payment() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_money_non_payment);

pr(Admin_money_non_payment).init = function(){
    console.log("admin-Admin_money_non_payment");
}
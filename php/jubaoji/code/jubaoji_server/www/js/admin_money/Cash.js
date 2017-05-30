/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_money_cash() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_money_cash);

pr(Admin_money_cash).init = function(){
    console.log("admin-Admin_money_cash");
}

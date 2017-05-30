/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_money_gallery() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_money_gallery);

pr(Admin_money_gallery).init = function(){
    console.log("admin-Admin_money_gallery");
}
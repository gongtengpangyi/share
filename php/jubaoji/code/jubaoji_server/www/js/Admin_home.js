/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_home() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_home);

pr(Admin_home).init = function(){
    console.log("admin-left");
}
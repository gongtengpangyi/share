/**
 * 官方订单
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_form_admin() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_form_admin);

pr(Admin_form_admin).init = function(){
    console.log("admin_form_admin");
    setPage(page_count,"index.php?controller=admin_form&action=admin")
}


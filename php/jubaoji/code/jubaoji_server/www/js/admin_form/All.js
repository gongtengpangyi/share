/**
 * 总订单
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_form_all() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_form_all);

pr(Admin_form_all).init = function(){
    console.log("admin_form_all");
    console.log(page_count);
    console.log(order_winner_list);
    setPage(page_count,"index.php?controller=admin_form&action=all")
}
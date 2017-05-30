/**
 * 机构订单
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_form_organization() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_form_organization);

pr(Admin_form_organization).init = function(){
    console.log("admin-admin_form_organization");
    console.log(page_count);
    console.log(order_winner_list);
    setPage(page_count,"index.php?controller=admin_form&action=organization")
}
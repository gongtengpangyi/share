/**
 * 日拍选优
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_running_today_comm() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_running_today_comm);

pr(Admin_running_today_comm).init = function(){
    console.log("admin-Admin_running_today_comm");
    console.log(page_count);
    console.log(commodity_list);
    setPage(page_count, "index.php?controller=admin_running&action=today_comm");
    $(".commodity-good-check input").change(this.submit);
}

/**
 * 提交
 */
pr(Admin_running_today_comm).submit=function(){
    console.log(this.checked);
    $.post("index.php?controller=admin_running&action=good_comm_choose",
        {
            admin_id: Cookie.getCookie(Cookie.USER_ID),
            check: this.checked,
            comm_id: this.value
        },
        function(data){
            console.log(data);
        }
    );
}
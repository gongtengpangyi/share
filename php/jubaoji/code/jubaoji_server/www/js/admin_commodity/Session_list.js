/**
 * 全部拍场
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_commodity_session_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_commodity_session_list);

pr(Admin_commodity_session_list).init = function(){
    console.log("admin_commodity_session_list");
    console.log(session_list);


    var $tableWrap= $("#inner-wrap-list");
    var table = $("<table></table>").addClass("table").appendTo($tableWrap);

    $("<td>专场类型</td><td>标题</td><td>开始时间</td><td>结束时间</td>" +
        "<td>专场介绍</td><td>专场宣传图片</td>").appendTo(table);

    for(var i=0;i<session_list.length;i++){
        var session_id = session_list[i].id;
        var session_image = "<img src="+session_list[i].image_url+">";


        var tr = $("<tr></tr>").attr("id","session_id"+session_id).appendTo(table);

        $("<td>"+session_list[i].type+"</td>").appendTo(tr);

        $("<td>"+session_list[i].title+"</td>").appendTo(tr);

        $("<td>"+session_list[i].create_time+"</td>").appendTo(tr);

        $("<td>"+session_end_time+"</td>").appendTo(tr);

        $("<td>"+session_list[i].introduction+"</td>").appendTo(tr);

        $("<td>"+session_image+"</td>").appendTo(tr);

        
        tr.click(function(){//点击专场跳转到拍场详情
            var tr_session_id = this.id.substr(10);
            var tr_url="index.php?controller=admin_commodity&action=session_introduce&id="+tr_session_id+"";
            window.location.href = tr_url;
        });
    }
    setPage(page_count,"index.php?controller=admin_commodity&action=session_list")
}
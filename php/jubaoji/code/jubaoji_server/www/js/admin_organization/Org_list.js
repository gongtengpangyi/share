/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_organization_org_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_organization_org_list);

pr(Admin_organization_org_list).init = function() {
    console.log("admin-Admin_organization_org_list");
    console.log(page_count);
    console.log(organization_list);

    var $tableWrap = $("#inner-wrap-list");
    var table = $("<table></table>").addClass("table").appendTo($tableWrap);
    $("<td>序号</td><td>机构头像</td><td>机构名称</td><td>送拍次数</td>" +
        "<td>审核通过次数</td><td>成功拍卖数</td><td>入住时间</td>").appendTo(table);

    for (var i = 0; i < organization_list.length; i++) {
        var org_id = organization_list[i].id;

        var tr = $("<tr></tr>").attr("id", "org_id" + org_id).appendTo(table);
        $("<td>" + (i+1) + "</td>").appendTo(tr);
        $("<img src="+organization_list[i].icon+">").appendTo(tr);
        $("<td>" + organization_list[i].name + "</td>").appendTo(tr);
        $("<td>" + organization_list[i].account + "</td>").appendTo(tr);
        $("<td>" + organization_list[i].account + "</td>").appendTo(tr);
        $("<td>" + organization_list[i].account + "</td>").appendTo(tr);
        $("<td>" + organization_list[i].create_time + "</td>").appendTo(tr);
    }

    setPage(page_count, "index.php?controller=admin_commodity&action=org_list")
}
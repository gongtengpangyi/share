/**
 * 全部拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Organization_commodity_comm_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Organization_commodity_comm_list);

pr(Organization_commodity_comm_list).init = function(){
    console.log("Organization_commodity_comm_list");
    console.log(commodity_list);
    var $tableWrap= $("#inner-wrap-list");
    var table = $("<table></table>").addClass("table").appendTo($tableWrap);
    $("<td>序号</td>").appendTo(table);
    $("<td>拍品名</td>").appendTo(table);
    $("<td>机构</td>").appendTo(table);
    $("<td>提交时间</td>").appendTo(table);
    $("<td>审核状态</td>").appendTo(table);
    $("<td>安排专场</td>").appendTo(table);
    var $input_value;//审核状态内容
    for(var i=0;i<commodity_list.length;i++){
        var commodity_id=commodity_list[i].id;//拍品id
        var a = commodity_list[i].status;
        var comm_create_time = commodity_list[i].create_time;
        //通过数字判断审核状态
        var array_status = ["未通过","未审核","未开始","开始前半小时","已经开始",
            "结束等待支付","结束流拍用户未支付","结束流拍未到封顶价","正常结束交易","后台关闭"];
        var array_status_show = array_status[parseInt(a)+2];
        var command_array_status = ["通过","通过","驳回","驳回","驳回","驳回","驳回","驳回","驳回","驳回"];
        var pecial_arrangement = commodity_list[i].sessions;
        var tr = $("<tr></tr>").attr("id","inner-wrap-list-table-tr-"+commodity_id).addClass("tr").appendTo(table);
        $("<td>"+ (i+1) +"</td>").appendTo(tr);//添加序号
        $( "<td>"+ commodity_list[i].name +"</td>").appendTo(tr)//添加拍品名
        $( "<td>"+ commodity_list[i].organization.name +"</td>")
            .attr("id","commodity_list_organization"+commodity_list[i].organization.id).appendTo(tr)//添加机构
        $( "<td>"+commodity_list[i].create_time+"</td>").appendTo(tr)//添加提交时间
        $input_value =$("<td><span class='span'>"+array_status_show +"</span></td>").appendTo(tr);//审核状态
        var pecial_arrangement = $("<td>"+commodity_list[i].session.title+"</td>")
            .attr("id","commodity_list_arrangement"+commodity_list[i].session.id).appendTo(tr);//专场
        tr.click(function(){//点击拍品跳转到详情页
            var tr_commodity_id = this.id.substr(25);
            var tr_url="index.php?controller=organization_commodity&action=comm_introduce&id="+tr_commodity_id+"";
            window.location.href = tr_url;
        });
    }
    setPage(page_count,"index.php?controller=organization_commodity&action=comm_list")
}
/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_organization_audit() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_organization_audit);

pr(Admin_organization_audit).init = function(){
    console.log("admin-Admin_organization_audit");
    console.log(page_count);
    console.log(organization);
    setPage(page_count,"index.php?controller=admin_organization&action=audit")


    var $tableWrap= $("#inner-wrap-list");
    var div = $("<div></div>").attr("id","divWrap").addClass("table").appendTo($tableWrap);
    var span_p = $("<p></p>").addClass("span_p").appendTo(div);


    $("<span>序号</span>").appendTo(span_p);
    $("<span>机构名称</span>").appendTo(span_p);
    $("<span>申请时间</span>").appendTo(span_p);
    $("<span>审核</span>").appendTo(span_p);


    for(var i=0;i<organization.length;i++){
        var organization_id = organization.id;


        var organization_p = $("<p></p>").addClass("").appendTo(div);

        $("<span>"+ (i+1) +"</span>").appendTo(organization_p);
        $( "<span>"+ organization[i].name +"</span>").appendTo(organization_p);
        $( "<span>"+organization[i].create_time+"</span>").appendTo(organization_p);
        var $input_value =$("<span></span>").appendTo(organization_p);


        $("<input>").attr("id","organization_yesBtn"+organization_id)
                    .attr("type","button")
                    .attr("value","通过")
                    .addClass("span_input_left").appendTo($input_value);

        $("<input>").attr("id","organization_noBtn"+organization_id)
                    .attr("type","button")
                    .attr("value","驳回").appendTo($input_value);

        var detail_info=$("<span>详情</span>").addClass("detail_info_span")
                    .attr("id","organization_detail_info_"+organization_id).appendTo(organization_p);

        var detail_info_span_arrow=$("<img src='../../images/btn_downArrow.png'>").appendTo(detail_info);


        /*点开详情*/
        var detail_info_ul = $("<ul></ul>").appendTo(div)
                                            .attr("id","organization_detail_info_ul"+organization_id)
                                            .addClass("detail_info_ul_hide");

        /*机构负责人*/
        var organization_principal =$("<li></li>").appendTo(detail_info_ul);

        $("<span>机构负责人："+organization[i].principal+"</span>")
            .appendTo(organization_principal);
        $("<span>负责人联系方式："+organization[i].principal+"</span>")
            .appendTo(organization_principal);
        $("<span>机构联系方式："+organization[i].principal+"</span>")
            .appendTo(organization_principal);

        /*身份证*/
        var organization_principal_IDcard =$("<li></li>").appendTo(detail_info_ul);

        $("<span>机构负责人身份证</span>")
            .appendTo(organization_principal_IDcard);
        $("<img src="+organization[i].icon+">")
            .appendTo(organization_principal_IDcard);
        $("<img src="+organization[i].icon+">")
            .appendTo(organization_principal_IDcard);

        /*机构执照*/
        var organization_license =$("<li></li>").appendTo(detail_info_ul);

        $("<span>机构执照</span>")
            .appendTo(organization_license);
        $("<img src="+organization[i].icon+">")
            .appendTo(organization_license);

        /*机构头像*/
        var organization_Icon =$("<li></li>").appendTo(detail_info_ul);

        $("<span>机构头像</span>")
            .appendTo(organization_Icon);
        $("<img src="+organization[i].icon+">")
            .appendTo(organization_Icon);

        /*机构拍卖认证*/
        var organization_certification =$("<li></li>").appendTo(detail_info_ul);

        $("<span>机构拍卖认证</span>")
            .appendTo(organization_certification);
        $("<img src="+organization[i].icon+">")
            .appendTo(organization_certification);


        $("#organization_detail_info_"+organization_id).bind("click",function () {
            var a=this.id.substr(25);
            $(this).find("img").toggleClass("detail_info_span_arrow");
            showDetail(a);
        })
        function showDetail(a) {
            $("#organization_detail_info_ul"+a).toggleClass("detail_info_ul_hide");
        }
    }
}
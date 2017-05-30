/**
 * 全部拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_commodity_comm_audit() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_commodity_comm_audit);

pr(Admin_commodity_comm_audit).init = function () {
    console.log("Admin_commodity_comm_audit");
    console.log(page_count);
    console.log(commodity_list);
    setPage(page_count, "index.php?controller=admin_commodity&action=comm_audit");


    var $tableWrap = $("#inner-wrap-list");
    var div = $("<div></div>").attr("id", "divWrap").addClass("table").appendTo($tableWrap);
    var span_p = $("<p></p>").addClass("span_p").appendTo(div);


    $("<span>序号</span>").appendTo(span_p);

    $("<span>拍品名</span>").appendTo(span_p);

    $("<span>提交时间</span>").appendTo(span_p);

    $("<span>保留价</span>").appendTo(span_p);

    $("<span>封顶价</span>").appendTo(span_p);

    $("<span>审核</span>").appendTo(span_p);


    for (var i = 0; i < commodity_list.length; i++) {
        var commodity_id = commodity_list[i].id;
        var _p = $("<p></p>")
            .attr("id", "inner-wrap-list-table-tr-" + commodity_id)
            .addClass("tr").appendTo(div);

        $("<span>" + (i + 1) + "</span>").appendTo(_p);

        $("<span>" + commodity_list[i].name + "</span>").appendTo(_p);

        $("<span>" + commodity_list[i].create_time + "</span>").appendTo(_p);

        $("<span>" + commodity_list[i].reserve_price + "</span>").appendTo(_p);

        $("<span>" + commodity_list[i].capped_price + "</span>").appendTo(_p);


        var $input_value = $("<span></span>").appendTo(_p);
        $("<input>").attr("id", "input_yesid" + commodity_id)
                    .attr("type", "button")
                    .attr("value", "通过")
                    .addClass("span_input_left").appendTo($input_value);
        $("<input>").attr("id", "input_nnoid" + commodity_id)
                    .attr("type", "button")
                    .attr("value", "驳回").appendTo($input_value);


        var detail_info = $("<span>详情</span>").addClass("detail_info_span")
            .attr("id", "detail_info_" + commodity_id).appendTo(_p);

        var detail_info_span_arrow = $("<img src='../../images/btn_downArrow.png'>").appendTo(detail_info);


        var detail_info_ul = $("<ul></ul>").appendTo(div)
                                            .attr("id", "detail_info_ul" + commodity_id)
                                            .addClass("detail_info_ul_hide");

        $("<li>拍品分类：" + commodity_list[i].type + "</li>").appendTo(detail_info_ul);
        $("<li>拍品介绍：" + commodity_list[i].introduction + "</li>").appendTo(detail_info_ul);

        var detail_info_parameters = commodity_list[i].parameters;
        var detail_info_parameters_arr = detail_info_parameters.split(".");

        for (var s in detail_info_parameters_arr) {
            var detail_info_parameters_arr_arr = detail_info_parameters_arr[s].split(",");

            $("<li><span>" + detail_info_parameters_arr_arr[0] + "</span>" +
                "<span>" + detail_info_parameters_arr_arr[1] + "</span></li>")
                .appendTo(detail_info_ul);
        }

        var detail_info_ul_img = $("<li>拍品图片：</li>").appendTo(detail_info_ul);
        $("<img src=" + commodity_list[i].image_url + ">").appendTo(detail_info_ul_img);

        //点击详情显示
        $("#detail_info_" + commodity_id).bind("click", function () {
            var a = this.id.substr(12);
            console.log($(detail_info_span_arrow));
            $(this).find("img").toggleClass("detail_info_span_arrow");
            showDetail(a);
        });
        function showDetail(a) {
            $("#detail_info_ul" + a).toggleClass("detail_info_ul_hide");
        }
    }

    $("input:button").bind("click", function (event) {
        var input_comm_id = this.id.substr(11); //对应商品id

        if ($(this).attr("value") == "通过") {//通过审核
            $.post("index.php?controller=admin_commodity&action=comm_audit_pass",
                {admin_id: Cookie.getCookie(Cookie.USER_ID), comm_id: input_comm_id},
                function (data, status) {
                    console.log(JSON.parse(data));
                    console.log(JSON.parse(data).status);
                    console.log(JSON.parse(data).msg);
                });
        }
        else {//驳回审核
            $.post("index.php?controller=admin_commodity&action=comm_audit_out",
                {admin_id: Cookie.getCookie(Cookie.USER_ID), comm_id: input_comm_id},
                function (data, status) {
                    console.log(JSON.parse(data));
                    console.log(JSON.parse(data).status);
                    console.log(JSON.parse(data).msg);
                });
        }
        event.stopPropagation();
    });
}
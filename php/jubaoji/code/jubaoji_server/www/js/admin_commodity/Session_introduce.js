/**
 * 全部拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_commodity_session_introduce() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_commodity_session_introduce);

pr(Admin_commodity_session_introduce).init = function(){
    console.log("Admin_commodity_session_introduce");
    console.log(session);

    var $divWrap= $("#session_introduction");


    var Session_introduce_image="<img src="+session.image_url+">";

    $("<p>专场名称："+session.content +"</p>").appendTo($divWrap);

    $("<button>修改</button>" ).appendTo($divWrap);

    $("<p>开拍日期："+session.create_time +"</p>").appendTo($divWrap);

    $("<p>开始时间："+session.start_time +"</p>").appendTo($divWrap);

    $("<p>结束时间："+session.end_time +"</p>").appendTo($divWrap);

    $("<p>专场宣传图："+Session_introduce_image +"</p>").appendTo($divWrap);

    $("<p>专场介绍："+session.introduction +"</p>").appendTo($divWrap);


    //展示已存在于专场的拍品
    var Session_commodity_wrapDiv1=$("<div></div>").appendTo($divWrap);
    $("<strong>拍场拍品展示</strong>").appendTo(Session_commodity_wrapDiv1);


    var Session_commodity_wrapDiv2=$("<div></div>").appendTo($divWrap);

    var add_comm = $("<button>添加拍品</button>" )
        .attr("id","add_commBtn").appendTo(Session_commodity_wrapDiv2);

    var Session_introduce_commodity=session.commodity;//已经安排好专场的拍品，已展示在table里
    var Session_introduce_commodity_table=$("<table></table>")
        .addClass("Session_introduce_commodity_table").appendTo(Session_commodity_wrapDiv2);

    $("<td>序号</td><td>拍品名</td><td>开拍时间</td><td>保留价</td>" +
        "<td>封顶价</td><td>起拍价</td><!--<td>加价幅度</td>-->").appendTo(Session_introduce_commodity_table);


    for(var i=0;i<Session_introduce_commodity.length;i++){
        var Session_introduce_commodity_id=Session_introduce_commodity[i].id;

        var Session_introduce_commodity_tr = $("<tr></tr>").css("border","1px solid")
                                                            .attr("id","Session_introduce_commodity_id"+Session_introduce_commodity_id)
                                                            .appendTo(Session_introduce_commodity_table);

        $("<td>"+Session_introduce_commodity_id+"</td>")
            .appendTo(Session_introduce_commodity_tr);

        $("<td>"+Session_introduce_commodity[i].name+"</td>")
            .appendTo(Session_introduce_commodity_tr);

        $("<td>"+Session_introduce_commodity[i].start_time+"</td>")
            .appendTo(Session_introduce_commodity_tr);

        $("<td>"+Session_introduce_commodity[i].reserve_price+"</td>")
            .appendTo(Session_introduce_commodity_tr);

        $("<td>"+Session_introduce_commodity[i].capped_price+"</td>")
            .appendTo(Session_introduce_commodity_tr);

        $("<td>"+Session_introduce_commodity[i].start_price+"</td>")
            .appendTo(Session_introduce_commodity_tr);
    }

    //弹出弹窗
    var dialogDiv=$("<div></div>").attr("id","session_introduce-dialog")
                                    .attr("title","添加拍品").appendTo($divWrap);

    $("<table></table>").attr("id","session_introduce-dialogTable").appendTo(dialogDiv);

    $("<div></div>").attr("id","session_introduce-dialogPage").appendTo(dialogDiv);

    $( "#session_introduce-dialog" ).dialog({
        autoOpen: false,
        height: 540,
        width:800
    });
    $( "#add_commBtn" ).click(function() {
        $( "#session_introduce-dialog" ).dialog( "open" );
        noSessionCommList(1);
    });

};

/**
 * 生成弹窗内容，拍品列表
 * @param page 页码
 */
function noSessionCommList (page){
    var dialogTable = $("#session_introduce-dialogTable");
    var dialogPage = $("#session_introduce-dialogPage");

    dialogTable.empty();
    dialogPage.empty();

    $.get("index.php?controller=admin_commodity&action=not_session_commodity&page="+page, function (data, status) {
        console.log(JSON.parse(data).status);
        console.log(JSON.parse(data).msg);

        var commodity_list=JSON.parse(data).msg.commodity_list;
        var page_count=JSON.parse(data).msg.page_count;

        console.log(commodity_list);

        for(var i=0;i<commodity_list.length;i++){
            var commodity_id=commodity_list[i].id;


            var dialogTr=$("<tr></tr>").attr("id","dialogTr").appendTo(dialogTable);

            $( "<td>"+ commodity_list[i].name +"</td>").appendTo(dialogTr);

            $( "<td>"+commodity_list[i].reserve_price+"</td>").appendTo(dialogTr);

            $( "<td>"+commodity_list[i].create_time+"</td>").appendTo(dialogTr);

            $("<img style='width: 100px;height: 100px;margin: 0 60px;' src="+commodity_list[i].image_url+">").appendTo(dialogTr);

            $("<button>添加</button>").attr("class","trBtn").attr("id","session_introduce-dialog-trBtn_"+commodity_id)

                .click(pr(Admin_commodity_session_introduce).submit).appendTo(dialogTr);
        }

        var trBtn=$("button.trBtn");
        console.log(trBtn.length);

        for(var a=0;a<page_count;a++){
            var dialogBtn=$( "<button>"+(a+1)+"</button>").
                attr("id","session_introduce-dialog-pageBtn"+(a+1)).appendTo(dialogPage);

            dialogBtn.bind("click",function () {
                var dialogBtn_num=$(this).text();
                noSessionCommList(dialogBtn_num);
            })
        }
    });
}

pr(Admin_commodity_session_introduce).submit = function () {
    var comm_id = this.id.substr(this.id.length-1);
    var session_id = location.search.match(/id=([^&]+)/)[1];
    console.log(session_id);

    $.post("index.php?controller=admin_commodity&action=comm_audit_session",
        {
            comm_id: comm_id,
            session_id: session_id
        },
        function (data,status) {
            data = JSON.parse(data);
            console.log(data.status);
            console.log(data.msg);
            if(data.status=="success"){
                alert("添加成功！！！");
                window.location.reload();
            }else{
                alert("添加失败！！！");
            }

        }
    );
}
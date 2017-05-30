/*talk.js*/
function talk(){

}
SingletonInheritor.declare(talk);

pr(talk).init = function(){
    POST("talk","reports","",this.initReports);
    POST("talk","students","",this.initStudents);
    pr(talk).invitations=[];
    this.getInvitations();
    $("#talk-invitations-more").click(function(){
        pr(talk).getInvitations();
    }).mouseover(function(){
        $(this).css("background","blue");
    }).mouseout(function(){
        $(this).css("background","");
    });
    $("#talk-students-add-btn").click(pr(talk).addStudent);
    $("#talk-reports-write-btn").click(pr(talk).addReport);
    $("#talk-invitation-send").click(pr(talk).sendInvitation);
}

/**
 * 写报告页面
 */
pr(talk).addReport=function(){
    $("#report-add-dialog").remove();
    var div=$("<div>").attr("id","report-add-dialog");
    div.append("<P>报告</P>")
    $("<textarea>").appendTo(div);
    var btn=$("<img>").attr("src","img/btn_save.jpg").attr("class","btn").attr("id","talk-report-add-save").appendTo(div);
    div.appendTo($("body"));
    $("#report-add-dialog").dialog();
    btn.click(function(){
        var report={};
        report.user_id=8;
        if(Cookie.getCookie(Cookie.USER_ID)!=null){
            report.user_id=Cookie.getCookie(Cookie.USER_ID);
        }
        report.text= $("#report-add-dialog textarea").val();
        console.log(report);
        POST("talk","addReport",JSON.stringify(report),function(){
            $("#report-add-dialog").dialog( "close" );
            $("#report-add-dialog").remove();
            POST("talk","reports","",pr(talk).initReports);
        });
    });
}

/**
 * 初始化报告们
 * @param report 报告们
 */
pr(talk).initReports=function(reports){
    $("#talk-reports .talk-reports-none").remove();
    $("#talk-reports .talk-reports-name").remove();
    $("#talk-reports .talk-reports-text").remove();
    for(var i=0;i<reports.length;i++){
        reports[i].index = i;
        pr(talk).initReport(reports[i]);
    }
    pr(talk).reports=reports;
    pr(talk).reportIndex=0;
    pr(talk).showReport();
    if(reports.length>1){
        $(".talk-reports-btn-mouseOut").click(function(){
            pr(talk).hideReport();
            if($(this).text()=="<"){
                pr(talk).reportIndex=(pr(talk).reports.length+pr(talk).reportIndex-1)%pr(talk).reports.length;
            }else if($(this).text()==">"){
                pr(talk).reportIndex=(pr(talk).reportIndex+1)%pr(talk).reports.length;
            }
            pr(talk).showReport();
        }).mouseover(function(){
            $(this).attr("class","talk-reports-btn-mouseOn");
        }).mouseout(function(){
            $(this).attr("class","talk-reports-btn-mouseOut");
        });;
    }
}

/**
 * 初始化报告
 * @param report 报告
 */
pr(talk).initReport=function(report) {
    var p1=$("<p>"+report.user_name+"  "+report.time+"</p>").attr("id","talk-reports-name"+report.index).attr("class","talk-reports-none");
    var p2=$("<p>"+report.text+"</p>").attr("id","talk-reports-text"+report.index).attr("class","talk-reports-none");
    $("#talk-reports-title").after(p1);
    p1.after(p2);
}

/**
 * 隐藏报告
 */
pr(talk).hideReport=function() {
    $("#talk-reports-name"+pr(talk).reportIndex).attr("class","talk-reports-none");
    $("#talk-reports-text"+pr(talk).reportIndex).attr("class","talk-reports-none");
}

/**
 * 显示报告
 */
pr(talk).showReport=function() {
    $("#talk-reports-name"+pr(talk).reportIndex).attr("class","talk-reports-name");
    $("#talk-reports-text"+pr(talk).reportIndex).attr("class","talk-reports-text");
}

/**
 * 添加学生
 */
pr(talk).addStudent=function (){
    var tr=$("<tr></tr>").appendTo($("#talk-students-table"));
    $("<td>请输入学号</td>").attr("id","talk-teachers-add-account").attr("contenteditable",true).appendTo(tr);
    $("<td>请输入姓名</td>").attr("id","talk-teachers-add-name").attr("contenteditable",true).appendTo(tr);
    var btn=$("<img>").attr("src","img/btn_save.jpg").attr("class","btn").attr("id","talk-teachers-add-save").appendTo(tr);
    btn.click(function(){
        var student={};
        student.account=$("#talk-teachers-add-account").text();
        student.password=student.account;
        student.username=$("#talk-teachers-add-name").text();
        student.entertime="20"+student.account.substr(1,2);
        student.icon="img/user_icon.jpg";
        student.usertype=1;
        console.log(student);
        POST("common","addUser",JSON.stringify(student),function(result){
            if(result.success){
                POST("talk","students","",pr(talk).initStudents);
            }
        })
    })

}

/**
 *初始化学生们
 * @param students 学生们
 */
pr(talk).initStudents=function(students){
    console.log(students);
    $("#talk-students-table").empty();
    $("#talk-students-table").append("<tr> <td>学号</td> <td>姓名</td> <td>年级</td> <td>方向</td> </tr>");
    pr(talk).students=students;
    for(var i=0;i<students.length;i++){
        pr(talk).initStudent(students[i]);
    }
}

/**
 * 初始化学生
 * @param student 学生
 */
pr(talk).initStudent=function(student){
    var tr=$("<tr></tr>").appendTo($("#talk-students-table"));
    $("<td>"+student.account+"</td>").appendTo(tr);
    $("<td>"+student.username+"</td>").appendTo(tr);
    $("<td>"+pr(talk).grade(student.entertime)+"</td>").appendTo(tr);
    $("<td>"+student.major_name.join(",")+"</td>").appendTo(tr);
}

/**
 *获得年级
 * @param enteryear 入学年份
 * @returns {string} 年级
 */
pr(talk).grade=function(enteryear){
    var grades=["大一","大二","大三","大四"];
    return grades[year()-enteryear];
}

/**
 * 获得帖子信息（一次五条）
 */
pr(talk).getInvitations=function(){
    POST("talk","invitations",pr(talk).invitations.length,function(invitations){
        console.log(invitations);
        pr(talk).invitations=pr(talk).invitations.concat(invitations);
        for(var i=0;i<invitations.length;i++){
            pr(talk).addInvitation("appendTo" ,invitations[i]);
        }
        $("#talk-divide").css("height",$("#talk-invitations").css("height"));
    });
}

/**
 *添加帖子
 * @param add 添加方法（appendTo or prependTo）
 * @param invitation 帖子
 */
pr(talk).addInvitation=function(add, invitation){
    if($(".talk-invitations-main").length>0){
        $("<hr>").attr("class","small").appendTo($("#talk-invitations"));
    }
    var div = $("<div></div>").attr("class","talk-invitations-main");
    eval("div."+add+"($('#talk-invitations'))")
    $("<img>").attr("class","talk-invitations-icon").attr("src",base64ToImg(invitation.user_icon)).appendTo(div);
    $("<p>"+invitation.user_name+"</p>").attr("name","user_name").attr("class","talk-invitations-user").appendTo(div);
    $("<p>"+invitation.time+"</p>").attr("class","talk-invitations-time").appendTo(div);
    $("<p>"+invitation.text+"</p>").attr("class","talk-invitations-text").appendTo(div);
    var reply = $("<img>").attr("src","img/btn-reply.png").attr("class","talk-btn-reply").attr("name",invitation.id).appendTo(div);
    var fork = $("<img>").attr("src","img/btn-fork.jpg").attr("class","talk-btn-fork")
        .attr("name",invitation.id).attr("user_id",invitation.user_id).appendTo(div);
    fork.click(pr(talk).delInvitation);
    reply.click(pr(talk).sendInvitation);
    div.mouseover(function(){
        if(Cookie.getCookie(Cookie.USER_ID)==$(this).children(".talk-btn-fork").attr("user_id")||Cookie.getCookie(Cookie.USER_TYPE)=="admin"){
            $(this).children(".talk-btn-fork").show();
        }
    }).mouseout(function(){
        $(this).children(".talk-btn-fork").hide();
    });
    var repDiv=$("<div>");
    div.after(repDiv);
    for(var i=0;i<invitation.repInvitations.length;i++){
        pr(talk).addRepInvi(repDiv,invitation.repInvitations[i]);
    }

}

/**
 * 添加回复贴
 * @param fatherDiv 父贴
 * @param invitation 帖子
 */
pr(talk).addRepInvi=function(fatherDiv, invitation){
    var div = $("<div></div>").attr("class","talk-invitations-reply").appendTo(fatherDiv);
    $("<a>"+invitation.user_name+"</a>").attr("name","user_name").attr("class","talk-invitations-reply-name").appendTo(div);
    div.append(" 回复 ");
    $("<a>"+invitation.rep_user_name+"</a>").attr("class","talk-invitations-reply-name").appendTo(div);
    div.append(":"+invitation.text);
    var reply = $("<img>").attr("src","img/btn-reply.png").attr("class","talk-btn-reply").attr("name",invitation.id).appendTo(div);
    var fork = $("<img>").attr("src","img/btn-fork.jpg").attr("class","talk-btn-fork")
        .attr("name",invitation.id).attr("user_id",invitation.user_id).appendTo(div);
    fork.click(pr(talk).delInvitation);
    reply.click(pr(talk).sendInvitation);
    div.mouseover(function(){
        if(Cookie.getCookie(Cookie.USER_ID)==$(this).children(".talk-btn-fork").attr("user_id")){
            $(this).children(".talk-btn-fork").show();
        }
    }).mouseout(function(){
        $(this).children(".talk-btn-fork").hide();
    })
}

/**
 * 删除帖子
 */
pr(talk).delInvitation=function(){
    var inviDiv=$(this).parent();
    if(confirm("确定要删除吗？")){
        POST("talk","delInvitation",$(this).attr("name"),function(result){
            if(inviDiv.attr("class")=="talk-invitations-main"){
                inviDiv.next().remove();
                inviDiv.next().remove();
            }
            inviDiv.remove();
        })
    }
}

/**
 *发送帖子
 */
pr(talk).sendInvitation=function(){
    if(Cookie.getCookie(Cookie.USER_ID)==null||Cookie.getCookie(Cookie.USER_TYPE)=="admin"){
        alert("请用普通用户账号登录");
    }else{
        var invitation={};
        invitation.user_id=Cookie.getCookie(Cookie.USER_ID);
        invitation.repId=$(this).attr("name");
        var title="发帖";
        var rep_user_name="";
        var addFunc="pr(talk).addInvitation('prependTo',";
        var fatherDiv;
        if($(this).attr("name")!=0){
            rep_user_name=$(this).parent().children("[name=user_name]")[0].innerHTML;
            title="回复 "+rep_user_name;
            if($(this).parent().parent().attr("id")=="talk-invitations"){
                fatherDiv=$(this).parent().next();
            }else{
                fatherDiv=$(this).parent().parent();
            }
            addFunc="pr(talk).addRepInvi(fatherDiv,";
        }
        $("#invitation-send-dialog").remove();
        var div=$("<div>").attr("id","invitation-send-dialog").appendTo($("body"));
        $("<textarea>").appendTo(div);
        $("#invitation-send-dialog").dialog({
            title: title,
            buttons: {
                "确定": function () {
                    invitation.text=$("#invitation-send-dialog textarea").val();
                    POST("talk","sendInvitation",JSON.stringify(invitation),function(result){
                        if(result.success){
                            console.log(result.invitation);
                            result.invitation.rep_user_name=rep_user_name;
                            result.invitation.repInvitations={};
                            eval(addFunc+"result.invitation)");
                            $("#invitation-send-dialog").dialog("close");
                        }
                    });
                }
            }
        });
    }
}
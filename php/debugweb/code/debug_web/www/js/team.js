/*team.js*/
function team(){

}
SingletonInheritor.declare(team);

pr(team).init = function(){
    pr(team).activities=[];
    pr(team).honors=[];
    this.addActivities();
    this.addHonors();
    $("#team-activities-more").click(function(){
        pr(team).addActivities();
    });
    $("#team-honors-more").click(function(){
        pr(team).addHonors();
    });
    $(".team .more").mouseover(function(){
        $(this).css("color","red");
    }).mouseout(function(){
        $(this).css("color","black");
    });
    $("#team-honors-add-btn").click(pr(team).addHonor);
    $("#team-activities-add-btn").click(pr(team).addActivity);
}

/**
 *初始化activity页面
 */
pr(team).activity = function() {
    var img = $("<img>").attr("class","team-activity-picture").attr("src",base64ToImg(activity_picture)).appendTo($("#team-activity-div"));
    img.css("margin-left",($("body").width()-img.width())/2);
    for(var i=0;i<activity_sections.length;i++){
        if(activity_sections[i].text!=null&&activity_sections[i].text!=""){
            $("<p>"+activity_sections[i].text+"</p>").appendTo($("#team-activity-div"));
        }
        if(activity_sections[i].picture!=null&&activity_sections[i].picture!=""){
            img = $("<img>").attr("class","team-activity-picture").attr("src",base64ToImg(activity_sections[i].picture)).appendTo($("#team-activity-div"));
            img.css("margin-left",($("body").width()-img.width())/2);
        }
    }
    $("#team-activity-write-btn").click(pr(team).writeActivity.init);
    $("#team-activity-delete-btn").click(pr(team).delActivity);
    $("#activity-write-btn-addImg").click(pr(team).writeActivity.addImg);
    $("#activity-write-btn-addP").click(pr(team).writeActivity.addP);
    $("#activity-write-btn-save").click(pr(team).writeActivity.save);
    $("#activity-write-btn-exit").click(pr(team).writeActivity.exit);
    $("#activity-write-btn-delObj").click(pr(team).writeActivity.delObj);
}

/**
 * 编辑活动
 */
pr(team).writeActivity={
    //位置
    position:null,
    //初始化
    init:function(){
        if($("#activity-write-tool-dialog").css('display')=="none"){
            $("#activity-write-tool-dialog").show();
            $("#team-activity-div p").attr("contenteditable",true).click(function(){
                pr(team).writeActivity.position=$(this);
            });
            $("img.team-activity-picture").click(pr(team).writeActivity.setImg);
            pr(team).writeActivity.position=$("#team-activity-div p:last");
            if(pr(team).writeActivity.position[0]==null){
                pr(team).writeActivity.position=$("#team-activity-div img:last")
            }
            if(pr(team).writeActivity.position[0]==null){
                pr(team).writeActivity.position=$("#team-activity-div img")
            }
        }
    },
    //删除指定元素
    delObj:function(){
        if(confirm("确定删除指定元素？")){
            pr(team).writeActivity.position.remove();
            pr(team).writeActivity.position=$("#team-activity-div p:last");
            if(pr(team).writeActivity.position[0]==null){
                pr(team).writeActivity.position=$("#team-activity-div img:last");
            }
        }
    },
    //增加图片
    addImg:function(){
        var img=$("<img>").attr("class","team-activity-picture");
        pr(team).writeActivity.position.after(img);
        pr(team).writeActivity.position=img;
        pr(team).writeActivity.chooseImg();
    },
    //选择图片
    setImg:function(){
        pr(team).writeActivity.position=$(this);
        pr(team).writeActivity.chooseImg();
    },
    //增加段落
    addP:function() {
        console.log(pr(team).writeActivity.position[0]);
        var p=$("<p>新段落</p>").attr("contenteditable",true);
        pr(team).writeActivity.position.after(p);
        p.click(function(){
            pr(team).writeActivity.position=$(this);
        })
    },
    //选择图片
    chooseImg:function(){
        chooseFolder("image/jpeg, image/jpg, image/png",function(){
            if(window.FileReader) {
                var fr = new FileReader();
                fr.onload = function(e) {
                    var src=e.target.result;
                    pr(team).writeActivity.position.attr("src",src);
                    pr(team).writeActivity.position.css("margin-left",($("body").width()-pr(team).writeActivity.position.width())/2);
                }
                fr.readAsDataURL($("#file-chooser")[0].files[0]);
            }
            else {
                alert("Not supported by your browser!");
            }
        });
    },
    //保存
    save:function(){
        if(!confirm("确认要保存吗？")){

        }else if($("#team-activity-div img").length>0){
            var activity={};
            activity.id=activity_id;
            activity.user_id=user_id;
            activity.title = activity_title;
            activity.time = activity_time;
            activity.picture=imgToBase64($("#team-activity-div img")[0].src);
            activity.sections=[];
            for(var i=2;i<$("#team-activity-div").children().length;i++){
                console.log($("#team-activity-div").children()[i]);
                var section={};
                section.activity_id=activity.id;
                if($("#team-activity-div").children()[i].tagName=="IMG"){
                    section.picture=imgToBase64($("#team-activity-div").children()[i].src);
                }else if($("#team-activity-div").children()[i].tagName=="P"){
                    section.text=$("#team-activity-div").children()[i].innerHTML;
                }
                activity.sections[activity.sections.length]=section;
            }
            POST("team","writeActivity",JSON.stringify(activity),function(result){
                if(result.success){
                    alert("保存成功！！！");
                }else{
                    alert("保存失败！！！");
                }
                window.location.reload();
            })
        }else{
            alert("不能没图片！！！（没图没真相）");
        }
    },
    //取消编辑
    exit:function(){
        window.location.reload();
    }
}

/**
 * 删除活动
 */
pr(team).delActivity=function(){
    if(confirm("确定要删除该文章？")){
        POST("team","delActivity",activity_id,function(result){
            if(result.success){
                alert("删除成功！！！");
            }else{
                alert("删除失败！！！");
            }
            window.location.href="index.php?controller=team";
        })
    }
}

/**
 * 显示活动
 */
pr(team).addActivities=function(){
    POST("team","activities",pr(team).activities.length,function(activities){
        console.log(activities);
        pr(team).activities=pr(team).activities.concat(activities);
        for(var i=0;i<activities.length;i++){
            var a=$("<a>"+activities[i].title+"<br></a>").attr("href","index.php?controller=team&action=activity&id="+activities[i].id).appendTo($("#team-activities"));
            $("<img>").attr("src",base64ToImg(activities[i].picture)).appendTo(a);
            $("<p>"+activities[i].time+"</p>").appendTo($("#team-activities"));
        }
        $("#team-activities-more").appendTo($("#team-activities"));
        $("#team-activities-add-btn").appendTo($("#team-activities"));
        $("#team-divide").css("height",$("#team-activities").css("height"));
    });
}

/**
 * 增加活动
 */
pr(team).addActivity=function(){
    var activity={};
    $("#activity-add-dialog").remove();
    var div = $("<div>").attr("id","activity-add-dialog").appendTo($("#team-activities"));
    $("<input>").attr("placeholder","请输入标题").appendTo(div);
    div.append("<br>");
    div.append("时间：");
    $("<input>").attr("type","date").appendTo(div);
    var btn=$("<button>选择图片并增加</button>").attr("src","img/btn_save.jpg").appendTo(div);
    $("#activity-add-dialog").dialog();
    btn.click(function(){
        activity.title=$("#activity-add-dialog input")[0].value;
        activity.time=$("#activity-add-dialog input")[1].value;
        activity.user_id=6;
        if(Cookie.getCookie(Cookie.USER_ID)!=null){
            activity.user_id=Cookie.getCookie(Cookie.USER_ID);
        }
        chooseFolder("image/jpeg, image/jpg, image/png",function(){
            if(window.FileReader) {
                var fr = new FileReader();
                fr.onload = function(e) {
                    activity.picture=imgToBase64(e.target.result);
                    console.log(activity);
                    POST("team","addActivity",JSON.stringify(activity),function(result){
                        if(result.success){
                            window.location.href="index.php?controller=team&action=activity&id="+result.success;
                        }else{
                            alert("添加失败！！");
                        }
                    })
                }
                fr.readAsDataURL($("#file-chooser")[0].files[0]);
            }
            else {
                alert("Not supported by your browser!");
            }
        });
    })
}

/**
 * 显示荣誉
 */
pr(team).addHonors=function(){
    POST("team","honors",pr(team).honors.length,function(honors){
        pr(team).honors=pr(team).honors.concat(honors);
        for(var i=0;i<honors.length;i++){
            $("<p>"+honors[i].text+"</p>").attr("class","text").appendTo($("#team-honors"));
            $("<p> 学生："+honors[i].students+"</p>").attr("class","students").appendTo($("#team-honors"));
            $("<p> 指导老师："+honors[i].teacher+"</p>").attr("class","teacher").appendTo($("#team-honors"));
            $("<img>").attr("src","img/btn_delete.jpg").attr("class","btn team-honors-delete-btn show-limit-user1 show-limit-user0 show-limit-admin")
                .attr("id","team-honors-delete-btn"+honors[i].id).appendTo($("#team-honors"));
        }
        initUserInfo();
        $("#team-honors-more").appendTo($("#team-honors"));
        $("#team-honors-add-btn").appendTo($("#team-honors"));
        $(".team-honors-delete-btn").click(pr(team).delHonor);
    });
}

/**
 * 添加荣誉
 */
pr(team).addHonor=function(){
    $("#honor-add-dialog").remove();
    var div=$("<div>").attr("id","honor-add-dialog");
    div.empty();
    div.append("<P>添加荣誉</P>")
    $("<textarea>").appendTo(div);
    div.append("<hr>");
    div.append("学生<input id='honor-add-dialog-students'>");
    div.append("<hr>");
    div.append("指导老师<input id='honor-add-dialog-teacher'>");
    var btn=$("<img>").attr("src","img/btn_save.jpg").attr("class","btn").attr("id","team-honor-add-save").appendTo(div);
    div.appendTo($("body"));
    $("#honor-add-dialog").dialog();
    btn.click(function(){
        var honor={};
        honor.students=$("#honor-add-dialog-students").val();
        honor.teacher=$("#honor-add-dialog-teacher").val();
        honor.text= $("#honor-add-dialog textarea").val();
        console.log(honor);
        POST("team","addHonor",JSON.stringify(honor),function(){
            $("#honor-add-dialog").dialog( "close" );
            $("#honor-add-dialog").remove();
            $("#team-honors-more").appendTo($("body"));
            $("#team-honors-add-btn").appendTo($("body"));
            $("#team-honors").empty();
            $("<p>荣誉墙</p>").attr("class","title").appendTo($("#team-honors"));
            pr(team).honors=[];
            pr(team).addHonors();
        });
    });
}

/**
 * 删除荣誉
 */
pr(team).delHonor=function(){
    if(confirm("确认要删除吗？")){
        POST("team","delHonor",$(this).attr("id").substr($(this).attr("id").length-1,1),function(){
            $("#team-honors-more").appendTo($("body"));
            $("#team-honors-add-btn").appendTo($("body"));
            $("#team-honors").empty();
            $("<p>荣誉墙</p>").attr("class","title").appendTo($("#team-honors"));
            pr(team).honors=[];
            pr(team).addHonors();
        })
    }
}



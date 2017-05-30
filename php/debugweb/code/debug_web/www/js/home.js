/*home.js*/
function home(){

}
SingletonInheritor.declare(home);

/**
 * 初始化
 */
pr(home).init = function(){
    //显示
    POST("home","majors","",this.initMajors);
    POST("home","teachers","",this.initTeachers);
    POST("home","admin","",this.initAdmin);
    //添加teachers
    $("#home-teachers-add-div .home-teachers-icon").click(pr(home).iconTeacher);
    $("#home-teachers-add-save").click(pr(home).addTeacher);
    $("#home-teachers-add-btn").click(function(){
        $("#home-teachers-add-div").show();
    });
    //添加majors
    $("#home-majors-add-btn").click(pr(home).addMajor);
}

/**
 * 添加方向
 */
pr(home).addMajor=function(){
    $("<input>").attr("class","home-majors-name").attr("id","home-majors-add-name").attr("placeholder","请输入名字").appendTo($("#home-majors"));
    $("<textarea></textarea>").attr("class","home-majors-add-introduce").attr("id","home-majors-add-introduce")
        .attr("placeholder","请输入介绍").appendTo($("#home-majors"));
    var btn=$("<img>").attr("src","img/btn_save.jpg").attr("class","btn").attr("id","home-majors-add-save").appendTo($("#home-majors"))
    btn.click(function(){
        var major={};
        major.name=$("#home-majors-add-name").val();
        major.introduce=$("#home-majors-add-introduce").val();
        POST("home","addMajor",JSON.stringify(major),function(result){
            if(result.success){
                POST("home","majors","",pr(home).initMajors);
            }
        })
    });
    $("<hr>").attr("class","small").appendTo($("#home-majors"));
}

/**
 * 删除方向
 */
pr(home).delMajor=function(){
    if(confirm("确定删除？")){
        POST("home","delMajor",$(this).attr("id").substr($(this).attr("id").length-1,1),function(){
            POST("home","majors","",pr(home).initMajors);
        })
    }
}


/**
 *初始化方向们
 * @param majors 方向们
 */
pr(home).initMajors=function(majors){
    $("#home-majors").empty();
    pr(home).majors=majors;
    for(var i=0;i<majors.length;i++){
        pr(home).initMajor(majors[i]);
    }
    $(".home-majors-delete-btn").click(pr(home).delMajor);
    //初始化addTeachersWindow
    $("#home-teachers-add-div .home-teachers-add-majors div").remove();
    for(var i=0;i<pr(home).majors.length;i++){
        var div=$("<div>").appendTo($("#home-teachers-add-div .home-teachers-add-majors"))
        var input=$("<input>").attr("type","checkbox").attr("value",pr(home).majors[i].id)
            .appendTo(div);
        input.after(pr(home).majors[i].name+"<br>");
    }
    initUserInfo();
}

/**
 *初始化方向
 * @param major 方向
 */
pr(home).initMajor=function(major){
    $("<p>"+major.name+"</p>").attr("class","home-majors-name").appendTo($("#home-majors"));
    $("<p>"+major.introduce+"</p>").attr("class","home-majors-introduce").appendTo($("#home-majors"));
    $("<img>").attr("src","img/btn_delete.jpg").attr("class","btn home-majors-delete-btn show-limit-user0 show-limit-admin").attr("id","home-majors-delete-btn"+major.id).appendTo($("#home-majors"))
    $("<hr>").attr("class","small").appendTo($("#home-majors"));
}

/**
 *初始化管理员
 * @param admin 管理员
 */
pr(home).initAdmin=function(admin){
    pr(home).admin=admin;
    $("<p>联系人： "+admin.username+"</p>").appendTo($("#home-admin"))
    $("<p>地址：   "+admin.location+"</p>").appendTo($("#home-admin"))
    $("<p>邮箱：   "+admin.email+"</p>").appendTo($("#home-admin"))
}

/**
 *初始化老师们
 * @param teachers 老师们
 */
pr(home).initTeachers=function(teachers){
    $("#home").after($("#home-teachers-add-div"));
    $("#home .home-teachers").remove();
    $("#home-title-teachers").after($("#home-teachers-add-div"));
    pr(home).teachers=teachers;
    for(var i=teachers.length-1;i>=0;i--){
        pr(home).initTeacher(teachers[i]);
    }
}

/**
 *初始化老师
 * @param teacher 老师
 */
pr(home).initTeacher=function(teacher){
    var div=$("<div>").attr("class","home-teachers");
    $("#home-title-teachers").after(div);
    var img=$("<img>").attr("src",base64ToImg(teacher.icon)).attr("class","home-teachers-icon");
    var p1=$("<p>"+teacher.username+"</p>").attr("class","home-teachers-name");
    var p2=$("<p>"+teacher.introduce+"</p>").attr("class","home-teachers-introduce");
    div.append(img);
    img.after(p1);
    p1.after(p2);
}

/**
 *设置教师照片
 */
pr(home).iconTeacher=function(){
    chooseFolder("image/jpeg, image/jpg, image/png",function(){
        if(window.FileReader) {
            var fr = new FileReader();
            fr.onload = function(e) {
                $("#home-teachers-add-div .home-teachers-icon").attr("src",e.target.result);
            }
            fr.readAsDataURL($("#file-chooser")[0].files[0]);
        }
        else {
            alert("Not supported by your browser!");
        }
    });
}

/**
 *添加教师
 */
pr(home).addTeacher=function(){
    var teacher={};
    teacher.account=$("#home-teachers-add-div .home-teachers-add-account").val();;
    teacher.password=teacher.account;
    teacher.major_id="";
    for(var i=0;i< $("#home-teachers-add-div .home-teachers-add-majors input").length;i++){
        if($("#home-teachers-add-div .home-teachers-add-majors input")[i].checked){
            teacher.major_id=teacher.major_id+$("#home-teachers-add-div .home-teachers-add-majors input")[i].value+",";
        }
    }
    if(teacher.major_id.length>0){
        teacher.major_id=teacher.major_id.substr(0,teacher.major_id.length-1);
        teacher.entertime="20"+teacher.account.substr(1,2);
        teacher.icon=imgToBase64($("#home-teachers-add-div .home-teachers-add-icon").attr("src"));
        teacher.username=$("#home-teachers-add-div .home-teachers-add-username").val();
        teacher.introduce=$("#home-teachers-add-div .home-teachers-add-introduce").val();
        teacher.usertype=0;
        POST("common","addUser",JSON.stringify(teacher),function(result){
            if(result.success){
                POST("home","teachers","",pr(home).initTeachers);
                $("#home-teachers-add-div .home-teachers-add-icon").attr("src","img/user_icon.jpg");
                $("#home-teachers-add-div .home-teachers-add-name").val("");
                $("#home-teachers-add-div .home-teachers-add-introduce").val("");
                $("#home-teachers-add-div").hide();
            }
        })
    }else{
        alert("不能不选方向");
    }

}


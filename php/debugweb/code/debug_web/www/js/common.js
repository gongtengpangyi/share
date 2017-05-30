/*common.js*/
$(function(){
    dispatch();
    setButton();
});

/**
 * 调用各模块对应js
 */
function dispatch(){
    var oSearch = location.search.match(/\?controller=([^&]+)/);
    var szPage = "home";
    var szFunc = "init";
    if (oSearch != null) {
        szPage = oSearch[1];
    }
    oSearch = location.search.match(/\action=([^&]+)/);
    if (oSearch != null&&oSearch!="index") {
        szFunc = oSearch[1];
    }else{
        initBanner();
    }
    eval("ia("+szPage+")."+szFunc+"();");
    $("#header-"+szPage).attr("style","color:red;border-bottom: solid 2px;");
}

/**
 * 设置各个按钮对应的js
 */
function setButton(){
    //初始化导航的按钮
    ($(".header-bar ul li")).click(function(){
       window.location.href="index.php?controller="+$(this).attr("id").substr(7);
    });
    initUserInfo();
    //初始化右部（登录或者用户名字）按钮
    $("#header-user").mouseover(function(){
        var name =$(this).attr("name");
        if(name=="user"){
            $("#"+name+"-window").show();
        }else{
            $(this).css("color","blue").css("text-decoration","underline");
        }
    }).mouseout(function(){
        $(this).css("color","black").css("text-decoration","none");
    }).click(function(){
        var name =$(this).attr("name");
        $("#"+name+"-window").show();
    });
    //初始化登录界面按钮
    $("#login-button").click(login);
    $("#login-exit").click(function(){
        $("#login-window").hide();
    });
    //初始化用户操作界面按钮
    $("#user-logout").click(logout);
    $("#user-window").mouseleave(function(){
        $("#user-window").hide();
    });
    $("#user-info").click(function(){
       $("#"+Cookie.getCookie(Cookie.USER_TYPE)+"-info-window").show();
        POST("common","getUserInfo",Cookie.getCookie(Cookie.USER_TYPE)+","+Cookie.getCookie(Cookie.USER_ID),initUserInfoWindow);
    });
    $("#user-pass").click(setUserPass);
    //初始化用户详细信息界面按钮
    $("button[name='user-info-exit']").click(function(){
        $("#"+Cookie.getCookie(Cookie.USER_TYPE)+"-info-window").hide();
    });
    $("button[name='user-info-save']").click(saveUserInfo);
    $("#user-info-window img").click(chooseImage);
}

/**
 * 选择图片
 */
function chooseImage(){
    chooseFolder("image/jpeg, image/jpg, image/png",function(){
        if(window.FileReader) {
            var fr = new FileReader();
            fr.onload = function(e) {
                $("#user-info-window img").attr("src",e.target.result);
            }
            fr.readAsDataURL($("#file-chooser")[0].files[0]);
        }
        else {
            alert("Not supported by your browser!");
        }
    });
}

/**
 * 修改密码
 */
function setUserPass(){
    $("#user-pass-window").show();
    $("button[name='user-pass-exit']").click(function(){
        $("#user-pass-window").hide();
    });
    $("button[name='user-pass-save']").click(function(){
        if(($("#user-pass-window input")[0]).value!=($("#user-pass-window input")[1]).value){
            alert("两次输入密码不同");
        }else{
            var user={};
            user.password=($("#user-pass-window input")[0]).value;
            user.id=Cookie.getCookie(Cookie.USER_ID);
            user.type=Cookie.getCookie(Cookie.USER_TYPE);
            user.action="change_password";
            POST("common","setUserInfo",JSON.stringify(user),function(resean){
                if(resean.success){
                    alert("修改成功！！！");
                    Cookie.setCookie(Cookie.USER_PASS,user.password);
                    $("#user-pass-window").hide();
                }
            });
        }
    });
}

/**
 * 初始化用户信息界面
 */
var loginUser;
function initUserInfoWindow(user) {
    loginUser=user;
    var inputs = $("#" + Cookie.getCookie(Cookie.USER_TYPE) + "-info-window input");
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].name) {
            inputs[i].value = eval("user." + inputs[i].name);
        }
    }
    if (Cookie.getCookie(Cookie.USER_TYPE) == "user") {
        $("textarea").text(user.introduce);
        $("#user-info-window .checkbox").remove();
        for (var i = 0; i < user.major_param.length; i++) {
            var div = $("<div>")
                .attr("class", "checkbox")
                .appendTo($("#user-info-window div[name='checkbox']"));
            $("<input>").attr("name", "major")
                .attr("type", "checkbox")
                .attr("value",user.major_param[i].id)
                .attr("checked", user.major_id.indexOf(user.major_param[i].id) != -1)
                .appendTo(div);
            div.append(user.major_param[i].name + "<br>")
        }
        $("#user-info-window img").attr("src", base64ToImg(user.icon));
    }
}


/**
 *储存用户信息
 */
function saveUserInfo(){
    var user=loginUser;
    user.action="change_info";
    var doIt=true;
    var inputs = $("#" + Cookie.getCookie(Cookie.USER_TYPE) + "-info-window input");
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].name!=null) {
            eval("user." + inputs[i].name +"=inputs[i].value");
        }
    }
    user.type=Cookie.getCookie(Cookie.USER_TYPE);
    if (user.type == "user") {
        user.icon= imgToBase64($("#user-info-window img").attr("src"));
        user.introduce=$("textarea").val();
        var checks=$("#user-info-window .checkbox input");
        var major_id="";
        for(var i=0;i<checks.length;i++){
            if(checks[i].checked){
                major_id=major_id+checks[i].value+",";
            }
        }
        if(major_id.length==0){
            alert("不可以不选方向");
            doIt=false;
        }else{
            user.major_id=major_id.substr(0,major_id.length-1);
            doIt=true;
        }
    }
    if(doIt){
        POST("common","setUserInfo",JSON.stringify(user),function(resean){
            if(resean.success){
                $("#"+Cookie.getCookie(Cookie.USER_TYPE)+"-info-window").hide();
                Cookie.setCookie(Cookie.USER_NAME,user.username);
                loginUser=user;
            }
        });
    }
}

/**
 * 初始化是否登录状态下的一切不同模板
 */
function initUserInfo(){
    if(Cookie.getCookie(Cookie.USER_ID)==null){
        $("#header-user").attr("name","login").text("登录");
    }else{
        $("#header-user").attr("name","user").text("欢迎："+Cookie.getCookie(Cookie.USER_NAME));
        $(".show-limit-"+Cookie.getCookie(Cookie.USER_INFO)).show();
    }
}

/**
 * 登录
 */
function login(){
    POST("common","login",JSON.stringify(($("#login-form")).serializeArray()),function(user){
        if(user.result){
            Cookie.setCookie(Cookie.USER_NAME,user.username);
            Cookie.setCookie(Cookie.USER_ACCOUNT,user.account);
            Cookie.setCookie(Cookie.USER_PASS,user.password);
            Cookie.setCookie(Cookie.USER_ID,user.id);
            Cookie.setCookie(Cookie.USER_TYPE,user.type);
            if(user.type=="user"){
                Cookie.setCookie(Cookie.USER_INFO,user.type+user.usertype);
            }else{
                Cookie.setCookie(Cookie.USER_INFO,user.type);
            }
            initUserInfo();
            $("#login-window").hide();
        }else{
            alert("login fall");
        }
    });
}

/**
 * 注销
 */
function logout(){
    if(confirm("是否要退出登录？")){
        $(".show-limit-"+Cookie.getCookie(Cookie.USER_INFO)).hide();
        Cookie.delCookie(Cookie.USER_NAME);
        Cookie.delCookie(Cookie.USER_ACCOUNT);
        Cookie.delCookie(Cookie.USER_PASS);
        Cookie.delCookie(Cookie.USER_ID);
        Cookie.delCookie(Cookie.USER_TYPE);
        Cookie.delCookie(Cookie.USER_INFO);
        initUserInfo();
    }
    $("#user-window").hide();
    alert("退出成功!");
}

/**
 *初始化banner
 */
function initBanner(){
    POST("common","banners","",function(activities){
        console.log(activities);
        for(var i=0;i<activities.length;i++){
            var a=$("<a></a>").attr("href","index.php?controller=team&action=activity&id="+activities[i].id).appendTo($("#banner_list"));
            $("<img>").attr("src",base64ToImg(activities[i].picture)).appendTo(a);
            $("<p>"+activities[i].title+"</p>").appendTo(a);
        }
        runningBanner();
    });
}

var t = n = 0, count, bannerTime=4000;

/**
 *运行banner
 */
function runningBanner() {
    count = $("#banner_list a").length;
    $("#banner_list a:not(:first-child)").hide();
    $("#banner li").click(function() {
        var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4
        n = i;
        if (i >= count) return;
        $("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
        document.getElementById("banner").style.background = "";
        $(this).toggleClass("on");
        $(this).siblings().removeAttr("class");
    });
    t = setInterval("showAuto()", bannerTime);
    $("#banner").hover(function() {
            clearInterval(t)
        },
        function() {
            t = setInterval("showAuto()", bannerTime);
        });
}

/**
 *显示
 */
function showAuto() {
    n = n >= (count - 1) ? 0 : ++n;
    $("#banner li").eq(n).trigger('click');
}

/**
 *获取当前学年
 */
function year(){
    var date = new Date();;
    var year = parseInt(date.getYear());
    if(parseInt(date.getMonth())<6){
        year--;
    }
    return year+1900;
}
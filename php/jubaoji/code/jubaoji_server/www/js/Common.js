/**
 * 共用函数
 * Created by ASUS on 2017/3/5 0005.
 */
$(function(){
    dispatch();
    setHeader();
    setLeft();
});

/**
 * 调用各模块对应js
 */
function dispatch(){
    var oSearch = location.search.match(/\?controller=([^&]+)/);
    var szPage = "Login";
    var szFunc = "";
    if (oSearch != null) {
        szPage = oSearch[1];
        szPage = szPage.substr(0,1).toUpperCase() +szPage.substr(1);
    }
    oSearch = location.search.match(/\action=([^&]+)/);
    if (oSearch != null&&oSearch!="index") {
        szFunc = "_"+oSearch[1];
    }
    eval("ia("+szPage+szFunc+").init();");
    $("#header-"+szPage).attr("style","color:red;border-bottom: solid 2px;");
}

/**
 * 设置header
 */
function setHeader(){
    $("#header-username").text(Cookie.getCookie(Cookie.USER_NAME));
    //修改密码
    $("#header-change-password").click(function(){
        //TODO:
    }).mouseover(function(){
        $("#header-change-password").css("color","blue")
    }).mouseout(function(){
        $("#header-change-password").css("color","black")
    });
    //退出登录
    $("#header-exit").click(function(){
        if(confirm("退出登录？")){
            Cookie.delCookie(Cookie.USER_ID);
            Cookie.delCookie(Cookie.USER_NAME);
            Cookie.delCookie(Cookie.USER_ACCOUNT);
            Cookie.delCookie(Cookie.USER_TYPE);
            Cookie.delCookie(Cookie.USER_ACCESS_TOKEN);
            window.location.href="index.php";
        }
    }).mouseover(function(){
        $("#header-exit").css("color","blue")
    }).mouseout(function(){
        $("#header-exit").css("color","black")
    });
}

/**
 * 设置left
 */
function setLeft(){
    var controller="",action="";
    var pz=(location.search.match(/\?controller=([^&]+)/));
    if(pz!=null){
        controller=pz[1];
    }
    var pz = location.search.match(/\action=([^&]+)/);
    if(pz!=null){
        action=pz[1];
    }
    $("#"+controller+"-"+action+"-item").css("color","blue");
    $("#"+controller+"-left-menu-item").show();
    $(".menu>li>span").click(function(){
        $(".menuItem").not("#"+this.id+"-item").hide();
        $("#"+this.id+"-item").toggle();
    });
    $(".menuItem li").click(function(){
        var id = this.id;
        window.location.href="index.php?controller="+id.split("-")[0]+"&action="+id.split("-")[1];
    });
    if(Cookie.getCookie(Cookie.USER_TYPE)=="organization"){
        //TODO:
    }else if(Cookie.getCookie(Cookie.USER_TYPE)=="admin"){

    }
}

/**
 * 分页
 * count: 页数
 * url：主路径
 */
function setPage(count, url){
    for(var i=1;i<=count;i++){
        $("<li>"+i+"</li>").addClass("page_li"+i).appendTo($(".pageList ul"));
    }
    var page = location.search.match(/page=([^&]+)/);//通过url获取当前页
    if(page==null){
        page=1;
    }else{
        page=page[1];//如果没有页面显示，默认为第一页
    }
    $(".pageList ul .page_li"+page).css("color", "blue").css("cursor","auto");
    $(".pageList ul li").not($(".page_li"+page)).click(function(){//其他页码页的点击
        window.location.href=url+"&page="+this.innerHTML;
    });
    $(".pageStart").click(function(){
        window.location.href=url+"&page=1";//跳转到第一页
    });
    $(".pageEnd").click(function(){
        window.location.href=url+"&page="+count;
    });
    if(page!=1){
        $(".pageUp").click(function(){
            page=parseInt(page)-1;
            window.location.href=url+"&page="+(page);
        });
    }else{
        $(".pageUp").css("cursor","auto");
    }
    if(page!=count){
        $(".pageDown").click(function(){
            page=parseInt(page)+1;
            window.location.href=url+"&page="+(page);
        });
    }else{
        $(".pageDown").css("cursor","auto");
    }
}


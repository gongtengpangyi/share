/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_running_article_create() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_running_article_create);

pr(Admin_running_article_create).init = function(){
    $("#admin_running-article_create-form").submit(this.submit);
    $(".article-image img").click(function(){
        var $file=$(this).next();
        var imageUtil=new ImageUtil($file[0],this,300,300);
        imageUtil.previewImage();
    });

};

/**
 * 提交创建的文章
 */
pr(Admin_running_article_create).submit=function (){
    if($(".article-title input").val()==""){
        alert("请输入标题");
    }else if($(".article-subtitle input").val()==""){
        alert("请输入副标题");
    }else if($(".article-content textarea").val()==""){
        alert("请输入正文");
    }else if($(".article-image input").val()==""){
        alert("请添加图片");
    }else{
        var options = {
            type:"POST",
            url:"index.php?controller=admin_running&action=article_create_submit",
            enctype:"multipart/form-data",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            headers:{
                "user-id":0,
                "access-token":Cookie.getCookie(Cookie.USER_ACCESS_TOKEN)
            },
            dataType: "json",
            data:{
                userId:0,
                level:0,
                type:0
            },
            success:function(data){
                console.log(data);
            },
            error: function (xhr, textStatus, errorThrown) {
                if ("timeout" == textStatus) {// 连接超时
                    alert("请求超时！");
                } else{// 网络异常
                    console.log(xhr.responseText);
                    //alert("网络异常！");
                }
            }
        };
        $("#admin_running-article_create-form").ajaxSubmit(options);
    }
    return false;
}


/**
 * ajax,不知道怎么用这个异步传图片
 */
//$.ajax({
//    type:"POST",
//    url:"index.php?controller=admin_running&action=article_create_submit",
//    enctype:"multipart/form-data",
//    contentType:"application/x-www-form-urlencoded;charset=GBK",
//    headers:{
//        "user-id":0,
//        "access-token":Cookie.getCookie(Cookie.USER_ACCESS_TOKEN)
//    },
//    data:$("#admin_running-article_create-form").serialize()+
//    "&userId=0"+
//    "&level=0"+
//    "&type=0",
//    //data:{
//    //    title: $(".article-title input").val(),
//    //    subtitle: $(".article-subtitle input").val(),
//    //    content: $(".article-content textarea").val(),
//    //    image:  $(".article-image input").val(),
//    //    userId:0,
//    //    level:0,
//    //    type:0
//    //},
//    dataType: "json",
//    success:function(data){
//        console.log(data);
//    },
//    error: function (xhr, textStatus, errorThrown) {
//        if ("timeout" == textStatus) {// 连接超时
//            alert("请求超时！");
//        } else {// 网络异常
//            console.log(xhr.responseText);
//            //alert("网络异常！");
//        }
//    }
//});
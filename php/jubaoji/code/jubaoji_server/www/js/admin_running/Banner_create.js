/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_running_banner_create() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_running_banner_create);

pr(Admin_running_banner_create).init = function(){
    console.log("admin-left");
    console.log(banner_list);
    $(".banner-image img").click(function(){
        var $file=$(this).next();
        var imageUtil=new ImageUtil($file[0],this,800,600);
        imageUtil.previewImage();
    });
    $("#admin_running-banner_create-form").submit(this.submit);
    $("#admin_running-banner_create-list-div .delete").click(this.delete);
}

/**
 * 创建banner提交
 */
pr(Admin_running_banner_create).submit = function(){
    if($(".article-title input").val()==""){
        alert("请输入标题");
    }else{
        var options = {
            type:"POST",
            url:"index.php?controller=admin_running&action=banner_create_submit",
            enctype:"multipart/form-data",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            headers:{
                "user-id":0,
                "access-token":Cookie.getCookie(Cookie.USER_ACCESS_TOKEN)
            },
            dataType: "json",
            data:{
                userId:0,
                value:1,
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
        $("#admin_running-banner_create-form").ajaxSubmit(options);
    }
    return false;
}

/**
 * 删除banner
 */
pr(Admin_running_banner_create).delete = function(){
    console.log(this.name);
    $.post("index.php?controller=admin_running&action=banner_delete",{
        id: this.name,
    },function(data){
        data = JSON.parse(data);
        alert(data.msg);
        if(data.status=="success"){
            window.location.reload();
        }
    })
}

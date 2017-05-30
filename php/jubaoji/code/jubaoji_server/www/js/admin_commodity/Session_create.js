/**
 * 创建拍场
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_commodity_session_create() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_commodity_session_create);

pr(Admin_commodity_session_create).init = function(){
    console.log("admin_commodity_session_create");
    $("#admin_commodity-session_create-form").submit(this.submit);
    $(".session-image img").click(function(){
        var $file=$(this).next();
        var imageUtil=new ImageUtil($file[0],this,300,300);
        imageUtil.previewImage();
    });
};

/**
 * 创建拍品提交
 */
pr(Admin_commodity_session_create).submit=function(){

    var start_time = $("#admin_commodity-session_create-start_time").val();
    var end_time = $("#admin_commodity-session_create-end_time").val();
    var day = $("#admin_commodity-session_create-date").val();


    if($(".session_create_name input").val()==""){
        alert("请输入专场名称");
    }else if($(".session_create_intr textarea").val()==""){
        alert("请输入专场介绍");
    }else if($(".session_create_content textarea").val()==""){
        alert("请输入专场详情");
    }else if($(".session_create_datepicker input").val()==""){
        alert("请输入开拍日期");
    }else if($(".session_create_timepicker input:first").val()==""){
        alert("请输入开始时间");
    }else if($(".session_create_timepicker input:last").val()==""){
        alert("请输入结束时间");
    }else if($(".session-image input").val()==""){
        alert("请添加图片");
    }else{
        var options = {
            async: false,
            type:"POST",
            url:"index.php?controller=admin_commodity&action=session_create_submit",
            enctype:"multipart/form-data",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            headers:{
                "user-id":0,
                "access-token":Cookie.getCookie(Cookie.USER_ACCESS_TOKEN)
            },
            dataType: "json",
            data:{
                type:1,
                start_time: new Date(day+" "+start_time).format(Date.DATE_TIME),
                end_time: new Date(day+" "+ end_time).format(Date.DATE_TIME)
            },
            success:function(data){
                console.log(data);
                alert(data.msg);
                if(data.status=="success"){
                    window.location.reload();
                }
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
        $("#admin_commodity-session_create-form").ajaxSubmit(options);
    }
    return false;
};




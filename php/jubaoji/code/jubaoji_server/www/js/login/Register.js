/**
 * Register.js
 * Created by ASUS on 2017/3/5 0005.
 */
function Login_register() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Login_register);

/**
 * 初始化
 */
pr(Login_register).init=function(){
    $("#login-register-form").submit(this.submit);
    this.clickImg();
}

/**
 *
 */
pr(Login_register).submit=function(){
    if($(".common input").val()==""){
        alert("请输入机构名称");
    }else if($(".mechanism-license .input-group input").val()==""){
        alert("请上传机构执照");
    }else if($(".mechanism-ID .mechanism-ID_front input").val()==""){
        alert("请上传身份证正面照");
    }else if($(".mechanism-ID .mechanism-ID_behind input").val()==""){
        alert("请上传身份证反面照");
    }else if($(".mechanism-legal-name input").val()==""){
        alert("请输入机构负责人姓名");
    }else if($(".mechanism-legal-person input").val()==""){
        alert("请输入机构负责人联系方式");
    }else if($(".mechanism-contact-information input").val()==""){
        alert("请输入机构联系方式");
    }else if($(".mechanism-head-portrait .input-group input").val()==""){
        alert("请上传机构头像");                    //$(".mechanism-authentication ul li input")
    }else if($(".myfile").val()==""){
        alert("请上传机构认证照");
    }else if($(".myfile:last").val()=="" ){
        alert("机构认证照不能少于10张");
        //console.log($(".myfile").val());
    }else{
        var options = {
            type:"POST",
            url:"index.php?controller=login&action=register_submit",
            enctype:"multipart/form-data",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "json",
            success:function(data){
                console.log(data);
                if(data.status=="success"){
                    alert(data.msg);
                    window.location.reload();
                }else{
                    alert(data.msg);
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
        $("#login-register-form").ajaxSubmit(options);
    }
    return false;
}

pr(Login_register).clickImg=function(){
    var clickImage=document.getElementsByTagName("img");
    for(var i=0;i<clickImage.length;i++){
        clickImage[i].index=i;
        clickImage[i].onclick=function(){
            var file=this.parentNode.getElementsByTagName("input")[0];
            var imageUtil = new ImageUtil(file, this);
            imageUtil.previewImage();
            //previewImage(file);//调用 提交图片之后显示缩略图
        }
    }
}

//图片上传预览    IE是用了滤镜。
/**
 * 提交图片之后显示缩略图
 * @param file input[file]元素
 */
//function previewImage(file)
//{
//    var MAXWIDTH  = 90;
//    var MAXHEIGHT = 90;
//    var div = file.parentNode.getElementsByTagName("div")[0];
//    if (file.files && file.files[0])
//    {
//        console.log("aaaaaaa");
//        div.innerHTML ='<img>';
//        var img = file.parentNode.getElementsByTagName("div")[0].getElementsByTagName("img")[0];
//        console.log(img);
//        img.onload = function(){
//            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
//            img.width  =  rect.width;
//            img.height =  rect.height;
////                 img.style.marginLeft = rect.left+'px';
//
//        }
//        var reader = new FileReader();
//        reader.onload = function(evt){img.src = evt.target.result;}
//        reader.readAsDataURL(file.files[0]);
//    } else //兼容IE
//    {
//        console.log("bbbbbbb");
//        var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
//        file.select();
//        var src = document.selection.createRange().text;
//        div.innerHTML = '<img>';
//        div.innerHTML = '<img id=imghead>';
//        var img = document.getElementById('imghead');
//        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
//        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
//        status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
//        div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
//    }
//}


/**
 * 更改缩略图大小
 * @param maxWidth 图片宽度最大值90
 * @param maxHeight 图片高度最大值90
 * @param width   图片现在宽度
 * @param height  图片现在高度
 * @returns {{top: number, left: number, width: *, height: *}}
 */
//function clacImgZoomParam( maxWidth, maxHeight, width, height ){
//    var param = {top:0, left:0, width:width, height:height};
//    if( width>maxWidth || height>maxHeight ){
//        rateWidth = width / maxWidth;
//        rateHeight = height / maxHeight;
//
//        if( rateWidth > rateHeight ){
//            param.width =  maxWidth;
//            param.height = Math.round(height / rateWidth);
//        }else{
//            param.width = Math.round(width / rateHeight);
//            param.height = maxHeight;
//        }
//    }
//    param.left = Math.round((maxWidth - param.width) / 2);
//    param.top = Math.round((maxHeight - param.height) / 2);
//    return param;
//}



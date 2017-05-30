/**
 * 创建拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Organization_commodity_comm_create() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Organization_commodity_comm_create);

pr(Organization_commodity_comm_create).init = function(){
    console.log("Organization_commodity_comm_create");
    var oBtn=document.getElementById("add_new_canshu");
    var oUl=document.getElementById("new_canshu");
    oBtn.onclick=function () {
        var oLi = document.createElement('li');
        var aLi = oUl.getElementsByTagName('li');
        var aA = document.getElementsByTagName('a');
        $("<span>属性</span><input class='paramter_shu' type='text'/><span>参数</span><input class='paramter_can' "+
            "type='text'/><a style='border:1px solid;cursor: pointer;margin-left: 20px;'>删除</a>").appendTo(oLi);
        oUl.appendChild(oLi);
        if (aLi.length>0){
            oUl.insertBefore(oLi,aLi[0]);
        }else {
            oUl.appendChild(oLi);
        }
        for(var i=0;i<aA.length;i++) {
            aA[i].onclick=function () {
                oUl.removeChild(this.parentNode);
            };
        }
    };
    $("#organization_commodity-comm_create-form").submit(this.submit);
    this.clickImg();
};

/**
 *  表单提交
 */
pr(Organization_commodity_comm_create).submit=function(){
    //拼接属性值并传到后台
    var dataJson="";
    var paramter_shu="";
    var paramter_can="";
    $("#new_canshu li").each(function (index, domEle) {
        paramter_shu="";
        paramter_can="";
        $(domEle).find("input").each(function (index, data) {
            if(index==0){
                paramter_shu=$(data).val();
            }else{
                if($(data).val()!="" && $(data).val()!=null){
                    paramter_can=":"+$(data).val()+";";
                }
            }
        });
        dataJson += paramter_shu+paramter_can;
    });
    if($(".comm_create_name input").val()==""){
        alert("请输入拍品名称");
    }else if($(".comm_create_intr textarea").val()==""){
        alert("请输入拍品介绍");
    }else if($(".comm_create_desc textarea").val()==""){
        alert("请输入拍品详情");
    }else if($(".comm_create_price input:first").val()==""){
        alert("请输入保留价");
    }else if($(".comm_create_price input:last").val()==""){
        alert("请输入封顶价");
    }else if($(".img_div input").val()==""){
        alert("请添加图片");
    }else{
        var options = {
            type:"POST",
            url:"index.php?controller=organization_commodity&action=comm_create_submit",
            enctype:"multipart/form-data",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            headers:{
                "user-id":0,
                "access-token":Cookie.getCookie(Cookie.USER_ACCESS_TOKEN)
            },
            dataType: "json",
            data:{
                special_id:0,
                parameters:dataJson,
                seller_id: Cookie.getCookie(Cookie.USER_ID)
            },
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
        $("#organization_commodity-comm_create-form").ajaxSubmit(options);
    }
    return false;
};

/**
 * 设置图片的点击
 */
pr(Organization_commodity_comm_create).clickImg=function(){
    var clickImage=document.getElementsByTagName("img");
    var addpic_button=document.getElementById("add_pic");
    for(var i=0;i<clickImage.length;i++){
        clickImage[i].index=i;
        clickImage[i].onclick=function(){
            var file=this.parentNode.getElementsByTagName("input")[0];
            var imageUtil = new ImageUtil(file, this);
            imageUtil.previewImage();
            //previewImage(file);//调用 提交图片之后显示缩略图
        }
    }
    addpic_button.onclick=function () {
        var imggroup_wrap=$("#imggroup_wrap");
        var new_picdiv=$("<div></div>").addClass("img_div");
        var $img=$("<img>").attr("src","").attr("width","90px").attr("height","90px").appendTo(new_picdiv);
        var $file = $("<input>").attr("type","file").attr("name","image[]").css("display","none").appendTo(new_picdiv);
        console.log($(".img_div :last")[0]);
        $(".img_div:last").before(new_picdiv);
        var imageUtil = new ImageUtil($file[0], $img[0]);
        imageUtil.previewImage();
    }
};


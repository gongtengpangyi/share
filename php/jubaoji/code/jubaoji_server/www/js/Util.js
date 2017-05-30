/**
 * 工具函数
 * Created by ASUS on 2017/3/5 0005.
 */
/**
 * cookie封装
 */
var Cookie={
    USER_NAME:"jubaoji_server_user_name",
    USER_ID:"jubaoji_server_user_id",
    USER_ACCESS_TOKEN:"jubaoji_server_user_accessToken",
    USER_ACCOUNT:"jubaoji_server_user_account",
    USER_TYPE:"jubaoji_server_user_type",
    USER_INFO:"jubaoji_server_user_info",
    //写cookie
    setCookie:function(name,value)
    {
        var Days = 30;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    },
    //获取cookie
    getCookie: function(name)
    {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    },
    //删除cookie
    delCookie:function(name)
    {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval=this.getCookie(name);
        if(cval!=null)
            document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
}

/**
 * 图片工具
 */
function ImageUtil(file,image,maxWidth,maxHeight){
    this.file=file;//input
    this.image=image;//img
    if(maxWidth){
        this.maxWidth=maxWidth;
    }else{
        this.maxWidth=130;
    }
    if(maxHeight){
        this.maxHeight=maxHeight;
    }else{
        this.maxHeight=130;
    }
}

ImageUtil.prototype={
    /**
     * 提交图片之后显示缩略图
     */
    previewImage : function (){
        var file=this.file;
        var img = this.image;
        var imageUtil=this;
        var MAXWIDTH  = this.maxWidth;
        var MAXHEIGHT = this.maxHeight;
        file.click();
        file.select();
        file.onchange= function(){
            img.onload = function(){
                $(img).attr("width","").attr("height","");
                var rect = imageUtil.clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  = rect.width;
                img.height =  rect.height;
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        };
    },

    /**
     * 更改缩略图大小
     * @param maxWidth 图片宽度最大值90
     * @param maxHeight 图片高度最大值90
     * @param width   图片现在宽度
     * @param height  图片现在高度
     * @returns {{top: number, left: number, width: *, height: *}}
     */
    clacImgZoomParam:function( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight ){
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight ){
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else{
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    },

    //将base64转化为图片
    base64ToImg: function(str){
        return "data:image/png;base64,"+str;
    },

    //将图片转换为base64
    imgToBase64: function(str){
        return str.substr(str.indexOf(",")+1);
    }
}

/**
 * 日期格式化
 * @param format 格式化的标准
 * @returns {*} 格式化后的字符串
 */
Date.prototype.format = function(format) {
    var o = {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
            RegExp.$1.length==1 ? o[k] :
                ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

Date.DATE_TIME="yyyy-MM-dd hh:mm:ss";//日期时间格式




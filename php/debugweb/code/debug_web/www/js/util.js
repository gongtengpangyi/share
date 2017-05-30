/*util*/

/**
 * post
 * @param controller controller参数
 * @param action action参数
 * @param json json参数，使用前需要JSON.stringify(obj)
 * @param callback 返回成功的处理函数
 * @constructor
 */
function POST(controller, action, json, callback){
    var url="/index.php?"
    if(controller!=null){
        url+="controller="+controller+"&";
    }
    if(action!=null){
        url+="action="+action+"&";
    }
    url=url.substr(0,url.length-1);
    $.post(url,
        {
            json:json,
        },
        function(data){
            console.log(data);
            data=JSON.parse(data);
            if(data.status=="success"){
                callback(data.msg);
            }else{
                alert("error\n+message:"+data.msg);
            }
        }
    );
}

/**
 * GET请求
 * @param controller controller参数
 * @param action action参数
 * @param json json参数，使用前需要JSON.stringify(obj)
 * @param callback 返回成功的处理函数
 * @constructor
 */
function GET(controller, action, json, callback){
    var url="/index.php?"
    if(controller!=null){
        url+="controller="+controller+"&";
    }
    if(action!=null){
        url+="action="+action+"&";
    }
    url=url.substr(0,url.length-1);
    $.get(url,
        {
            json:json,
        },
        function(data){
            data=JSON.parse(data);
            if(data.status=="success"){
                callback(data.msg);
            }else{
                alert("error\n+message:"+data.msg);
            }
        }
    );
}

/*上述方法的使用如下
 var submit={};
 submit.name="Tom";
 submit.pass="123456";
 POST("home","majors",JSON.stringify(submit),function(message){
 console.log("message:"+message);
 });
 */


/**
 * cookie封装
 */
var Cookie={
    USER_NAME:"user_name",
    USER_ID:"user_id",
    USER_PASS:"user_pass",
    USER_ACCOUNT:"user_account",
    USER_TYPE:"user_type",
    USER_INFO:"user_info",
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

//将base64转化为图片
function base64ToImg(str){
    return "data:image/png;base64,"+str;
}

//将图片转换为base64
function  imgToBase64(str){
    return str.substr(str.indexOf(",")+1);
}

/**
 * 打开文件管理器
 * @param onchange 回调函数
 */
function chooseFolder(accept, onchange){
    $("#file-chooser").attr("accept",accept);
    $("#file-chooser").change(onchange);
    $("#file-chooser").click();
}






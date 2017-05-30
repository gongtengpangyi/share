/**
 * Login.js
 * Created by ASUS on 2017/3/5 0005.
 */
function Login() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Login);

/**
 * 初始化
 */
pr(Login).init = function () {
    console.log("Login-init");
    $("#login-index-loginBtn").click(this.submit)
}

/**
 * 登录点击
 */
pr(Login).submit = function () {
    if ($("#login-index-loginAccount").val() == "") {
        alert("账号不能为空");
    } else if ($("#login-index-loginPassword").val() == "") {
        alert("密码不能为空");
    } else {
        var vals = $("#login-index-loginForm").serialize();
        $.ajax({
            type: "POST",
            url: "index.php?controller=login&action=login",
            data: vals,
            dataType: "json",
            success: function (response) {
                if ("success" == response.status) {
                    console.log(response.msg);
                    Cookie.setCookie(Cookie.USER_ACCOUNT, response.msg.account);
                    Cookie.setCookie(Cookie.USER_ID, response.msg.id);
                    Cookie.setCookie(Cookie.USER_NAME, response.msg.name);
                    Cookie.setCookie(Cookie.USER_TYPE, response.msg.type);
                    Cookie.setCookie(Cookie.USER_ACCESS_TOKEN, response.msg.accessToken);
                    window.location.href = "index.php?controller=" + response.msg.type + "_home";
                } else {
                    alert(response.msg);
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                if ("timeout" == textStatus) {// 连接超时
                    alert("请求超时！");
                } else {// 网络异常
                    console.log(xhr.responseText);
                    //alert("网络异常！");
                }
            }
        });
    }
}
<?php
/* Smarty version 3.1.29, created on 2017-03-16 04:50:36
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\window.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca199c639a02_88325801',
  'file_dependency' => 
  array (
    'ebba72441ecee33dcfd364c9e228e51e9f1f1e2b' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\window.html',
      1 => 1487677464,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58ca199c639a02_88325801 ($_smarty_tpl) {
?>
<!--登录面板-->
<div id="login-window">
    <div class="title">登录</div>
    <form id="login-form" >
        <div class="type">
            <div><input type="radio" name="type" value="user" checked="true">用户</div>
            <div><input type="radio" name="type" value="admin">管理员</div>
        </div>
        <div class="info">
            账号:<input id="login-account" type="text" name="account" placeholder="请输入账号" >
        </div>
        <div class="info">
            密码:<input id="login-pass" type="password" name="password" placeholder="请输入密码">
        </div>
    </form>
    <button id="login-button">登录</button>
    <button id="login-exit">取消</button>
</div>
<!--用户操作下拉框-->
<div id="user-window">
    <p id="user-info">用户信息</p>
    <hr class="small">
    <p id="user-pass">修改密码</p>
    <hr class="small">
    <p id="user-logout">退出登录</p>
</div>
<!--用户信息面板-->
<div id="user-info-window" class="user-info-window">
    <img>
    <div>
        姓名：<input name="username" type="text" value=""/>
    </div>
    <div name="checkbox">
        <p>方向：</p>
    </div>
    <div>
        <p>介绍：</p>
        <textarea></textarea>
    </div>
    <button id="user-info-save1" name="user-info-save">保存</button>
    <button name="user-info-exit">取消</button>
</div>
<!--管理员信息面板-->
<div id="admin-info-window" class="user-info-window">
    <div>
        姓名：<input name="username" type="text" value=""/>
    </div>
    <div>
        地址：<input name="location" type="text" value=""/>
    </div>
    <div>
        邮箱：<input name="email" type="email" value=""/>
    </div>
    <button id="user-info-save2" name="user-info-save">保存</button>
    <button name="user-info-exit">取消</button>
</div>
<!--修改密码面板-->
<div id="user-pass-window" class="user-info-window">
    <div>
        新的密码：<input type="password" value=""/>
    </div>
    <div>
        再输一遍：<input type="password" value=""/>
    </div>
    <button name="user-pass-save">修改</button>
    <button name="user-pass-exit">取消</button>
</div>
<!--文件选择-->
<input id="file-chooser" type="file">
<?php }
}

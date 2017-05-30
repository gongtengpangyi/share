<?php
/* Smarty version 3.1.29, created on 2017-03-16 19:55:11
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\Login\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca7d1fd85423_78712684',
  'file_dependency' => 
  array (
    '0fe131ef9ce0e79b3734cfb2cd24bfb60f861fb4' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\Login\\index.html',
      1 => 1489469897,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
  ),
),false)) {
function content_58ca7d1fd85423_78712684 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en" style="width:100%; height:100% ">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/login/Login.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/login.css" rel="stylesheet" />
    <link type="text/css" href="css/reset.css" rel="stylesheet" />
</head>
<body style=" background: url('images/background.png') no-repeat;position: absolute; width:100%; height:100%; overflow:hidden;">
    <h2 class="login-title">聚宝集后台管理页面</h2>
    <div class="contain">
        <div class="contain-fill-in">
            <p>用户登录</p>
            <form id="login-index-loginForm">
                <div>
                    <input id="login-index-loginAccount" type="text" name="account" placeholder="请输入账号" value="000">
                </div>
                <div>
                    <input id="login-index-loginPassword" type="password" name="password" placeholder="请输入密码" value="000">
                </div>
                <div class="login-sample">
                        <span>机构<input type="radio" name="type" value="organization"></span>
                        <span>官方<input type="radio" name="type" value="admin" checked="true"></span>
                </div>
            </form>
            <div>
                <button id="login-index-loginBtn">登录</button>
            </div>
            <div class="login-index-occupancy"> <a href="index.php?controller=login&action=register">机构入驻</a></div>
        </div>
        <div class="login-QR-code">
            <img src="../../images/code.png">
            <p>聚宝集APP下载</p>
            <div>
                <p>这里是他的鬼审批号还是什么的</p>
            </div>
        </div>
    </div>
</body>
</html><?php }
}

<?php
/* Smarty version 3.1.29, created on 2017-04-18 14:18:01
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\login\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58f5af9983a774_33441588',
  'file_dependency' => 
  array (
    '0eeb500cce7dc35b8c943b89227f91e6957bf0b3' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\login\\index.html',
      1 => 1490864822,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
  ),
),false)) {
function content_58f5af9983a774_33441588 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
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
<body>
<h2 class="login-title">聚宝集后台管理页面</h2>
<div class="login-center">
    <div class="login-content">
        <div class="notice">
            <div class="notice-inner">
                <div class="notice-inner-img">
                    <img src="images/code.png"/>
                </div>
                <p class="notice-inner-p1">
                    聚宝集APP下载</p>
                <p class="notice-inner-p2">
                    这里是他的鬼审批号还是什么的</p>
            </div>
        </div>
        <div class="login-input">
            <div class="login-label">用户登录</div>
            <form id="login-index-loginForm">
                <div class="username">
                    <i class="username-icon"></i>
                    <input id="login-index-loginAccount" type="text" name="account" placeholder="账号">
                </div>
                <div class="password">
                    <i class="password-icon"></i>
                    <input id="login-index-loginPassword" type="password" name="password" placeholder="密码">
                </div>
                <div class="radio">
                    <span>机构<input type="radio" name="type" value="organization"></span>
                    <span>官方<input type="radio" name="type" value="admin" checked="true"></span>
                </div>
            </form>
            <div class="login-btn" id="login-index-loginBtn">登录</div>
            <div class="login-index-occupancy">
                <a href="index.php?controller=login&action=register">机构入驻</a>
            </div>
        </div>
    </div>
</div>
</body>
</html><?php }
}

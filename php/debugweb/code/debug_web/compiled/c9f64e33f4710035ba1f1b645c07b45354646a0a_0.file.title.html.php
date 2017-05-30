<?php
/* Smarty version 3.1.29, created on 2017-03-16 04:50:36
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\title.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca199c631d09_57309288',
  'file_dependency' => 
  array (
    'c9f64e33f4710035ba1f1b645c07b45354646a0a' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\title.html',
      1 => 1487677463,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:window.html' => 1,
  ),
),false)) {
function content_58ca199c631d09_57309288 ($_smarty_tpl) {
?>
<!--头部界面-->
<div id="header" class="header">
    <img class="header-icon" src="img/debug_icon.jpg"/>
    <h1 class="header-name">DEBUG</h1>
    <div class="header-bar">
        <ul>
            <li id="header-home">首页</li>
            <li id="header-students">优秀学长</li>
            <li id="header-team">团队风采</li>
            <li id="header-talk">论坛</li>
        </ul>
    </div>
    <div id="header-user" class="header-user"></div>
</div>
<hr class="large">
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:window.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}

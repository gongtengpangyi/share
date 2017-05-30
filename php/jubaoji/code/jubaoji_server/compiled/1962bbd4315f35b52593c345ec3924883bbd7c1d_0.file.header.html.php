<?php
/* Smarty version 3.1.29, created on 2017-03-16 14:36:53
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\header.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca32859d28d5_39132033',
  'file_dependency' => 
  array (
    '1962bbd4315f35b52593c345ec3924883bbd7c1d' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\header.html',
      1 => 1489202267,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58ca32859d28d5_39132033 ($_smarty_tpl) {
?>
<!--页面头部-->
<div id="header">
    <div class="title">
        <strong>聚宝集</strong>
        <a href="index.php?controller=<?php echo $_smarty_tpl->tpl_vars['home_href']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['home_name']->value;?>
</a>
        <p><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</p>
    </div>
    <div class="user">
        <p id="header-exit">退出</p>
        <p id="header-change-password">修改密码</p>
        <p id="header-username"></p>
    </div>
</div>
<div class="hr"></div>
<?php }
}

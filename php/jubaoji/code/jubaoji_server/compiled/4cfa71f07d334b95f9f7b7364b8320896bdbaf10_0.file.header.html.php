<?php
/* Smarty version 3.1.29, created on 2017-03-14 14:34:02
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\header.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58c78edab8e8a4_46880590',
  'file_dependency' => 
  array (
    '4cfa71f07d334b95f9f7b7364b8320896bdbaf10' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\header.html',
      1 => 1489473129,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58c78edab8e8a4_46880590 ($_smarty_tpl) {
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

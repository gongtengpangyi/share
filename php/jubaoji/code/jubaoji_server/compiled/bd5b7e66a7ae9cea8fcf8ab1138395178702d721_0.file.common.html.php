<?php
/* Smarty version 3.1.29, created on 2017-03-17 10:08:46
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\common.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58cb452e006607_98646378',
  'file_dependency' => 
  array (
    'bd5b7e66a7ae9cea8fcf8ab1138395178702d721' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\common.html',
      1 => 1489716472,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58cb452e006607_98646378 ($_smarty_tpl) {
?>
<!--共用html 用于加载共同部分-->
<!--js加载-->
<?php echo '<script'; ?>
 src="js/jquery-1.7.1.min.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/jquery-form.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/jquery-ui-1.12.1/jquery-ui.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/Singleton.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/Util.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="js/Common.js" type="text/javascript"><?php echo '</script'; ?>
>

<!--css加载-->
<link type="text/css" href="js/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="css/common.css" rel="stylesheet" />
<link type="text/css" href="css/reset.css" rel="stylesheet" />

<!--title图标-->
<link type="image/x-icon" href="jubaoji.ico" rel="icon" />
<?php }
}

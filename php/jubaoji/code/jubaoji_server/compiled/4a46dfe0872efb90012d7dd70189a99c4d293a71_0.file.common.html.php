<?php
/* Smarty version 3.1.29, created on 2017-03-17 22:27:14
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\common.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58cbf242295566_87953403',
  'file_dependency' => 
  array (
    '4a46dfe0872efb90012d7dd70189a99c4d293a71' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\common.html',
      1 => 1489756830,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58cbf242295566_87953403 ($_smarty_tpl) {
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

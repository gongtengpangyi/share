<?php
/* Smarty version 3.1.29, created on 2017-03-16 04:58:49
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\students\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca1b892b4007_38405066',
  'file_dependency' => 
  array (
    '67449d5eb8d91ee37fd772f5732c8ad2ce21bcb6' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\students\\index.html',
      1 => 1487677553,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:title.html' => 1,
    'file:banner.html' => 1,
  ),
),false)) {
function content_58ca1b892b4007_38405066 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>优秀学长</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 type="text/javascript" src="js/students.js"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/students.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:title.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:banner.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="students-index">
    <!--<p class="students-title">2016</p>-->
    <!--<div class="students-div">-->
        <!--<img class="students-icon" src="img/debug_icon.jpg"/>-->
        <!--<p class="students-name">xxx</p>-->
        <!--<p class="students-introduce">xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>-->
    <!--</div>-->
</div>
</body>
</html><?php }
}

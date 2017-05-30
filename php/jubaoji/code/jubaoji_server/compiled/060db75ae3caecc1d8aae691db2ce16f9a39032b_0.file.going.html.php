<?php
/* Smarty version 3.1.29, created on 2017-03-16 14:37:00
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_auction\going.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca328c15fed0_89252326',
  'file_dependency' => 
  array (
    '060db75ae3caecc1d8aae691db2ce16f9a39032b' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_auction\\going.html',
      1 => 1489198797,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:header.html' => 1,
    'file:admin_left.html' => 1,
  ),
),false)) {
function content_58ca328c15fed0_89252326 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/admin_auction/going.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_auction/going.css" rel="stylesheet" />
</head>
<body style="background-color: #F8F8F8">
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo $_smarty_tpl->tpl_vars['location']->value;?>

</body>
</html><?php }
}

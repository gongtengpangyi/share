<?php
/* Smarty version 3.1.29, created on 2017-03-16 15:43:51
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_auction\waiting.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca42377a01b1_27455127',
  'file_dependency' => 
  array (
    'c247c2192cf8ab96bc39f4cd7d823a22b744aaef' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_auction\\waiting.html',
      1 => 1489473129,
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
function content_58ca42377a01b1_27455127 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/admin_auction/Waiting.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_auction/waiting.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo $_smarty_tpl->tpl_vars['location']->value;?>

</body>
</html><?php }
}

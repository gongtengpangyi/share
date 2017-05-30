<?php
/* Smarty version 3.1.29, created on 2017-03-16 16:18:37
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\session_introduce.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca4a5dbe9bd8_57382062',
  'file_dependency' => 
  array (
    '913dd04c381803af86f89ce30dd40dede9f8ab06' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\session_introduce.html',
      1 => 1489494086,
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
function content_58ca4a5dbe9bd8_57382062 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
>
        var session=<?php echo $_smarty_tpl->tpl_vars['session']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_commodity/Session_introduce.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_commodity/session_introduce.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
专场详情-->
<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
        <div id="session_introduction">
        </div>
    </div>
</div>
</body>
</html><?php }
}

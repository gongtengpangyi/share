<?php
/* Smarty version 3.1.29, created on 2017-03-26 15:07:41
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\organization_commodity\comm_introduce.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d768bd3853c5_94875396',
  'file_dependency' => 
  array (
    'bda5611b9fed00e7b23dda1ae607766b271a87ff' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\organization_commodity\\comm_introduce.html',
      1 => 1490507022,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:header.html' => 1,
    'file:organization_left.html' => 1,
  ),
),false)) {
function content_58d768bd3853c5_94875396 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
>
        var commodity=<?php echo $_smarty_tpl->tpl_vars['commodity_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/organization_commodity/Comm_introduce.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/organization_commodity/comm_introduce.css" rel="stylesheet" />
</head>
<body>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:organization_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
拍品详情-->
    <div class="main">
        <div class="main-title">
            <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
            <div id="comm_introduction">
            </div>
        </div>
    </div>
</body>
</html><?php }
}

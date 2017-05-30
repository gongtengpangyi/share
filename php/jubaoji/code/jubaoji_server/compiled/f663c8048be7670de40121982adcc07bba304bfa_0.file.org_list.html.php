<?php
/* Smarty version 3.1.29, created on 2017-03-14 16:13:41
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_organization\org_list.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58c7a63554de05_64205673',
  'file_dependency' => 
  array (
    'f663c8048be7670de40121982adcc07bba304bfa' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_organization\\org_list.html',
      1 => 1489479208,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:header.html' => 1,
    'file:admin_left.html' => 1,
    'file:pageGro.html' => 1,
  ),
),false)) {
function content_58c7a63554de05_64205673 ($_smarty_tpl) {
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
        var organization_list=<?php echo $_smarty_tpl->tpl_vars['organization_list']->value;?>
;
        var page_count='<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_organization/Org_list.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_organization/org_list.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
--><!--机构列表-->
<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div>
    <div class="inner-wrap"><!--全部拍品-->
        <div id="inner-wrap-list">

        </div>
    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

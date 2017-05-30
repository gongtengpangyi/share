<?php
/* Smarty version 3.1.29, created on 2017-03-26 17:13:20
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_organization\audit.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d78630e562a9_62004037',
  'file_dependency' => 
  array (
    'ffed9eac3cbffab3b66ecc566c48dc8d45c8f4d9' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_organization\\audit.html',
      1 => 1490514922,
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
function content_58d78630e562a9_62004037 ($_smarty_tpl) {
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
        var organization=<?php echo $_smarty_tpl->tpl_vars['organization']->value;?>
;
        var page_count='<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_organization/Audit.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_organization/audit.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
待审核机构-->

<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div>
    <div class="inner-wrap"><!--拍品审核-->
        <div id="inner-wrap-list">

        </div>
    </div>

    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

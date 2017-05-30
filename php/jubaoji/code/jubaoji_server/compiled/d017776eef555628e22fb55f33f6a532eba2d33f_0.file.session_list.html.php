<?php
/* Smarty version 3.1.29, created on 2017-03-25 20:43:10
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\session_list.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d665deeaaa12_16514319',
  'file_dependency' => 
  array (
    'd017776eef555628e22fb55f33f6a532eba2d33f' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\session_list.html',
      1 => 1490443787,
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
function content_58d665deeaaa12_16514319 ($_smarty_tpl) {
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
        var page_count='<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
        var session_list=<?php echo $_smarty_tpl->tpl_vars['session_list']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_commodity/Session_list.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_commodity/session_list.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--%$location<?php echo '%>'; ?>
--><!--全部拍场-->
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

<?php
/* Smarty version 3.1.29, created on 2017-03-23 20:29:18
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_form\admin.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d3bf9e3c78d3_26449695',
  'file_dependency' => 
  array (
    '225ddc7d8f420a03da4a199deac8137744b64b95' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_form\\admin.html',
      1 => 1489476171,
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
function content_58d3bf9e3c78d3_26449695 ($_smarty_tpl) {
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
        var page_count='<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
        var order_winner_list=<?php echo $_smarty_tpl->tpl_vars['order_winner_list_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_form/Admin.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_form/admin.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
官方订单-->
<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div>
    <div id="admin_form-all-div">
        <?php if ($_smarty_tpl->tpl_vars['order_winner_list']->value != null) {?>
        <?php
$_from = $_smarty_tpl->tpl_vars['order_winner_list']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_order_winner_0_saved_item = isset($_smarty_tpl->tpl_vars['order_winner']) ? $_smarty_tpl->tpl_vars['order_winner'] : false;
$_smarty_tpl->tpl_vars['order_winner'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['order_winner']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['order_winner']->value) {
$_smarty_tpl->tpl_vars['order_winner']->_loop = true;
$__foreach_order_winner_0_saved_local_item = $_smarty_tpl->tpl_vars['order_winner'];
?>
        <div class="admin_form-all-item">
            <p><?php echo $_smarty_tpl->tpl_vars['order_winner']->value['commodity']['name'];?>
</p>
            <p><?php echo $_smarty_tpl->tpl_vars['order_winner']->value['create_time'];?>
</p>
            <p><?php echo $_smarty_tpl->tpl_vars['order_winner']->value['total_price'];?>
</p>
            <p><?php echo $_smarty_tpl->tpl_vars['order_winner']->value['pay_status_name'];?>
</p>
        </div>
        <?php
$_smarty_tpl->tpl_vars['order_winner'] = $__foreach_order_winner_0_saved_local_item;
}
if ($__foreach_order_winner_0_saved_item) {
$_smarty_tpl->tpl_vars['order_winner'] = $__foreach_order_winner_0_saved_item;
}
?>
        <?php } else { ?>
        <p>暂时没有数据</p>
        <?php }?>
    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

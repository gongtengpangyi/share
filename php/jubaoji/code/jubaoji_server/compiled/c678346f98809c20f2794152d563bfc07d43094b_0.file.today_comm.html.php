<?php
/* Smarty version 3.1.29, created on 2017-03-16 14:37:04
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_running\today_comm.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca3290aa40d6_78986157',
  'file_dependency' => 
  array (
    'c678346f98809c20f2794152d563bfc07d43094b' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_running\\today_comm.html',
      1 => 1489412317,
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
function content_58ca3290aa40d6_78986157 ($_smarty_tpl) {
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
        var page_count = '<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
        var commodity_list =<?php echo $_smarty_tpl->tpl_vars['commodity_list_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_running/Today_comm.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_running/today_comm.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div>
    <div id="admin_running-today_comm-div">
        <?php if ($_smarty_tpl->tpl_vars['commodity_list']->value != null) {?>
            <?php
$_from = $_smarty_tpl->tpl_vars['commodity_list']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_commodity_0_saved_item = isset($_smarty_tpl->tpl_vars['commodity']) ? $_smarty_tpl->tpl_vars['commodity'] : false;
$_smarty_tpl->tpl_vars['commodity'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['commodity']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['commodity']->value) {
$_smarty_tpl->tpl_vars['commodity']->_loop = true;
$__foreach_commodity_0_saved_local_item = $_smarty_tpl->tpl_vars['commodity'];
?>
                <div class="commodity-item">
                    <img src="<?php echo $_smarty_tpl->tpl_vars['commodity']->value['pictures_url'][0];?>
">
                    <p><?php echo $_smarty_tpl->tpl_vars['commodity']->value['name'];?>
</p>
                    <p><?php echo $_smarty_tpl->tpl_vars['commodity']->value['modify_time'];?>
</p>
                    <div class="commodity-good-check">
                        <input type="checkbox" name="good_comm" value="<?php echo $_smarty_tpl->tpl_vars['commodity']->value['id'];?>
">选优
                    </div>
                </div>
            <?php
$_smarty_tpl->tpl_vars['commodity'] = $__foreach_commodity_0_saved_local_item;
}
if ($__foreach_commodity_0_saved_item) {
$_smarty_tpl->tpl_vars['commodity'] = $__foreach_commodity_0_saved_item;
}
?>
        <?php } else { ?>
        <p>今日没有商品</p>
        <?php }?>
    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

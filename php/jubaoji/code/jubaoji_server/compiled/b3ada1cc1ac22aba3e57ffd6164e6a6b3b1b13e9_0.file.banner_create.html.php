<?php
/* Smarty version 3.1.29, created on 2017-03-26 17:10:55
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_running\banner_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d7859f0145f2_06414888',
  'file_dependency' => 
  array (
    'b3ada1cc1ac22aba3e57ffd6164e6a6b3b1b13e9' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_running\\banner_create.html',
      1 => 1490519436,
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
function content_58d7859f0145f2_06414888 ($_smarty_tpl) {
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
        var banner_list =<?php echo $_smarty_tpl->tpl_vars['banner_list_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_running/Banner_create.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_running/banner_create.css" rel="stylesheet" />
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
    <div id="admin_running-banner_create-list-div">
        <?php
$_from = $_smarty_tpl->tpl_vars['banner_list']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_banner_0_saved_item = isset($_smarty_tpl->tpl_vars['banner']) ? $_smarty_tpl->tpl_vars['banner'] : false;
$_smarty_tpl->tpl_vars['banner'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['banner']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['banner']->value) {
$_smarty_tpl->tpl_vars['banner']->_loop = true;
$__foreach_banner_0_saved_local_item = $_smarty_tpl->tpl_vars['banner'];
?>
            <div class="banner-div">
                <img class="banner" src="<?php echo $_smarty_tpl->tpl_vars['banner']->value['image_url'];?>
"/>
                <img class="img_button delete" name="<?php echo $_smarty_tpl->tpl_vars['banner']->value['id'];?>
" src="images/btn_delete.jpg"/>
            </div>
        <?php
$_smarty_tpl->tpl_vars['banner'] = $__foreach_banner_0_saved_local_item;
}
if ($__foreach_banner_0_saved_item) {
$_smarty_tpl->tpl_vars['banner'] = $__foreach_banner_0_saved_item;
}
?>
    </div>
    <div id="admin_running-banner_create-div">
        <form id="admin_running-banner_create-form">
            <div class="banner-image">
                <p>添加图片</p>
                <img src="images/addimg.jpeg" width="90px" height="90px"/>
                <input name="image" type="file" style="display: none"/>
            </div>
            <div class="banner-submit">
                <input type="submit" value="提交">
            </div>
        </form>
    </div>
</div>

</body>
</html><?php }
}

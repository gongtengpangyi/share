<?php
/* Smarty version 3.1.29, created on 2017-03-26 17:09:21
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_running\article_list.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d785417c7ab1_86785244',
  'file_dependency' => 
  array (
    'ad950c1040ea2290695eee6a45e71250d2266352' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_running\\article_list.html',
      1 => 1490443788,
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
function content_58d785417c7ab1_86785244 ($_smarty_tpl) {
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
        var page_count = '<?php echo $_smarty_tpl->tpl_vars['page_count']->value;?>
';
        var article_list =<?php echo $_smarty_tpl->tpl_vars['article_list_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_running/Article_list.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_running/article_list.css" rel="stylesheet" />
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
        <?php if ($_smarty_tpl->tpl_vars['article_list']->value != null) {?>
            <?php
$_from = $_smarty_tpl->tpl_vars['article_list']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_article_0_saved_item = isset($_smarty_tpl->tpl_vars['article']) ? $_smarty_tpl->tpl_vars['article'] : false;
$_smarty_tpl->tpl_vars['article'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['article']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['article']->value) {
$_smarty_tpl->tpl_vars['article']->_loop = true;
$__foreach_article_0_saved_local_item = $_smarty_tpl->tpl_vars['article'];
?>
                <div class="article-item" id="admin_running-article_list-item<?php echo $_smarty_tpl->tpl_vars['article']->value['id'];?>
">
                    <p class="article-title"><?php echo $_smarty_tpl->tpl_vars['article']->value['title'];?>
</p>
                    <p class="article-subtitle"><?php echo $_smarty_tpl->tpl_vars['article']->value['subtitle'];?>
</p>
                    <p class="article-create_time"><?php echo $_smarty_tpl->tpl_vars['article']->value['create_time'];?>
</p>
                </div>
            <?php
$_smarty_tpl->tpl_vars['article'] = $__foreach_article_0_saved_local_item;
}
if ($__foreach_article_0_saved_item) {
$_smarty_tpl->tpl_vars['article'] = $__foreach_article_0_saved_item;
}
?>
        <?php } else { ?>
            <P>暂时没有文章</P>
        <?php }?>
        <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    </div>
</body>
</html><?php }
}

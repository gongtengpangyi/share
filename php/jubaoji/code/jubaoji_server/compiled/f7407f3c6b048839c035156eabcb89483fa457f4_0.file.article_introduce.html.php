<?php
/* Smarty version 3.1.29, created on 2017-03-23 20:24:39
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_running\article_introduce.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d3be87e3f8f0_54137548',
  'file_dependency' => 
  array (
    'f7407f3c6b048839c035156eabcb89483fa457f4' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_running\\article_introduce.html',
      1 => 1490271865,
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
function content_58d3be87e3f8f0_54137548 ($_smarty_tpl) {
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
        var article = <?php echo $_smarty_tpl->tpl_vars['article_json']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="js/admin_running/Article_introduce.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_running/article_introduce.css" rel="stylesheet" />
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
        <img id="admin_running-article_introduce-btn-delete" class="img_button" src="images/btn_delete.jpg">
        <img id="admin_running-article_introduce-btn-modify" class="img_button" src="images/btn_write.jpg">
        <div id="admin_running-article_introduce-div">
            <?php if ($_smarty_tpl->tpl_vars['article']->value != null) {?>
            <div class="article-title text"><?php echo $_smarty_tpl->tpl_vars['article']->value['title'];?>
</div>
            <div class="article-subtitle text"><?php echo $_smarty_tpl->tpl_vars['article']->value['subtitle'];?>
</div>
            <div class="article-image">
                <img src="<?php echo $_smarty_tpl->tpl_vars['article']->value['image_url'];?>
">
            </div>
            <pre class="article-content"><?php echo $_smarty_tpl->tpl_vars['article']->value['content'];?>
</pre>
            <?php } else { ?>
                <p>没有该文章</p>
            <?php }?>
        </div>
        <img id="admin_running-article_introduce-btn-save" class="img_button hide" src="images/btn_save.jpg">
    </div>
</body>
</html><?php }
}

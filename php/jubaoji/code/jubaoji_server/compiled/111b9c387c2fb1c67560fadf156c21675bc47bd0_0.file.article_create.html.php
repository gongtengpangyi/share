<?php
/* Smarty version 3.1.29, created on 2017-03-26 17:07:52
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_running\article_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58d784e861d831_57996545',
  'file_dependency' => 
  array (
    '111b9c387c2fb1c67560fadf156c21675bc47bd0' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_running\\article_create.html',
      1 => 1490443788,
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
function content_58d784e861d831_57996545 ($_smarty_tpl) {
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
 src="js/admin_running/Article_create.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_running/article_create.css" rel="stylesheet" />
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
    <div id="admin_running-article_create-div">
        <form id="admin_running-article_create-form">
            <div class="article-title">
                <input type="text" name="title" placeholder="请输入标题">
            </div>
            <div class="article-subtitle">
                <input type="text" name="subtitle" placeholder="请输入副标题">
            </div>
            <div class="article-image">
                <p>添加图片</p>
                <img src="images/addimg.jpeg" width="90px" height="90px"/>
                <input name="image" type="file" style="display: none"/>
            </div>
            <div class="article-content">
                <textarea name="content" placeholder="请输入正文"></textarea>
            </div>
            <button id="admin_running-article_create-submit">提交</button>
        </form>
    </div>

</div>


</body>
</html><?php }
}

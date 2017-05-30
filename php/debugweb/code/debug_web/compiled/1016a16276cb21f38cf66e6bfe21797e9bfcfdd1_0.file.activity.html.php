<?php
/* Smarty version 3.1.29, created on 2017-03-16 06:08:46
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\team\activity.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca2beeced8d6_58047820',
  'file_dependency' => 
  array (
    '1016a16276cb21f38cf66e6bfe21797e9bfcfdd1' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\team\\activity.html',
      1 => 1487677551,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:title.html' => 1,
  ),
),false)) {
function content_58ca2beeced8d6_58047820 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php echo $_smarty_tpl->tpl_vars['activity_title']->value;?>
</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
>
        var activity_id='<?php echo $_smarty_tpl->tpl_vars['activity_id']->value;?>
';
        var user_name='<?php echo $_smarty_tpl->tpl_vars['user_name']->value;?>
';
        var user_id='<?php echo $_smarty_tpl->tpl_vars['user_id']->value;?>
';
        var activity_picture='<?php echo $_smarty_tpl->tpl_vars['activity_picture']->value;?>
';
        var activity_title='<?php echo $_smarty_tpl->tpl_vars['activity_title']->value;?>
';
        var activity_time='<?php echo $_smarty_tpl->tpl_vars['activity_time']->value;?>
';
        var activity_sections=<?php echo $_smarty_tpl->tpl_vars['activity_sections']->value;?>
;
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript" src="js/team.js"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/team.css" rel="stylesheet"/>
</head>
<body class="activity">
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:title.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<img id="team-activity-delete-btn" class="btn show-limit-user1 show-limit-user0 show-limit-admin" src="img/btn_delete.jpg">
<img id="team-activity-write-btn" class="btn show-limit-user1 show-limit-user0 show-limit-admin" src="img/btn_write.jpg">
<div id="activity-write-tool-dialog">
    <button id="activity-write-btn-addImg">添加图片</button>
    <button id="activity-write-btn-addP">添加段落</button>
    <button id="activity-write-btn-delObj">删除元素</button>
    <button id="activity-write-btn-save">保存</button>
    <button id="activity-write-btn-exit">取消</button>
</div>
<div id="team-activity-div">
    <div class="title"><?php echo $_smarty_tpl->tpl_vars['activity_title']->value;?>
</div>
</div>
    <div class="writer">作者： <?php echo $_smarty_tpl->tpl_vars['user_name']->value;?>
</div>
    <div class="time">活动时间： <?php echo $_smarty_tpl->tpl_vars['activity_time']->value;?>
</div>
</body>
</html><?php }
}

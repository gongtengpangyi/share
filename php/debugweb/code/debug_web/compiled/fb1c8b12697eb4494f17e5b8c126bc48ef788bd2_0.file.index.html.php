<?php
/* Smarty version 3.1.29, created on 2017-03-16 06:00:58
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\team\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca2a1aba2697_88986530',
  'file_dependency' => 
  array (
    'fb1c8b12697eb4494f17e5b8c126bc48ef788bd2' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\team\\index.html',
      1 => 1487677550,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
    'file:title.html' => 1,
    'file:banner.html' => 1,
  ),
),false)) {
function content_58ca2a1aba2697_88986530 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>团队风采</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 type="text/javascript" src="js/team.js"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/team.css" rel="stylesheet"/>
</head>
<body class="team">
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:title.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:banner.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="team-honors" class="honors">
    <p class="title">荣誉墙</p>
    <div id="team-honors-more" class="more">更多</div>
    <img id="team-honors-add-btn" class="btn show-limit-user1 show-limit-user0 show-limit-admin" src="img/btn_add.jpg">
</div>
<div id="team-divide" class="divide"></div>
<div id="team-activities" class="activities">
</div>
<div id="team-activities-more" class="more">更多</div>
<img id="team-activities-add-btn" class="btn show-limit-user1 show-limit-user0" src="img/btn_add.jpg">
</body>
</html><?php }
}

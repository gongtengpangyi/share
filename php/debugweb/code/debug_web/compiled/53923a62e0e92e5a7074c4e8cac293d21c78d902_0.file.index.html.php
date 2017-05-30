<?php
/* Smarty version 3.1.29, created on 2017-03-16 04:50:36
  from "D:\php\apache2.4\Apache24\htdocs\debug_web\www\templates\home\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca199c59d5d5_34589620',
  'file_dependency' => 
  array (
    '53923a62e0e92e5a7074c4e8cac293d21c78d902' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\debug_web\\www\\templates\\home\\index.html',
      1 => 1487677555,
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
function content_58ca199c59d5d5_34589620 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 type="text/javascript" src="js/home.js"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/home.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:title.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:banner.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="home" class="home">
    <p id="home-title-teachers" class="home-title">指导老师</p>
    <img id="home-teachers-add-btn" class="btn show-limit-user0 show-limit-admin" src="img/btn_add.jpg">
    <hr class="small"/>
    <p class="home-title">主要方向</p>
        <div id="home-majors" class="home-majors"></div>
        <img id="home-majors-add-btn" class="btn show-limit-user0 show-limit-admin" src="img/btn_add.jpg">
    <hr class="small"/>
    <div id="home-admin" class="home-admin"></div>
</div>
<!--添加教师窗口-->
<div id="home-teachers-add-div" class="home-teachers">
    <img src="img/user_icon.jpg" class="home-teachers-add-icon"/>
    <input type="text" class="home-teachers-add-account home-teachers-add-name" placeholder="请输入账号">
    <input type="text" class="home-teachers-add-username home-teachers-add-name" placeholder="请输入姓名">
    <div class="home-teachers-add-majors">
        <p>请选择专业方向:</p>
    </div>
    <textarea type="text" class="home-teachers-add-introduce" placeholder="请输入详细介绍"></textarea>
    <img id="home-teachers-add-save" src="img/btn_save.jpg" class="btn"/>
</div>
<!--添加方向窗口-->

</body>
</html><?php }
}

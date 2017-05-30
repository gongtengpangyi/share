<?php
/* Smarty version 3.1.29, created on 2017-03-16 21:04:30
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\session_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ca8d5ec6a4d7_99086922',
  'file_dependency' => 
  array (
    'a560b7dd3ab363df74d2b7e4e7db3f36952c9971' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\session_create.html',
      1 => 1489669468,
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
function content_58ca8d5ec6a4d7_99086922 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/admin_commodity/Session_create.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_commodity/session_create.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
创建拍场-->
<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div><!--标题 可公用-->
    <div class="comm_create_descriptionWrap">
        <ul class="comm_create_description">
            <li><span>新专场名称</span><input type="text"/></li>
            <li>
                <span>新专场介绍</span>
                <textarea rows="3" cols="20"></textarea>
            </li>
            <li><span>专场开拍日期</span><input type="date" id="datepicker"/></li>
            <li>
                <span>专场开始时间</span>
                <input type="time" name="timepicker" class="time_element"/>
                <span>专场结束时间</span>
                <input type="time" name="timepicker" class="time_element"/>
            </li>
            <li>
                <span>专场宣传图</span>
                <img style="width:100px;height: 100px;" src="../../images/addimg.jpeg"/>
            </li>
        </ul>
        <div class="comm_create_submit"><input type="button" value="确认完成创建"/></div>
    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

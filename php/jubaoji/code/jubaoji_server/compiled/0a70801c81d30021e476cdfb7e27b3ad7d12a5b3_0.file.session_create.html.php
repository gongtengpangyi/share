<?php
/* Smarty version 3.1.29, created on 2017-04-18 14:19:26
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\session_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58f5afeee14c07_62903215',
  'file_dependency' => 
  array (
    '0a70801c81d30021e476cdfb7e27b3ad7d12a5b3' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\session_create.html',
      1 => 1490860526,
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
function content_58f5afeee14c07_62903215 ($_smarty_tpl) {
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
    <form id="admin_commodity-session_create-form">
        <ul class="session_create_description">
            <li class="session_create_name">
                <span>新专场名称</span>
                <input type="text"  name="title"/>
            </li>
            <li class="session_create_intr">
                <span>新专场介绍</span>
                <textarea rows="3" cols="20" name="introduction"></textarea>
            </li>
            <li class="session_create_content">
                <span>新专场内容</span>
                <textarea rows="6" cols="40" name="content"></textarea>
            </li>
            <li class="session_create_datepicker">
                <span>专场开拍日期</span>
                <input type="date" id="admin_commodity-session_create-date"/>
            </li>
            <li class="session_create_timepicker">
                <span>专场开始时间</span>
                <input type="time" id="admin_commodity-session_create-start_time" class="time_element"/>
                <span>专场结束时间</span>
                <input type="time" id="admin_commodity-session_create-end_time" class="time_element"/>
            </li>
            <li class="session-image">
                <p>专场宣传图</p>
                <img src="images/addimg.jpeg" width="90px" height="90px" style="cursor: pointer"/>
                <input name="image" type="file" style="display: none"/>
            </li>
        </ul>
        <!--<div class="session_create_submit"><input type="button" value="确认完成创建"/></div>-->
        <button style="cursor: pointer" id="session_create_submit">确认完成创建</button>
    </form>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

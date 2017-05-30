<?php
/* Smarty version 3.1.29, created on 2017-03-14 14:34:02
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_home\index.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58c78edab744e0_68491703',
  'file_dependency' => 
  array (
    '86de8b5d7a78727f446a961cf3010775da473d98' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_home\\index.html',
      1 => 1489473129,
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
function content_58c78edab744e0_68491703 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/Admin_home.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_home.css" rel="stylesheet" />
</head>
<body>
    <!--导入头部-->
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--导入导航-->
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--主页面-->
    <div class="main">

            <div class="main-title">
                <strong>首页</strong>
            </div><!--标题 可公用-->
            <div class="main-part">
                <link type="text/css" href="css/index.css" rel="stylesheet" />
                    <ul>
                        <li><a href="index.php?controller=admin_commodity&action=comm_audit">拍品审核<?php echo $_smarty_tpl->tpl_vars['comm_audit_num']->value;?>
</a></li>
                        <li><a href="index.php?controller=admin_organization&action=org_list">机构总数<?php echo $_smarty_tpl->tpl_vars['org_list_num']->value;?>
</a></li>
                        <li><a href="index.php?controller=admin_organization&action=audit">审核机构入驻<?php echo $_smarty_tpl->tpl_vars['org_audit_num']->value;?>
</a></li>
                    </ul>
                    <ul>
                        <li><a href="index.php?controller=admin_user&action=all_list">总注册用户数<?php echo $_smarty_tpl->tpl_vars['all_list_num']->value;?>
</a></li>
                        <li><a href="index.php?controller=admin_user&action=today_list">今日注册用户数<?php echo $_smarty_tpl->tpl_vars['today_list_num']->value;?>
</a></li>
                        <li><a href="index.php?controller=admin_user&action=day_active_list">日活用户数<?php echo $_smarty_tpl->tpl_vars['day_active_list_num']->value;?>
</a></li>
                    </ul>

            </div>







    </div>
</body>
</html><?php }
}

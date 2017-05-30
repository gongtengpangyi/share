<?php
/* Smarty version 3.1.29, created on 2017-03-30 15:54:08
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\comm_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58dcb9a0e9d395_56360359',
  'file_dependency' => 
  array (
    '0dc8ee90266116cb74ec725823c84b5d1153c124' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\comm_create.html',
      1 => 1490860444,
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
function content_58dcb9a0e9d395_56360359 ($_smarty_tpl) {
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
 src="js/admin_commodity/Comm_create.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/admin_commodity/comm_create.css" rel="stylesheet" />
</head>
<body>
<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:header.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:admin_left.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <!--<?php echo $_smarty_tpl->tpl_vars['location']->value;?>
创建拍品-->
<div class="main">
    <div class="main-title">
        <strong><?php echo $_smarty_tpl->tpl_vars['location']->value;?>
</strong>
    </div><!--标题 可公用-->
    <div id="admin_commodity-comm_create-div"><!--拍品基本信息-->
        <div><h2>拍品基本信息</h2></div>
        <form id="admin_commodity-comm_create-form">
            <ul class="comm_create_description">
                <li class="comm_create_name"><span>拍品名称</span><input type="text" name="name"></li>
                <li>
                    <span>拍品分类</span>
                    <select name="type">
                        <option value="0">玉翠珠宝</option>
                        <option value="1">奢侈品</option>
                        <option value="2">水墨篆刻</option>
                        <option value="3">西画雕塑</option>
                        <option value="4">紫砂陶瓷</option>
                        <option value="5">工艺品</option>
                        <option value="6">文玩收藏</option>
                        <option value="7">茶酒滋补</option>
                        <option value="8">特色</option>
                    </select>
                </li>
                <li class="comm_create_intr">
                    <span>拍品介绍</span><textarea rows="5" cols="30" name="introduction"></textarea>
                </li>
                <li class="comm_create_desc">
                    <span>拍品描述</span><textarea rows="10" cols="50" name="describing"></textarea>
                </li>
                <li class="comm_create_price">
                    <span>保留价</span>
                    <input type="text" name="reserve_price">
                    <span>封顶价</span>
                    <input type="text" name="capped_price">
                </li>
                <li>
                    <span>自定义参数：</span>
                    <input id="add_new_canshu" type="button" value="点击添加属性" style="cursor: pointer"/>
                    <ul id="new_canshu"></ul>
                </li>
                <li>
                    <span>拍品图片</span>
                    <div id="imggroup_wrap">
                        <div class="img_div">
                            <img  border="0" src="images/addimg.jpeg" width="90" height="90" style="cursor: pointer" >
                            <input type="file" name="image[]" style="display: none;">
                        </div>
                        <div class="img_div">
                            <img  border="0" src="images/addimg.jpeg" width="90" height="90" style="cursor: pointer">
                            <input type="file" name="image[]" style="display: none;">
                        </div>
                        <div class="img_div">
                            <img  border="0" src="images/addimg.jpeg" width="90" height="90" style="cursor: pointer">
                            <input type="file" name="image[]" style="display: none;">
                        </div>
                        <div class="img_div" >
                            <span id="add_pic" style="width: 90px; height: 90px; border: 1px solid; cursor: pointer;">点击添加更多图片</span>
                        </div>
                    </div>
                </li>
            </ul>
            <button id="comm_create_submit">确认提交拍品</button>
        </form>

    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

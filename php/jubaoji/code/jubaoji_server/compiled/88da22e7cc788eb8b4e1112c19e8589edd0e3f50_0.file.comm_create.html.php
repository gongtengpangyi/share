<?php
/* Smarty version 3.1.29, created on 2017-03-18 12:06:42
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_commodity\comm_create.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58ccb2521fdbc8_41425351',
  'file_dependency' => 
  array (
    '88da22e7cc788eb8b4e1112c19e8589edd0e3f50' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_commodity\\comm_create.html',
      1 => 1489756830,
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
function content_58ccb2521fdbc8_41425351 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
    <div class="comm_create_descriptionWrap"><!--拍品基本信息-->
        <div><h2>拍品基本信息</h2></div>
        <ul class="comm_create_description">
            <li><span>拍品名称</span><input type="text"/></li>
            <li>
                <span>拍品分类</span>
                <select>
                    <option>玉翠珠宝</option>
                    <option>奢侈品</option>
                    <option>水墨篆刻</option>
                    <option>西画雕塑</option>
                    <option>紫砂陶瓷</option>
                    <option>工艺品</option>
                    <option>文玩收藏</option>
                    <option>茶酒滋补</option>
                    <option>特色</option>
                </select>
            </li>
            <li>
                <span>拍品介绍</span><textarea rows="3" cols="20"></textarea>
            </li>
            <li><span>保留价</span><input type="text"><span>封顶价</span><input type="text"/></li>
            <li>
                <span>自定义参数：</span>
                <input id="add_new_canshu" type="button" value="点击添加属性"/>
                <ul id="new_canshu"></ul>
            </li>
            <li>
                <span>拍品图片</span>
                <div id="imggroup_wrap">
                    <div class="img_div">
                        <img  border="0" src="../../images/addimg.jpeg" width="90" height="90" >
                        <input type="file" style="display: none;">
                    </div>
                    <div class="img_div">
                        <img  border="0" src="../../images/addimg.jpeg" width="90" height="90" >
                        <input type="file" style="display: none;">
                    </div>
                    <div class="img_div">
                        <img  border="0" src="../../images/addimg.jpeg" width="90" height="90" >
                        <input type="file" style="display: none;">
                    </div>
                    <div class="img_div" >
                        <span id="add_pic" style="width: 90px; height: 90px; border: 1px solid">点击添加更多图片</span>
                        <input type="file" style="display: none;">
                    </div>
                </div>
            </li>
        </ul>
        <div class="comm_create_submit"><input type="button" value="确认提交拍品"/></div>
    </div>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:pageGro.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>
</body>
</html><?php }
}

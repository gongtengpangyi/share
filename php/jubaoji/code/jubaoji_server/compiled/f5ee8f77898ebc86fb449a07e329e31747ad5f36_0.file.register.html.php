<?php
/* Smarty version 3.1.29, created on 2017-03-30 15:50:35
  from "D:\php\apache2.4\Apache24\htdocs\jubaoji_server\www\templates\login\register.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58dcb8cb430630_82256433',
  'file_dependency' => 
  array (
    'f5ee8f77898ebc86fb449a07e329e31747ad5f36' => 
    array (
      0 => 'D:\\php\\apache2.4\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\login\\register.html',
      1 => 1490860226,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:common.html' => 1,
  ),
),false)) {
function content_58dcb8cb430630_82256433 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>机构入驻申请表</title>
    <?php $_smarty_tpl->smarty->ext->_subtemplate->render($_smarty_tpl, "file:common.html", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

    <?php echo '<script'; ?>
 src="js/login/Register.js" type="text/javascript"><?php echo '</script'; ?>
>
    <link type="text/css" href="css/reset.css" rel="stylesheet" />
    <link type="text/css" href="css/register.css" rel="stylesheet" />
</head>
<body>

    <div id="header">
        <div class="title">
            <strong>聚宝集</strong>
        </div>
        <div class="hr"></div>
    </div>
    <div class="contain">
        <div class="mechanism">
            <div class="mechanism-main-title"><h2>机构入驻申请表</h2></div>

            <form id="login-register-form">
                <div class="common">
                    <span>机构名称</span>
                    <input class="fill-in">
                </div>
                <div class="mechanism-license">
                    <span>机构执照</span>
                    <label>上传图片</label>
                    <div class="input-group">
                            <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                            <input type="file" style="display: none;">
                    </div>
                </div>
                <div class="mechanism-ID">
                    <p>机构法人代表身份证</p>
                    <span>正面</span>
                    <label>上传图片</label>
                    <span class="mechanism-ID_front">
                        <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                        <input type="file" style="display: none;">
                    </span>
                    <span>反面</span>
                    <label>上传图片</label>
                    <span class="mechanism-ID_behind">
                        <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                        <input type="file" style="display: none;">
                    </span>
                </div>
                <div class="mechanism-legal-name">
                    <span>机构负责人姓名</span>
                    <input class="fill-in">
                </div>
                <div class="mechanism-legal-person">
                    <span>机构负责人联系方式</span>
                    <input class="fill-in">
                </div>
                <div class="mechanism-contact-information">
                    <span>机构联系方式</span>
                    <input class="fill-in">
                </div>
                <div class="mechanism-head-portrait">
                    <span>机构头像</span>
                    <label>上传图片</label>
                    <div class="input-group">
                            <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                            <input type="file" style="display: none;">
                    </div>
                </div>
                <div class="mechanism-authentication">
                    <span>机构拍卖认证</span>
                    <p>（上传10张不同角度拍品的照片）</p>
                    <ul>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;"class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                        <li class="input-group">
                                <img  border="0" src="images/addimg.jpeg" width="90" height="90" >
                                <input type="file" style="display: none;" class="myfile">
                            </li>
                    </ul>
                </div>
                <button id="submit-applications">提交申请</button>
            </form>

        </div>

    </div>
</body>
</html><?php }
}

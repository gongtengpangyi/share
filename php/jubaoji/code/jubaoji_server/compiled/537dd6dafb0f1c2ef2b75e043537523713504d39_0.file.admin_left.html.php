<?php
/* Smarty version 3.1.29, created on 2017-03-14 14:34:02
  from "C:\php\Apache24\htdocs\jubaoji_server\www\templates\admin_left.html" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58c78edab9b734_57990137',
  'file_dependency' => 
  array (
    '537dd6dafb0f1c2ef2b75e043537523713504d39' => 
    array (
      0 => 'C:\\php\\Apache24\\htdocs\\jubaoji_server\\www\\templates\\admin_left.html',
      1 => 1489473129,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58c78edab9b734_57990137 ($_smarty_tpl) {
?>
<!--官方导航-->
<div id="admin-left" class="left">
    <ul class="menu">
        <li>
            <span id="admin_commodity-left-menu">拍品管理</span>
            <ul id="admin_commodity-left-menu-item" class="menuItem">
                <li id="admin_commodity-comm_create-item">创建拍品</li>
                <li id="admin_commodity-comm_list-item">全部拍品</li>
                <li id="admin_commodity-comm_audit-item">拍品审核</li>
                <li id="admin_commodity-session_create-item">创建拍场</li>
                <li id="admin_commodity-session_list-item">全部拍场</li>
            </ul>
        </li>
        <li>
            <span id="admin_organization-left-menu">机构管理</span>
            <ul id="admin_organization-left-menu-item" class="menuItem">
                <li id="admin_organization-org_list-item">机构列表</li>
                <li id="admin_organization-audit-item">待审核机构</li>
            </ul>
        </li>
        <li>
            <span id="admin_auction-left-menu">拍卖管理</span>
            <ul id="admin_auction-left-menu-item" class="menuItem">
                <li id="admin_auction-going-item">待开拍拍卖</li>
                <li id="admin_auction-waiting-item">进行中拍卖</li>
            </ul>
        </li>
        <li>
            <span  id="admin_running-left-menu">运营管理</span>
            <ul id="admin_running-left-menu-item" class="menuItem">
                <li id="admin_running-banner_create-item">创建广告</li>
                <li id="admin_running-article_create-item">创建文章</li>
                <li id="admin_running-article_list-item">所有文章</li>
                <li id="admin_running-today_comm-item">日拍选优</li>
            </ul>
        </li>
        <li>
            <span  id="admin_money-left-menu">财务管理</span>
            <ul id="admin_money-left-menu-item" class="menuItem">
                <li id="admin_money-cash-item">保证金</li>
                <li id="admin_money-gallery-item">通道费用</li>
                <li id="admin_money-user-item">用户佣金</li>
                <li id="admin_money-non_payment-item">未成交</li>
                <li id="admin_money-payment-item">成交额</li>
            </ul>
        </li>
        <li>
            <span id="admin_form-left-menu">订单管理</span>
            <ul id="admin_form-left-menu-item" class="menuItem">
                <li id="admin_form-organization-item">机构订单</li>
                <li id="admin_form-admin-item">官方订单</li>
                <li id="admin_form-all-item">总订单</li>
            </ul>
        </li>
        <li>
            <span id="admin_logistic-left-menu">物流管理</span>
            <ul id="admin_logistic-left-menu-item" class="menuItem">
                <li id="admin_logistic-waiting_list-item">未发货</li>
                <li id="admin_logistic-way_list-item">已发货</li>
                <li id="admin_logistic-finish_list-item">已到货</li>
            </ul>
        </li>
        <li>
            <span id="admin_user-left-menu">用户管理</span>
            <ul id="admin_user-left-menu-item" class="menuItem">
                <li id="admin_user-all_list-item">总注册用户</li>
                <li id="admin_user-today_list-item">今日注册用户</li>
                <li id="admin_user-day_active_list-item">今日活跃用户</li>
                <li id="admin_user-month_active_list-item">本月活跃用户</li>
            </ul>
        </li>
        <li>
            <span id="admin_left-menu-span8">信誉管理</span>
            <ul id="admin_left-menu-span8-item" class="menuItem">

            </ul>
        </li>
    </ul>

</div><?php }
}

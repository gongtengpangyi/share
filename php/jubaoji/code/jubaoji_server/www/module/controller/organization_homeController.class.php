<?php

/**
 * 首页控制
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class organization_homeController extends commonController
{

    /**
     * 显示主页面
     */
    public function index(){
        $this->assign("home_href","organization_home");
        $this->assign("home_name","机构主页");
        $this->assign("location","创建拍品");
        $this->assign("name","organization");
        $this->display();
    }


}
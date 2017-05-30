<?php

/**
 * 用户管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_userController extends commonController
{

    /**
     * 总注册用户
     */
    public function all_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","总注册用户");
        $this->display();
    }

    /**
     * 今日注册用户
     */
    public function today_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","今日注册用户");
        $this->display();
    }

    /**
     * 今日活跃用户
     */
    public function day_active_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","今日活跃用户");
        $this->display();
    }

    /**
     * 本月活跃用户
     */
    public function month_active_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","本月活跃用户");
        $this->display();
    }


}
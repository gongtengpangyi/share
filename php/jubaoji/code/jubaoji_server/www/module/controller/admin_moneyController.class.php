<?php

/**
 * 财务管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_moneyController extends commonController
{

    /**
     * 保证金
     */
    public function cash(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","保证金");
        $this->display();
    }

    /**
     * 通道费用
     */
    public function gallery(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","通道费用");
        $this->display();
    }

    /**
     * 用户佣金
     */
    public function user(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","用户佣金");
        $this->display();
    }

    /**
     * 未成交
     */
    public function non_payment(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","未成交");
        $this->display();
    }

    /**
     * 成交额
     */
    public function payment(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","成交额");
        $this->display();
    }
}
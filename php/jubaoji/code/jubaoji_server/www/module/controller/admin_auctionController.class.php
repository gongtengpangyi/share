<?php

/**
 * 拍卖管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_auctionController extends commonController
{

    /**
     * 待开拍拍卖
     */
    public function going(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","待开拍拍卖");
        $this->display();
    }

    /**
     * 进行中拍卖
     */
    public function waiting(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","进行中拍卖");
        $this->display();
    }

}
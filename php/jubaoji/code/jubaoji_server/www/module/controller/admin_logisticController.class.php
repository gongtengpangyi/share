<?php

/**
 * 物流管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_logisticController extends commonController
{

    /**
     * 未发货
     */
    public function waiting_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","未发货");
        $this->display();
    }

    /**
     * 已发货
     */
    public function way_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","已发货");
        $this->display();
    }

    /**
     * 已到货
     */
    public function finish_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","已到货");
        $this->display();
    }

}
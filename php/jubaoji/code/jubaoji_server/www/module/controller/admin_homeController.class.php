<?php

/**
 * 首页控制
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_homeController extends commonController
{

    /**
     * 显示主页面
     */
    public function index(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","");
        $this->assign("comm_audit_num",(model("commodity")->getCountByParams(array("status"=>-1))));         //拍品审核
        $this->assign("org_list_num",(model("organization")->getCountByParams(array())));           //机构总数
        $this->assign("org_audit_num",(model("organization")->getCountByParams(array("state"=>-1))));          //审核机构入驻
        $this->assign("all_list_num",(model("organization")->getCountByParams(array())));           //总注册用户数
        $this->assign("today_list_num",(model("organization")->getCountByParams(array())));         //今日注册用户数
        $this->assign("day_active_list_num",(model("organization")->getCountByParams(array())));            //日活用户数
        $this->display();
    }

    public function test(){
        print_r (model("organization")->getCountByParams(array()));
    }


}
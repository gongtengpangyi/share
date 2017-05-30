<?php

/**
 * 机构管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_organizationController extends commonController
{

    /**
     * 机构列表页面
     */
    public function org_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","机构列表");
        $num = 5;
        $first = $num * (get("page",1)-1);
        $organizationBiz=model("organization");
        $item_count=$organizationBiz->getCountByParams(array());
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $organizations = $organizationBiz->findManyByParams(array()," ORDER BY ".config("COLUMN_PREFIX")."date DESC LIMIT ".$first.",".$num);
        $organizations_params=array();
        foreach($organizations as $organization){
            array_push($organizations_params, $organization->getParams());
        }
        $this->assign("organization_list", json_encode($organizations_params));
        $this->display();
    }

    /**
     * 待审核机构页面
     */
    public function audit(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","待审核机构");
        $num = 5;
        $first = $num * (get("page",1)-1);
        $organizationBiz=model("organization");
        $item_count=$organizationBiz->getCountByParams(array("state"=>-1));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $organizations = $organizationBiz->findManyByParams(array("state"=>-1)," ORDER BY ".config("COLUMN_PREFIX")."date DESC LIMIT ".$first.",".$num);
        $organizations_params=array();
        foreach($organizations as $organization){
            array_push($organizations_params, $organization->getParams());
        }
        $this->assign("organization", json_encode($organizations_params));
        $this->display();
    }

}
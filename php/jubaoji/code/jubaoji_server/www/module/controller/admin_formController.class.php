<?php

/**
 * 订单管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_formController extends commonController
{
    /**
     * 机构订单
     */
    public function organization(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","机构订单");
        $num=5;
        $first = $num * (get("page",1)-1);
        $commBiz=model("commodity");
        $order_winnerBiz = model("order_winner");
        $item_count=$commBiz->getCountByParams(array("status"=>">=4","seller_id"=>"!=0"));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("status"=>">=4","seller_id"=>"!=0")," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $order_winners=array();
        foreach($commodities as $commodity) {
            $pictures_url = explode(",", $commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $order_winner = $order_winnerBiz->findByParams(array("auction_id" => $commodity->getParam("id")));
            if ($order_winner != null) {
                $order_winner->setParam("commodity", $commodity->getParams());
                $pay_status_names=array("","等待支付","支付完成","超时未支付");
                $order_winner->setParam("pay_status_name",$pay_status_names[(int)($order_winner->getParam("pay_status"))]);
                array_push($order_winners, $order_winner->getParams());
            }
        }
        $this->assign("order_winner_list_json", json_encode($order_winners));
        $this->assign("order_winner_list", $order_winners);
        $this->display();
    }

    /**
     * 官方订单
     */
    public function admin(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","官方订单");
        $num=5;
        $first = $num * (get("page",1)-1);
        $commBiz=model("commodity");
        $order_winnerBiz = model("order_winner");
        $item_count=$commBiz->getCountByParams(array("status"=>">=4","seller_id"=>"0"));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("status"=>">=4","seller_id"=>"0")," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $order_winners=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $order_winner=$order_winnerBiz->findByParams(array("auction_id"=>$commodity->getParam("id")));
            if($order_winner!=null){
                $order_winner->setParam("commodity",$commodity->getParams());
                $pay_status_names=array("","等待支付","支付完成","超时未支付");
                $order_winner->setParam("pay_status_name",$pay_status_names[(int)($order_winner->getParam("pay_status"))]);
                array_push($order_winners, $order_winner->getParams());
            }
        }
        $this->assign("order_winner_list_json", json_encode($order_winners));
        $this->assign("order_winner_list", $order_winners);
        $this->display();
    }

    /**
     * 总订单
     */
    public function all(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","总订单");
        $num=5;
        $first = $num * (get("page",1)-1);
        $commBiz=model("commodity");
        $order_winnerBiz = model("order_winner");
        $item_count=$commBiz->getCountByParams(array("status"=>">=4"));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("status"=>">=4")," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $order_winners=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $order_winner=$order_winnerBiz->findByParams(array("auction_id"=>$commodity->getParam("id")));
            if($order_winner!=null){
                $order_winner->setParam("commodity",$commodity->getParams());
                $pay_status_names=array("","等待支付","支付完成","超时未支付");
                $order_winner->setParam("pay_status_name",$pay_status_names[(int)($order_winner->getParam("pay_status"))]);
                array_push($order_winners, $order_winner->getParams());
            }
        }
        $this->assign("order_winner_list_json", json_encode($order_winners));
        $this->assign("order_winner_list", $order_winners);
        $this->display();
    }

    /**
     * 订单详情
     */
    public function introduce(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","订单详情");
//        $form_id = get("id");
        $order_winner = model("order_winner",array("id"=>get("id")));
        $order_winner = $order_winner->findById();
        $commodity = model("commodity", array("id"=>$order_winner->getParam("id")));
        $commodity = $commodity->findById();
        $pictures_url = explode(",",$commodity->getParam("image_url"));
        $commodity->setParam("pictures_url", $pictures_url);
        $order_winner->setParam("commodity",$commodity->getParams());

    }

}
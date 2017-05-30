<?php

/**
 * 拍品管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_commodityController extends commonController
{
    /**
     * 创建拍品页面
     */
    public function comm_create(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","创建拍品");
        $this->display();
    }

    /**
     * 创建拍品提交
     */
    public function comm_create_submit(){
        $commodity = model("commodity");
        if($commodity->findByParams(array("name"=>post("name")))!=null){
            $this->error("商品已存在");
            return;
        }
        $commodity = model("commodity", post());
        $commodity->delParam("image");
        $now = date(config("TIME_FORMAT"));
        $commodity->setParam("create_time", $now);
        $commodity->setParam("modify_time", $now);
        $commodity->setParam("status", -1);
        try{
            $images_name = $_FILES['image']['name'];
            $i = 0;
            $image_url_array =array();
            foreach($images_name as $image_name){
                $file_name = $this->getFileName($image_name);
                $imgUrl=config("UPLOAD_IMAGE_PATH")."/".$file_name;
                move_uploaded_file($_FILES['image']['tmp_name'][$i], $imgUrl);
                array_push($image_url_array, config("HTTP_GET_IMAGE_PATH")."/".$file_name);
                $i++;
            }
            $commodity->setParam("image_url", implode(",",$image_url_array));
            $commodity->save();
            $this->success("上交成功");
        }catch(Exception $e){
            $this->error("上交失败！！！");
        }
    }

    /**
     * 全部拍品页面
     */
    public function comm_list(){
        $num = 6;
        $first = $num * (get("page",1)-1);
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","全部拍品");
        $commBiz=model("commodity");
        $sessionBiz = model("session");
        $orgBiz = model("organization");
        $item_count=$commBiz->getCountByParams(array("is_deleted"=>0));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("is_deleted"=>0)," ORDER BY ".config("COLUMN_PREFIX")."create_time DESC LIMIT ".$first.",".$num);
        $commParams=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $sessions = $sessionBiz->findManyParamsByParams(array("id","title"),array("id"=>$commodity->getParam("special_id")));
            if(count($sessions)>0){
                $commodity->setParam("session",$sessions[0]->getParams());
            }else{
                $commodity->setParam("session",array("id"=>0,"title"=>"未安排"));
            }
            $organization = $orgBiz->findManyParamsByParams(array("id","name"),array("id"=>$commodity->getParam("seller_id")));
            if(count($organization)>0){
                $commodity->setParam("organization",$organization[0]->getParams());
            }else{
                $commodity->setParam("organization",array("id"=>0,"name"=>"官方"));
            }
            array_push($commParams, $commodity->getParams());
        }
        $this->assign("commodity_list", json_encode($commParams));
        $this->display();
    }

    /**
     * 拍品详细信息
     */
    public function comm_introduce(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","拍品详情");
        $id = get("id");
        $commodity=model("commodity");
        $commodity->setParam("id", $id);
        $commodity = $commodity->findById();
        $pictures_url = explode(",",$commodity->getParam("image_url"));
        $commodity->setParam("pictures_url", $pictures_url);
        $this->assign("commodity_json", json_encode($commodity->getParams()));
        $this->assign("commodity", $commodity->getParams());
        $this->display();
    }

    /**
     * 拍品审核页面
     */
    public function comm_audit(){
        $num = 6;
        $first = $num * (get("page",1)-1);
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","拍品审核");
        $commBiz=model("commodity");
        $sessionBiz = model("session");
        $item_count=$commBiz->getCountByParams(array("status"=>-1,"is_deleted"=>0));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("status"=>-1,"is_deleted"=>0)," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $commParams=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $sessions = $sessionBiz->findManyParamsByParams(array("id","title"),array("start_time"=>"<".date("Y-m-d H:i:s")));
            $sessions_param=array();
            foreach($sessions as $session){
                array_push($sessions_param, $session->getParams());
            }
            $commodity->setParam("sessions",$sessions_param);
            array_push($commParams, $commodity->getParams());
        }
        $this->assign("commodity_list_json", json_encode($commParams));
        $this->assign("commodity_list", $commParams);
        $this->display();
    }

    /**
     * 拍品审核通过
     */
    public function comm_audit_pass(){
        $comm_id = post("comm_id");
        $admin_id = post("admin_id");
        $commodity = model("commodity");
        $commodity->setParam("id",$comm_id);
        $commodity->setParam("admin_id", $admin_id);
        $commodity->setParam("status",0);
        try{
            $commodity->update();
            $this->success("拍品审核通过");
        }catch(Exception $e){
            $this->error("提交失败");
        }
    }

    /**
     * 拍品下架
     */
    public function comm_audit_out(){
        $comm_id = post("comm_id");
        $admin_id = post("admin_id");
        $remark = post("remark","");
        sysout("remark:".$remark);
        //TODO:存备注信息
        $commodity = model("commodity");
        $commodity->setParam("id",$comm_id);
        $commodity->setParam("admin_id", $admin_id);
        $commodity->setParam("status",-2);
        try{
            $commodity->update();
            $this->success("拍品审核驳回");
        }catch(Exception $e){
            $this->error("提交失败");
        }
    }

    /**
     * 展示未分配专场的拍品
     */
    public function not_session_commodity(){
        $num = 6;
        $first = $num * (get("page",1)-1);
        $commBiz=model("commodity");
        $item_count=$commBiz->getCountByParams(array("is_deleted"=>0,"special_id"=>0));
        $commodities = $commBiz->findManyByParams(array("is_deleted"=>0,"special_id"=>0)," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $commParams=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            array_push($commParams, $commodity->getParams());
        }
        $this->success(array("page_count"=>ceil($item_count/$num),"commodity_list"=>$commParams));
    }

    /**
     * 给拍品分配专场
     */
    public function comm_audit_session(){
        $session_id=post("session_id");
        $comm_id=post("comm_id");
        $commodity=model("commodity",array("id"=>$comm_id,"special_id"=>$session_id));
        try{
            $commodity->update();
            $this->success("专场选择成功");
        }catch(Exception $e){
            $this->error("专场选择失败");
        }
    }

    /**
     * 创建拍场页面
     */
    public function session_create(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","创建拍场");
        $this->display();
    }

    /**
     * 创建拍场提交
     */
    public function session_create_submit(){
        sysout(json_encode(post()));
        $session = model("session", post());
        $now = date(config("TIME_FORMAT"));
        $session->setParam("create_time", $now);
        $session->setParam("modify_time", $now);
        try{
            $file_name = $this->getFileName($_FILES['image']['name']);
            $imgUrl=config("UPLOAD_IMAGE_PATH")."/".$file_name;
            move_uploaded_file($_FILES['image']['tmp_name'],$imgUrl);
            $session->setParam("image_url", config("HTTP_GET_IMAGE_PATH")."/".$file_name);
            $session->save();
            $this->success("上交成功");
        }catch(Exception $e){
            $this->error("上交失败！！！");
        }
    }

    /**
     * 全部拍场页面
     */
    public function session_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","全部拍场");
        $num = 3;
        $first = $num * (get("page",1)-1);
        $sessionBiz=model("session");
        $item_count= $sessionBiz->getCountByParams(array());
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $sessions = $sessionBiz->findManyByParams(array()," ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $sessions_params=array();foreach($sessions as $session){
            array_push($sessions_params, $session->getParams());
        }
        $this->assign("session_list", json_encode($sessions_params));
        $this->display();
    }

    /**
     * 拍场详细信息
     */
    public function session_introduce(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","拍场详情");
        $id = get("id");
        $session=model("session");
        $commBiz = model("commodity");
        $session->setParam("id", $id);
        $session = $session->findById();
        $commodities = $commBiz->findManyByParams(array("is_deleted"=>0,"special_id"=>$session->getParam("id")));
        $commParams=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            array_push($commParams, $commodity->getParams());
        }
        $session->setParam("commodity",$commParams);
        $this->assign("session", json_encode($session->getParams()));
        $this->display();
    }

}
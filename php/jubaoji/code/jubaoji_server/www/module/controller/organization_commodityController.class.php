<?php

/**
 * 拍品管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class organization_commodityController extends commonController
{
    /**
     * 创建拍品页面
     */
    public function comm_create(){
        $this->assign("home_href","organization_home");
        $this->assign("home_name","机构主页");
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
        $this->assign("home_href","organization_home");
        $this->assign("home_name","机构主页");
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
        $this->assign("home_href","organization_home");
        $this->assign("home_name","机构主页");
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



}
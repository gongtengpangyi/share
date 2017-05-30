<?php

/**teamController 团队风采页面 */
class teamController extends commonController
{
    /**
     *获取荣誉信息
     */
    public function honors(){
        $biz1=model("honor");
        $honors = $biz1->findManyByParams(array()," ORDER BY ".config("COLUMN_PREFIX")."time DESC LIMIT ".post("json","0").",5");
        $array = array();
        foreach($honors as $honor){
            array_push($array,$honor->getParams());
        }
        $this->success($array);
    }

    /**
     * 添加荣誉
     */
    public function addHonor(){
        $json = json_decode(post("json"),true);
        $honor=model("honor");
        $json["time"]=date("Y-m-d");
        $honor->setParams($json);
        $honor->save();
        $this->success(array());
    }

    /**
     * 删除荣誉
     */
    public function delHonor(){
        $id=post("json");
        $honor=model("honor");
        $honor->setParam("id",$id);
        $honor->delete();
        $this->success(array());
    }

    /**
     *获取活动信息
     */
    public function activities(){
        $biz1=model("activity");
        $activities = $biz1->findManyByParams(array()," ORDER BY ".config("COLUMN_PREFIX")."time DESC LIMIT ".post("json","0").",5");
        $array = array();
        foreach($activities as $activity){
            $activity->setParam("picture",base64_encode($activity->getParam("picture")));
            array_push($array,$activity->getParams());
        }
        $this->success($array);
    }

    /**
     *进入活动页面并且详细活动信息
     */
    public function activity(){
        $activity_id=get("id");
        $this->assign("activity_id",$activity_id);
        $biz1=model("activity");
        $biz1->setParam("id",$activity_id);
        $biz2 = model("user");
        $biz3 = model("section");
        $activity = $biz1->findById();
        $biz2->setParam("id",$activity->getParam("user_id"));
        $this->assign("user_id",$activity->getParam("user_id"));
        $this->assign("user_name",$biz2->findById()->getParam("username"));
        $this->assign("activity_picture",base64_encode($activity->getParam("picture")));
        $this->assign("activity_title", $activity->getParam("title"));
        $this->assign("activity_time", $activity->getParam("time"));
        $sections=$biz3->findManyByParams(array("activity_id"=>$activity->getParam("id")));
        $sections_params=array();
        foreach($sections as $section){
            $section->setParam("picture",base64_encode($section->getParam("picture")));
            array_push($sections_params,$section->getParams());
        }
        $this->assign("activity_sections", json_encode($sections_params));
        $this->display();
    }

    /**
     * 编辑活动内容
     */
    public function writeActivity(){
        try{
            $json=json_decode(post("json"),true);
            $biz1=model("activity");
            $biz2=model("section");
            $biz1->setParam("id",$json["id"]);
            $biz1->setParam("picture",base64_decode($json["picture"]));
            $biz1->setParam("user_id",$json["user_id"]);
            $biz1->setParam("title",$json["title"]);
            $biz1->setParam("time",$json["time"]);
            $biz1->update();
            $sections=$biz2->findManyByParams(array("activity_id"=>$json["id"]));
            foreach($sections as $section){
                $section->delete();
            }
            foreach($json["sections"] as $section){
                $biz2=model("section");
                $biz2->setParam("activity_id",$section["activity_id"]);
                if(array_key_exists("picture",$section)){
                    $biz2->setParam("picture",base64_decode($section["picture"]));
                    $biz2->save();
                }else{
                    $biz2->setParam("text",$section["text"]);
                    $biz2->save();
                }
            }
            $this->success(array("success"=>"true"));
        }catch(Exception $e){
            $this->success(array("success"=>"false"));
        }
    }

    /**
     * 删除活动
     */
    public function delActivity(){
        $id=post("json");
        $biz1=model("activity");
        $biz2=model("section");
        $sections=$biz2->findManyByParams(array("activity_id"=>$id));
        $biz1->setParam("id",$id);
        $biz1->delete();
        foreach($sections as $section){
            $section->delete();
        }
        $this->success(array("success"=>"true"));
    }

    /**
     * 增加活动
     */
    public function addActivity(){
        try{
            $json=json_decode(post("json"),true);
            $activity=model("activity");
            $picture=base64_decode($json["picture"]);
            $json["picture"]=$picture;
            $activity->setParams($json);
            $activity->save();
            $this->success(array("success"=>$activity->getParam("id")));
        }catch(Exception $e){
            $this->success(array("success"=>"false"));
        }
    }

}
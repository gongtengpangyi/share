<?php

/**studentsController 优秀学长页面*/
class studentsController extends commonController
{
    /**
     * 获取学长的信息
     */
    public function seniors(){
        $year= $this->year()-4;
        $biz1 = model("user");
        $biz2 = model("major");
        $seniors = $biz1->findManyByParams(array("usertype"=>1,"entertime"=>"<=".$year), " ORDER BY ".config("COLUMN_PREFIX")."entertime ASC");
        $array = array();
        foreach($seniors as $senior){
            $senior->setParam("icon",base64_encode($senior->getParam("icon")));
            $major_ids=explode(",",$senior->getParam("major_id"));
            $major_names=array();
            foreach($major_ids as $major_id){
                $biz2->setParam("id",(int)$major_id);
                $major=$biz2->findById();
                if($major!=null){
                    array_push($major_names,$major->getParam("name"));
                }
            }
            $senior->setParam("major_name",$major_names);
            array_push($array,$senior->getParams());
        }
        $this->success($array);
    }
}
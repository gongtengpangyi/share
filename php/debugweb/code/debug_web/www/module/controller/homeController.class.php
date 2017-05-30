<?php

/**
 homeController
 */
class homeController extends commonController
{
    /**
     *获取教师信息
     */
    public function teachers(){
        $biz = model("user");
        $teachers = $biz->findManyByParams(array("usertype"=>"=0"));
        $array = array();
        foreach($teachers as $teacher){
            $teacher->setParam("icon",base64_encode($teacher->getParam("icon")));
            array_push($array,$teacher->getParams());
        }
        $this->success($array);
    }

    /**
     *获取方向信息
     */
    public function majors(){
        $biz = model("major");
        $majors = $biz->findAll();
        $array = array();
        foreach($majors as $major){
            array_push($array,$major->getParams());
        }
        $this->success($array);
    }

    /**
     *获取管理员信息
     */
    public function admin(){
        $biz = model("admin");
        $admin = $biz->findAll()[0];
        $this->success($admin->getParams());
    }

    /**
     * 添加方向
     */
    public function addMajor(){
        $json = json_decode(post("json"),true);
        $user=model("major");
        $user->setParams($json);
        $user->save();
        $this->success(array("success"=>1));
    }

    /**
     * 删除方向
     */
    public function delMajor(){
        $major_id=post("json");
        $biz1=model("user");
        $biz2=model("major");
        $users=$biz1->findAll();
        foreach($users as $user){
            if(strpos($user->getParam("major_id"),$major_id) !== false){
                $s=$user->getParam("major_id");
                $s=str_replace($major_id.",","",$s);
                $s=str_replace(",".$major_id,"",$s);
                $s=str_replace($major_id,"",$s);
                $user->delParams();
                $user->setParam("major_id",$s);
                $user->update();
            }
        }
        $biz2->setParam("id",$major_id);
        $biz2->delete();
        $this->success(array());
    }
}
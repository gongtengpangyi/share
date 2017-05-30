<?php

/**talkController 论坛页面控制器*/
class talkController extends commonController
{
    /**
     * 获取每个人的最新report
     */
    public function reports(){
        $biz1 = model("report");
        $biz2 = model("user");
        $reports = $biz1->findAll();
        $array = array();
        foreach($reports as $report){
            $biz2->setParam("id",$report->getParam("user_id"));
            $user=$biz2->findById();
            $report->setParam("user_name",$user->getParam("username"));
            array_push($array,$report->getParams());
        }
        $this->success($array);
    }

    /**
     * 添加周报
     */
    public function addReport(){
        $json = json_decode(post("json"),true);
        $biz=model("report");
        $report = $biz->findByParams(array("user_id"=>$json["user_id"]));
        if($report==null){
            $report=$biz;
            $report->setParam("user_id",$json["user_id"]);
            $report->save();
        }
        $report->setParam("text",$json["text"]);
        $report->setParam("time",date("Y-m-d"));
        $report->update();
        $this->success(array());
    }

    /**
     * 获取学长的信息
     */
    public function students(){
        $year= $this->year()-4;
        $biz1 = model("user");
        $biz2 = model("major");
        $students = $biz1->findManyByParams(array("usertype"=>1,"entertime"=>">".$year));
        $array = array();
        foreach($students as $student){
            $student->setParam("icon",base64_encode($student->getParam("icon")));
            $major_ids=explode(",",$student->getParam("major_id"));
            $major_names=array();
            foreach($major_ids as $major_id){
                $biz2->setParam("id",(int)$major_id);
                $major=$biz2->findById();
                if($major!=null){
                    array_push($major_names,$major->getParam("name"));
                }
            }
            $student->setParam("major_name",$major_names);
            array_push($array,$student->getParams());
        }
        $this->success($array);
    }

    /**
     * 获取帖子消息
     */
    public function invitations(){
        $biz1 = model("invitation");
        $biz2 = model("user");
        $invitations = $biz1->findManyByParams(array("repid"=>0)," ORDER BY ".config("COLUMN_PREFIX")."time DESC LIMIT ".post("json","0").",5");
        $array = array();
        foreach($invitations as $invitation) {
            //对于自发型的帖子要给定发送者名字和头像
            $user_id = $invitation->getParam("user_id");
            $biz2->setParam("id", (int)$user_id);
            $biz2 = $biz2->findById();
            $invitation->setParam("user_name", $biz2->getParam("username"));
            $invitation->setParam("user_icon", base64_encode($biz2->getParam("icon")));
            $repInvis = array();
            array_push($repInvis, $invitation->getParams());
            $i = 0;
            while (count($repInvis) > $i) {
                //遍历（广度优先）得到初始帖的回复贴及其回复贴的回复贴及。。。。
                $repInvi = $repInvis[$i];
                foreach (($biz1->findManyByParams(array("repid" => $repInvi["id"]))) as $invi) {
                    $user_id = $invi->getParam("user_id");
                    $biz2->setParam("id", (int)$user_id);
                    $biz2 = $biz2->findById();
                    $invi->setParam("user_name", $biz2->getParam("username"));
                    $invi->setParam("rep_user_name", $repInvi["user_name"]);
                    array_push($repInvis, $invi->getParams());
                }
                $i++;
            }
            array_shift($repInvis);
            $invitation->setParam("repInvitations", $repInvis);
            array_push($array,$invitation->getParams());
        }
        $this->success($array);
    }

    /**
     *发送帖子
     */
    public function sendInvitation(){
        $json=json_decode(post("json"),true);
        $json["time"]=date("Y-m-d H:i:s");
        $invitation=model("invitation",$json);
        $invitation->save();
        $user=model("user");
        $user->setParam("id",$json["user_id"]);
        $user->findById();
        $invitation->setParam("user_name", $user->getParam("username"));
        $invitation->setParam("user_icon", base64_encode($user->getParam("icon")));
        $this->success(array("success"=>true,"invitation"=>$invitation->getParams()));
    }

    /**
     * 删除帖子
     */
    public function delInvitation(){
        $id=post("json");
        $biz=model("invitation");
        $invitation=model("invitation");
        $invitation->setParam("id",$id);
        $invitation->findById();
        $invitations=array();
        array_push($invitations,$invitation->getParams());
        while(count($invitations)>0){
            $invitation->setParams(array_pop($invitations));
            $q=$biz->findByParams(array("repid"=>$invitation->getParam("id")));
            while($q!=null){
                array_push($invitations,$invitation->getParams());
                $invitation->setParams($q->getParams());
                $q=$biz->findByParams(array("repid"=>$invitation->getParam("id")));
            }
            $invitation->delete();
        }
        $this->success(array("success"=>true));
    }
}
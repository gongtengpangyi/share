<?php

/**commonController 公共控制器
 */
class commonController extends Xcontroller
{
    /**
     * 显示主页面
     */
    public function index(){
        $this->assign("name","index");
        $this->display();
    }

    /**
     * @return int 今年是第几学年
     */
    public function year(){
        $year=(int)date("Y");
        if((int)date("m")<=6){
            $year--;
        }
        return $year;
    }

    /**
     * 初始化轮播图
     */
    public function banners(){
        $biz1=model("activity");
        $activities = $biz1->findManyByParams(array("picture"=>"!=null")," ORDER BY ".config("COLUMN_PREFIX")."time DESC LIMIT 0,3");
        $array = array();
        foreach($activities as $activity){
            $activity->setParam("picture",base64_encode($activity->getParam("picture")));
            array_push($array,$activity->getParams());
        }
        $this->success($array);
    }

    /**
     * 登录
     */
    public function login(){
        $jsons=json_decode(post("json"));
        $array = array();
        foreach($jsons as$json){
            $array[$json->name]=$json->value;
        }
        $biz=model($array["type"]);
        $user = $biz->findByParams(array("account"=>$array["account"],"password"=>$array["password"]));
        $result = array();
        if($user!=null){
            if($array["type"]=="user"){
                $user->setParam("icon",base64_encode($user->getParam("icon")));
            }
            $user->setParam("type",$array["type"]);
            $result=$user->getParams();
            $result["result"]=1;
        }else{
            $result["result"]=0;
        }
        $this->success($result);
    }

    /**
     * 修改用户信息
     */
    public function setUserInfo(){
        $params = json_decode(post("json"));
        $user = model($params->type);
        $user->setParam("id",$params->id);
        $array_param=array();
        if($params->action=="change_password"){
            $user->setParam("password",$params->password);
        }else{
            $user->setParam("username",$params->username);
            if($params->type=="user"){
                $user->setParam("introduce",$params->introduce);
                $user->setParam("major_id",$params->major_id);
                $user->setParam("icon","base64_decode($params->icon)");
            }else{
                $user->setParam("location",$params->location);
                $user->setParam("email",$params->email);
            }
        }
        try{
            $user->update();
            $this->success(array("success"=>1));
        }catch(Exception $e){
            $this->success(array("success"=>0));
        }
    }

    /**
     * 获得用户信息
     */
    public function getUserInfo(){
        $json = explode(",",post("json"));
        $majorBiz=model("major");
        $user=model($json[0]);
        $user->setParam("id",$json[1]);
        $user->findById();
        if($json[0]=="user"){
            $user->setParam("icon",base64_encode($user->getParam("icon")));
            $major_params=array();
            $majors=$majorBiz->findAll();
            foreach($majors as $major){
                array_push($major_params,$major->getParams());
            }
            $user->setParam("major_param",$major_params);
        }
        $this->success($user->getParams());
    }

    /**
     * 添加用户
     */
    public function addUser(){
        $json = json_decode(post("json"),true);
        $user=model("user");
        if($json["icon"]=="img/user_icon.jpg"){
            $filename = $json["icon"];
            $handle = fopen($filename, "r");
            $icon = fread($handle, filesize ($filename));
            fclose($handle);
        }else{
            $icon=base64_decode($json["icon"]);
        }
        $json["icon"]=$icon;
        $user->setParams($json);
        $user->save();
        $this->success(array("success"=>1));
    }

}
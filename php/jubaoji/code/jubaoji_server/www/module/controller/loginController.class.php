<?php

/**
 * 登录控制
 * Created by PhpStorm.
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class loginController extends commonController
{
    /**
     * 显示主页面
     */
    public function index(){
        $this->assign("name","login-index");
        $this->display();
    }

    /**
     * 登录
     */
    public function login(){
        $type=post("type");
        $account=post("account");
        $password=post("password");
        $userBiz = model($type);
        $user = $userBiz->findByParams(array("account"=>$account)," ORDER BY ".config("COLUMN_PREFIX")."ID DESC");
        if($user==null){
            $this->error("账号不存在！");
        }else if($user->getParam("password")!=$password){
            $this->error("密码错误！");
        }else{
            $user->setParam("type",$type);
            $user->setParam("accessToken", "gejmyo6N9zjiJw+VFuZ65o+I9juwH5okvoMSu9imeCCfZk/C8PYC/j1NLU75Q9uhtGRuF+2sSRqfqAxFmwfiKdTP0VIdCKvGWwxosyP75oI=");
            $this->success($user->getParams());
        }
    }

    /**
     *注册界面
     */
    public function register(){
        $this->display();
    }

    /**
     * 注册提交
     */
    public function register_submit(){
        $json = json_encode(post());
        sysout($json);
        $this->success(array("上传成功"));
    }

}
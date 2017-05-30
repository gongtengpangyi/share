<?php

/**
 * Created by PhpStorm.
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class testController extends commonController
{

    /**
     * 显示主页面
     */
    public function index(){
        $this->assign("name","index");
        $this->display();
    }

    public function test(){
        $this->assign("name","test-test");
        sysout("ssssdsss");
        $this->display();
    }
}
<?php

/**
 * Created by PhpStorm.
 * User: Fang
 * Date: 2017/1/20
 * Time: 16:12
 */
class testController extends commonController
{
    public function test(){
        $test = model("testModel");
        $test->setParam("param1","xxx");
        $test->setParam("param2","10.3");
        $test->setParam("param3","2017-01-18 16:34:38");
        $test->save();
        $test->printParams();
    }
}
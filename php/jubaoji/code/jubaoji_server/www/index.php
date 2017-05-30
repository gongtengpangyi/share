<?php
/*index.phpssssss*/

/**
 * 定义项目名称和路径
 */
define("APP_NAME", "power");
define("APP_PATH", dirname(__FILE__));

/**
 * 定义Xphp_PATH框架路径
 */
define("Xphp_PATH", APP_PATH."/../Xphp");

/**
 * 加载框架入口文件
 */
require(Xphp_PATH."/Xphp.php");

/**
 * 加载公共控制器
 */
require(APP_PATH."/module/controller/commonController.class.php");

/**
 * 设置基本参数
 */
date_default_timezone_set(config("DATE_TIMEZONE"));

/**
 *  应用开始
 */
$app = new Xapp();
$app->start();


/*
 * Test
 */
//echo "hello debuger";
//$dbType = config("DB_TYPE");
//require_file(X_DIR."/base/db/".$dbType.".class.php");
//$class_name="X".$dbType;
//$db = new $class_name();
//$db->connect();
//$stmt = $db->update("test", array("param1"=>"ss"), $db->sqlWhere(array("id"=>"3")));
//$stmt->execute();

//$model = model("testModel");

//$model->setParam("id",3);
//$model->setParam("param1","sss");
//$model->setParam("param2",3.0);
//$model->setParam("param3","2016-03-03 03:03:03");
//$model->update();


//$models=$model->findAll();
//foreach($models as $model){
//    $model->printParams();
//    sysout($model->getParam("id"));
//    if($model->getParam("id")=="3"){
//        $model->delete();
//    }
//}

?>
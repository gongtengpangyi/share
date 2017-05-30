<?php
/*functions.php*/

/**
 * 配置函数，初始化及取值赋值通用
 * @param string $name 所存取值键
 * @param string $value 存的值
 * @return mixed 取得的值
 */
function config($name="",$value=""){
    if($name!=""&&$value!=""){
        $GLOBALS["config"][$name]=$value;
    }else if($name!=""){
        return $GLOBALS["config"][$name];
    }else{
        $GLOBALS["config"]=array_merge(require_file(X_DIR."/common/config.php"));
    }
}

/**
 * 加载文件
 * @param $fileName 文件名
 * @return mixed 加载完的文件
 * @throws Exception 报错
 */
function require_file($fileName){
    if(is_file($fileName)){
        return require_once ($fileName);
    }else {
        throw new Exception();
    }
}

/**
 *  构造model类
 * @param $className 需要构造的类
 * @param $params 构造函数参数（model的参数键值对）
 * @param $db 构造函数参数（数据库操作对象）
 * @return mixed 初始化的类
 * @throws Exception 异常
 */
function model($className, $params=array(), $db=null){
    require_file(APP_PATH."/module/model/".$className.".class.php");
    return new $className($params, $db);
}

/**
 *  加载控制
 * @param string $controller 控制器
 * @param string $action 行为
 * @throws Exception 异常
 */
function controller($controller="", $action=""){
    if($controller==""){
        $controller = config("DEFAULT_CONTROLLER");
    }
    if($action==""){
        $action = config("DEFAULT_ACTION");
    }
    $className = $controller."Controller";
    require_file(APP_PATH."/module/controller/".$className.".class.php");
    define("CONTROLLER_NAME", $controller);
    define("ACTION_NAME", $action);
    $class = new $className;
    if (method_exists($class, $action)) {
        $class->$action();
    } else {
        throw new Exception("Method  ".$className."->".$action." is not exist.");
    }
}

/**
 * Get接值
 * @param $parameter 参数名
 * @param $default 默认值
 * @return 参数值
 */
function get($parameter=null, $default=null) {
    if (is_null($parameter)) {
        return $_GET;
    }
    $return = isset($_GET[$parameter]) && $_GET[$parameter] != "" ? $_GET[$parameter] : $default;
    return $return;
}

/**
 * Post接值
 * @param $parameter 参数名
 * @param $default 默认值
 * @return 参数值
 */
function post($parameter=null, $default=null) {
    if (is_null($parameter)) {
        return $_POST;
    }
    return isset($_POST[$parameter]) && $_POST[$parameter] != "" ? $_POST[$parameter] : $default;
}

//调试用
function sysout($data){
    Xlog::write("system out-----------".$data,Xlog::INFO);
}


?>
<?php
/*************************************************************
 * FileName: Xphp.php
 * Description: 框架头文件
 * Author: Xufeng
 * Date: 2012.11.11
 *************************************************************/
if (!defined("Xphp_PATH")) exit("Access Denied");

/**
 * Xphp 版本号
 */
define("X_VERSION", "1.0");

/**
 * Xphp 框架基本库路径
 */
define("X_DIR", dirname(__FILE__));

/**
 * 为当前时间，减少框架调用 time() 的次数
 */
define("CURRENT_TIMESTAMP", time());

/**
 * 常用函数
 */
require_once(X_DIR."/common/functions.php");

/**
 * 初始化配置
 */
config();

/**
 * 基础类
 */
require_file(X_DIR . "/base/core/log.class.php");
require_file(X_DIR . "/base/core/model.class.php");
require_file(X_DIR . "/base/core/controller.class.php");
require_file(X_DIR . "/base/core/app.class.php");

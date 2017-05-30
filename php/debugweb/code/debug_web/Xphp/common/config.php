<?php
/*config*/
if (!defined("Xphp_PATH")) exit("Access Denied");

return array(
    /**
     * 应用程序设置
     */
    "EXCEPTION_LOG"			    => true,					// 是否记录错误日志
    "EXCEPTION_NOTICE_LOG"	    => true,					// 是否记录警告和消息
    "EXCEPTION_LOG_MAXSIZE"		=> 2,						// 记录错误日志文件最大限制（M）
    "EXCEPTION_LOG_PATH"		=> APP_PATH."/../log/",						// 记录错误日志路径
    "EXCEPTION_LOG_VIEWPAGE"	=> false,					// 错误信息是否显示在页面上

    /**
     * 时间设置
     */
    "DATE_TIMEZONE"             => "Asia/Shanghai",			// 默认时区设置
    "DATE_FORMAT"               => "Y-m-d H:i:s",			// 时间格式设置

    /*
     * 数据库配置
     */
    "DB_HOST"                => "182.254.217.191",				// 数据库IP地址
    "DB_TYPE"                => "mysql",				// 数据库类型
    "DB_USER"                => "root",				// 数据库用户名
    "DB_PASS"                => "123456",				// 数据库密码
    "DB_NAME"                => "debug_web",				// 数据库名字
    "DB_CODE"                => "utf8" ,                    //数据库编码
    "TABLE_PREFIX"          => "T_",				// 表前缀
    "COLUMN_PREFIX"         => "C_",				// 字段前缀

    /**
     * 模板引擎设置
     */
    "TMPL_TEMPLATE_SUFFIX"      => ".html",					// 默认模板文件后缀
    "TMPL_CACHFILE_SUFFIX"      => ".php",					// 默认模板缓存后缀
    "TMPL_CONTROLLER_SUCCESS"   => "",						// 默认成功跳转对应的模板文件
    "TMPL_CONTROLLER_ERROR"     => "",						// 默认错误跳转对应的模板文件

    /**
     * 模板引擎相关设置
     */
    "TMPL_TEMPLATE_DIR"         => APP_PATH."/templates",	// 模板默认存放目录
    "TMPL_COMPILE_DIR"          => APP_PATH."/../compiled",	// 模板编辑文件目录
    "TMPL_CACHE_DIR"            => "templates/cache/",		// 缓存文件目录
    "DELIMITER_LEFT"            => "<%",					// 标签库标签开始标记
    "DELIMITER_RIGHT"           => "%>",					// 标签库标签结束标记
    "DEFAULT_CONTROLLER"   => "home",               //默认控制器
    "DEFAULT_ACTION"        => "index",               //默认操作

);
?>
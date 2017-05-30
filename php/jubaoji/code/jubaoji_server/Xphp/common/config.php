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
    "EXCEPTION_LOG_PATH"		=> APP_PATH."/../log/",		// 记录错误日志路径
    "EXCEPTION_LOG_VIEWPAGE"	=> false,					// 错误信息是否显示在页面上

    /**
     * 时间设置
     */
    "DATE_TIMEZONE"             => "Asia/Shanghai",			// 默认时区设置
    "TIME_FORMAT"               => "Y-m-d H:i:s",			// 时间格式设置
    "DATE_FORMAT"               =>"Y-m-d",                  //日期格式设置

    /*
     * 数据库配置
     */
//    "DB_HOST"                => "182.254.217.191",				// 数据库IP地址
    "DB_HOST"                => "www.jvbaoji.com",				// 数据库IP地址
    "DB_TYPE"                => "mysql",				// 数据库类型
    "DB_USER"                => "custom",				// 数据库用户名
    "DB_PASS"                => "jite2015",				// 数据库密码
    "DB_NAME"                => "jubaoji_test",				// 数据库名字
    "DB_CODE"                => "binary" ,                    //数据库编码
    "TABLE_PREFIX"          => "jbj_",				// 表前缀
    "COLUMN_PREFIX"         => "",				// 字段前缀

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
    "DEFAULT_CONTROLLER"   => "login",               // 默认控制器
    "DEFAULT_ACTION"        => "index",               // 默认操作

    /**
     * 上传信息设置
     */
    "UPLOAD_IMAGE_PATH"         =>   APP_PATH."/upload/image", // 上传图片存放目录
    "HTTP_GET_IMAGE_PATH"       =>    "http://localhost/upload/image", //客户端http获取图片的路径目录（存数据库所用）
    "JAVA_SERVER"           =>   "http://www.jvbaoji.com:18006" //聚宝集java_server的路径
);
?>
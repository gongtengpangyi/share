<?php
/*************************************************************
 * FileName: log.class.php
 * Description: Xlog日志类
 * Author: Xufeng
 * Date: 2012.11.11
 *************************************************************/
if (!defined("Xphp_PATH")) exit("Access Denied");

class Xlog {
    /**
	 * 日志级别 从上到下，由低到高
	 */
    const EMERG     = "EMERG";  // 严重错误: 导致系统崩溃无法使用
    const ALERT     = "ALERT";  // 警戒性错误: 必须被立即修改的错误
    const CRIT      = "CRIT";	// 临界值错误: 超过临界值的错误，例如一天24小时，而输入的是25小时这样
    const ERR       = "ERR";	// 一般错误: 一般性错误
    const WARN      = "WARN";	// 警告性错误: 需要发出警告的错误
    const NOTICE    = "NOTIC";  // 通知: 程序可以运行但是还不够完美的错误
    const INFO      = "INFO";	// 信息: 程序输出信息
    const DEBUG     = "DEBUG";  // 调试: 调试信息
    const SQL       = "SQL";	// SQL：SQL语句 注意只在调试模式开启时有效
    
	/**
	 * 日志数组
	 */
	static protected $log = array();
	
	/**
	 * 记录日志
	 */
    static public function record($message, $type=self::ERR) {
    	array_push(self::$log, "[".date(config("TIME_FORMAT"), time())."] ".$type.":".$message."\r\n");
    }
    
    /**
     * 保存日志
     */
    static public function save() {
    	// 记录log日志文件名
    	$logfile = config("EXCEPTION_LOG_PATH").date("Y_m_d", time()).".log";
    	if (is_file($logfile) && filesize($logfile) >= config("EXCEPTION_LOG_MAXSIZE") * 1024 * 1024) {
    		rename($logfile, $logfile."_".date("Hms", time()));
		}
    	// 记录日志
    	if (!empty(self::$log)) {
    		error_log(implode("", self::$log), 3, $logfile);
		}
    	// 清空日志
    	self::$log = array();
    }
    
    /**
     * 写入日志
     */
    static public function write($message, $type=self::ERR){
    	// 记录log日志文件名
    	$logfile = config("EXCEPTION_LOG_PATH").date("Y_m_d", time()).".log";
    	if (is_file($logfile) && filesize($logfile) >= config("EXCEPTION_LOG_MAXSIZE") * 1024 * 1024) {
    		rename($logfile, $logfile."_".date("Hms", time()));
		}
    	// 记录日志
    	$message = "[".date(config("TIME_FORMAT"), time())."] ".$type.":".$message."\r\n";
    	if (!empty($message)) {
    		error_log($message, 3, $logfile);
		}
    }
}

?>

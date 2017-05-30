<?php
/*controller.class */
class Xcontroller
{

    /**
     * 模板文件夹
     */
    protected $tmpl_template_dir;

    /**
     * 模板编译文件
     */
    protected $tmpl_compile_dir;

    /**
     * 模板缓存文件
     */
    protected $tmpl_cache_dir;

    /**
     * 模板后缀
     */
    protected $tmpl_template_suffix;

    /**
     * 缓存文件后缀
     */
    protected $tmpl_cachfile_suffix;

    /**
     * 错误信息模板
     */
    protected $tmpl_controller_error;

    /**
     * 正确信息模板
     */
    protected $tmpl_controller_success;

    /**
     * 模板左标签
     */
    protected $left_delimiter;

    /**
     * 模板右标签
     */
    protected $right_delimiter;

    /**
     * 视图实例化对象
     */
    protected $_view = null;

    /**
     * 构造Xcontroller对象
     */
    function __construct() {
        $this->tmpl_template_dir       = config("TMPL_TEMPLATE_DIR");
        $this->tmpl_compile_dir        = config("TMPL_COMPILE_DIR");
        $this->tmpl_cache_dir          = config("TMPL_CACHE_DIR");
        $this->tmpl_template_suffix    = config("TMPL_TEMPLATE_SUFFIX");
        $this->tmpl_cachfile_suffix    = config("TMPL_CACHFILE_SUFFIX");
        $this->tmpl_controller_error   = config("TMPL_CONTROLLER_ERROR");
        $this->tmpl_controller_success = config("TMPL_CONTROLLER_SUCCESS");
        $this->left_delimiter          = config("DELIMITER_LEFT");
        $this->right_delimiter         = config("DELIMITER_RIGHT");

        // 实例化Smarty模板引擎
        require_file(X_DIR."/base/lib/smarty-3.1.29/Smarty.class.php");
        $this->_view = new Smarty();

        // 模板相关设置
        $this->_view->template_dir    = $this->tmpl_template_dir;
        $this->_view->compile_dir     = $this->tmpl_compile_dir;
        $this->_view->cache_dir       = $this->tmpl_cache_dir;
        $this->_view->left_delimiter  = $this->left_delimiter;
        $this->_view->right_delimiter = $this->right_delimiter;
    }

    /**
     * 模板赋值
     * @param $name 变量名
     * @param string $value 变量值
     */
    public function assign($name, $value="") {
        $this->_view->assign($name, $value);
    }

    /**
     * 获取模板运行后内容
     * @param string $tmplfile 模板的文件路径
     * @return mixed|string|void 显示内容
     */
    public function fetch($tmplfile="") {
        if (empty($tmplfile)) {
            $folder_name = CONTROLLER_NAME;
            $file_name = ACTION_NAME;
        } else {
            $tmpl = explode(".", $tmplfile);
            if (count($tmpl) > 1) {
                $folder_name = $tmpl[0];
                $file_name = $tmpl[1];
            } else {
                $folder_name = CONTROLLER_NAME;
                $file_name = $tmpl[0];
            }
        }
        $tmplfile = $folder_name."/".$file_name.$this->tmpl_template_suffix;
        return $this->_view->fetch($tmplfile);
    }

    /**
     * 输出模板
     * @param string $tmplfile 输出的模板路径
     */
    public function display($tmplfile="") {
        if (empty($tmplfile)) {
            $folder_name = CONTROLLER_NAME;
            $file_name = ACTION_NAME;
        } else {
            $tmpl = explode(".", $tmplfile);
            if (count($tmpl) > 1) {
                $folder_name = $tmpl[0];
                $file_name = $tmpl[1];
            } else {
                $folder_name = CONTROLLER_NAME;
                $file_name = $tmpl[0];
            }
        }
        $tmplfile = $folder_name."/".$file_name.$this->tmpl_template_suffix;
        $this->_view->display($tmplfile);
    }

    /**
     * 跳转
     * @param $url 跳转路径
     * @param array $params 参数
     */
    public function redirect($url, $params=array()) {
        if (!empty($params)) {
            $url .= "?".http_build_query($params);
        }
        header("Location: ".$url);
    }

    /**
     * 正确跳转
     * @param $message 信息
     */
    public function success($message){
        echo json_encode(array(
            "status" => "success",
            "msg" => $message
        ));
    }

    /**
     * 错误跳转
     * @param $message 信息
     */
    public function error($message) {
        echo json_encode(array(
            "status" => "error",
            "msg" => $message
        ));
    }
}
<?php

/**commonController 公共控制器
 */
class commonController extends Xcontroller
{
//    /**
//     * 退出登录
//     */
//    public function logout(){
//
//    }

    /**
     * 更换密码
     */
    public function changePassword(){

    }

    /**
     * 转发post请求
     * @param $url 转发的url
     * @param array $header 转发的请求头
     * @param array $postParam 转发的请求参数
     * @param array $files 转发的文件
     * @return mixed 返回参数
     */
    protected function sendPost($url, $header=array(), $postParam=array(), $files=array()){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);//设置要访问的IP
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_POSTFIELDS, array_merge($postParam, $files)); //把返回来的cookie信息保存在$cookie_jar文件中
//        curl_setopt($ch, CURLOPT_POSTFIELDS, $postParam); //把返回来的cookie信息保存在$cookie_jar文件中
//        curl_setopt($ch, CURLOPT_POSTFIELDS, $files); //把返回来的cookie信息保存在$cookie_jar文件中
        curl_setopt($ch, CURLOPT_HEADER,0); //显示返回的HEAD区域的内容
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }


    /**
     * 生成图片名字
     * @param $image_name 图片原名
     */
    protected function getFileName($image_name){
        return date("Y-m-d-H-i-s").$image_name;
    }


}
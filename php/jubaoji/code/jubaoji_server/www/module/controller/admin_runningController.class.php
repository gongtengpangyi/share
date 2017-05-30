<?php

/**
 * 运营管理
 * User: ASUS
 * Date: 2017/3/4 0004
 * Time: 16:45
 */
class admin_runningController extends commonController
{

    /**
     * 创建广告
     */
    public function banner_create(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","创建广告");
        $num = 3;
        $bannerBiz = model("banner");
        $banners = $bannerBiz->findManyByParams(array("is_deleted"=>0)," ORDER BY ".config("COLUMN_PREFIX")."create_time DESC LIMIT 0,".$num);
        $banner_params = array();
        foreach($banners as $banner){
            array_push($banner_params, $banner->getParams());
        }
        $this->assign("banner_list", $banner_params);
        $this->assign("banner_list_json", json_encode($banner_params));
        $this->display();
    }

    /**
     * 刪除banner
     */
    public function banner_delete(){
        try{
            $banner = model("banner");
            $banner->setParam("id",post("id"));
            $banner->delete();
            $this->success("删除成功");
        }catch(Exception $e){
            $this->error("删除失败");
        }

    }

    /**
     * 创建广告提交
     */
    public function banner_create_submit(){
        try{
            $imgUrl=config("UPLOAD_IMAGE_PATH")."/".$_FILES['image']['name'];
            move_uploaded_file($_FILES['image']['tmp_name'],$imgUrl);
            $url=config("JAVA_SERVER")."/api/home/addBanner";
            $header = array(
                "user-id:".$_SERVER["HTTP_USER_ID"],
                "access-token:".$_SERVER["HTTP_ACCESS_TOKEN"]
            );
            $files=array("image"=>new CurlFile($imgUrl));
            $result=$this->sendPost($url, $header, post(), $files);
            $this->success(json_decode($result));
        }catch(Exception $e){
            $this->error("上交失败！！！");
        }
    }

    /**
     * 创建文章
     */
    public function article_create(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","创建文章");
        $this->display();
    }

    /**
     * 创建文章提交
     */
    public function article_create_submit(){
        try{
            $imgUrl=config("UPLOAD_IMAGE_PATH")."/".$_FILES['image']['name'];
            move_uploaded_file($_FILES['image']['tmp_name'],$imgUrl);
            $url=config("JAVA_SERVER")."/api/article/addArticle";
            $header = array(
                "user-id:".$_SERVER["HTTP_USER_ID"],
                "access-token:".$_SERVER["HTTP_ACCESS_TOKEN"]
            );
            $files=array("image"=>new CurlFile($imgUrl));
            $result=$this->sendPost($url, $header, post(), $files);
            $this->success(json_decode($result));
        }catch(Exception $e){
            $this->error("上交失败！！！");
        }
    }

    /**
     * 所有文章
     */
    public function article_list(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","所有文章");
        $num=9;
        $first = $num * (get("page",1)-1);
        $articleBiz=model("article");
        $item_count=$articleBiz->getCountByParams(array("is_deleted"=>"b'0'"));
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $articles = $articleBiz->findManyByParams(array("is_deleted"=>"b'0'")," ORDER BY ".config("COLUMN_PREFIX")."create_time DESC LIMIT ".$first.",".$num);
        $articleParams=array();
        foreach($articles as $article){
           array_push($articleParams, $article->getParams());
        }
        $this->assign("article_list_json", json_encode($articleParams));
        $this->assign("article_list", $articleParams);
        $this->display();
    }

    /**
     * 文章详情
     */
    public function article_introduce(){
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","文章详情");
        $article_id=get("id");
        $article=model("article",array("id"=>$article_id));
        $article=$article->findById();
        try{
            if($article==null){
                throw new Exception();
            }
            $this->assign("article",$article->getParams());
            $this->assign("article_json",json_encode($article->getParams()));
        }catch(Exception $e){
            $this->assign("article",array());
            $this->assign("article_json",json_encode(array()));
        }
        $this->display();
    }

    /**
     * 文章修改
     */
    public function article_modify(){
        $article=model("article",post());
        $article->setParam("modify_time",date(config("TIME_FORMAT")));
        try{
            $article->update();
            $this->success("修改成功");
        }catch(Exception $e){
            $this->error("修改失败");
        }
    }

    /**
     * 文章删除
     */
    public function article_delete(){
        $article=model("article",array("id"=>post("id")));
        try{
            $article->delete();
            $this->success("删除成功");
        }catch(Exception $e){
            $this->error("删除失败");
        }
    }

    /**
     * 选择今日最佳拍品页面，显示今日所有拍品
     */
    public function today_comm(){
        $num = 6;
        $first = $num * (get("page",1)-1);
        $this->assign("home_href","admin_home");
        $this->assign("home_name","管理主页");
        $this->assign("location","日拍选优");
        $commBiz=model("commodity");
        $sessionBiz = model("session");
        $item_count=$commBiz->getCountByParams(array("is_deleted"=>0)," AND TO_DAYS(".config("COLUMN_PREFIX")."modify_time) = TO_DAYS('".date(config("DATE_FORMAT"))."')");
        $this->assign("item_count", $item_count);
        $this->assign("page_count", ceil($item_count/$num));
        $commodities = $commBiz->findManyByParams(array("is_deleted"=>0)," AND TO_DAYS(".config("COLUMN_PREFIX")."modify_time) = TO_DAYS('".date(config("DATE_FORMAT"))."') ORDER BY ".config("COLUMN_PREFIX")."start_time DESC LIMIT ".$first.",".$num);
        $commParams=array();
        foreach($commodities as $commodity){
            $pictures_url = explode(",",$commodity->getParam("image_url"));
            $commodity->setParam("pictures_url", $pictures_url);
            $sessions = $sessionBiz->findManyParamsByParams(array("id","title"),array("start_time"=>"<".date(config("TIME_FORMAT"))));
            $sessions_param=array();
            foreach($sessions as $session){
                array_push($sessions_param, $session->getParams());
            }
            $commodity->setParam("sessions",$sessions_param);
            array_push($commParams, $commodity->getParams());
        }
        $this->assign("commodity_list_json", json_encode($commParams));
        $this->assign("commodity_list", $commParams);
        $this->display();
    }

    /**
     * 拍品选优
     */
    public function good_comm_choose(){
        $comm_id = post("comm_id");
        $check=post("check");
        sysout($comm_id.":".$check);
        //TODO:存选优
        $this->success("");
    }

}
/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_running_article_list() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_running_article_list);

pr(Admin_running_article_list).init = function(){
    console.log("admin-Admin_running_article_list");
    console.log(page_count);
    console.log(article_list);
    setPage(page_count, "index.php?controller=admin_running&action=article_list");
    $(".article-item").click(function(){
        window.location.href="index.php?controller=admin_running&action=article_introduce&id="+this.id.substr(31);
    }).mouseover(function(){
        $(this).css("background","#5dafd1");
    }).mouseout(function(){
        $(this).css("background","white");
    });
}
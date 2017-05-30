/**
 * 官方主页
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_running_article_introduce() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_running_article_introduce);

pr(Admin_running_article_introduce).init = function(){
    console.log("admin-Admin_running_article_introduce");
    console.log(article);
    //删除按钮
    $("#admin_running-article_introduce-btn-delete").click(this.delete);
    //修改按钮
    $("#admin_running-article_introduce-btn-modify").click(function(){
        $("#admin_running-article_introduce-btn-save").toggle();
        $(".article-content").remove();
        if($(".text").attr("contenteditable")==null||$(".text").attr("contenteditable")=="false"){
            //设置为可录入
            $(".text").attr("contenteditable","true");
            $(this).attr("src","images/btn_fork.jpg");
            var textArea = $("<textarea>"+article.content+"</textarea>").attr("class","article-content");
            $(".article-subtitle").after(textArea);
        }else{
            //设置为普通
            $(".text").attr("contenteditable","false");
            $(this).attr("src","images/btn_write.jpg");
            var pre = $("<pre>"+article.content+"</pre>").attr("class","article-content");
            $(".article-subtitle").after(pre);
        }
    });
    //提交
    $("#admin_running-article_introduce-btn-save").click(this.submit);
}

/**
 * 提交修改的文章
 */
pr(Admin_running_article_introduce).submit=function (){
    var title=$(".article-title").text();
    var subtitle=$(".article-subtitle").text();
    var content=$(".article-content").val();
    if(title==""){
        alert("请输入标题");
    }else if(subtitle==""){
        alert("请输入副标题");
    }else if(content==""){
        alert("请输入正文");
    }else{
        $.post("index.php?controller=admin_running&action=article_modify",
            {
                title: title,
                subtitle: subtitle,
                content: content,
                id: article.id
            },
            function(data){
                data=JSON.parse(data);
                alert(data.msg);
                if(data.status=="success"){
                    console.log("success");
                    window.location.reload();
                }
            }
        );
    }
}

/**
 * 删除文章
 */
pr(Admin_running_article_introduce).delete=function (){
    if(confirm("确定要删除吗？")){
        $.post("index.php?controller=admin_running&action=article_delete",
            {
                id: article.id
            },
            function(data){
                data=JSON.parse(data);
                alert(data.msg);
                if(data.status=="success"){
                    console.log("success");
                    window.location.href="index.php?controller=admin_running&action=article_list";
                }
            }
        );
    }
}
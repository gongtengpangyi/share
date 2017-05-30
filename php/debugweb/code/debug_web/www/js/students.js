/*students.js*/
function students(){

}
SingletonInheritor.declare(students);

pr(students).init = function(){
    POST("students","seniors","",this.initSeniors);
}

/**
 *初始化学长们
 * @param seniors 学长们
 */
pr(students).initSeniors=function(seniors){
    pr(students).seniors=seniors;
    console.log(seniors);
    pr(students).year=year()+1;
    for(var i=seniors.length-1;i>=0;i--){
        pr(students).initSenior(seniors[i]);
    }
}

/**
 *初始化学长
 * @param senior 学长
 */
pr(students).initSenior=function(senior){
    console.log(parseInt(senior.entertime)+4);
    if(parseInt(senior.entertime)+4<pr(students).year){
        pr(students).year=parseInt(senior.entertime)+4;
        pr(students).pTitle = $("<p>"+pr(students).year+"届</p>").attr("class","students-title").appendTo($("#students-index"));
    }
    var div=$("<div>").attr("class","students-div");
    pr(students).pTitle.after(div);
    var img=$("<img>").attr("src",base64ToImg(senior.icon)).attr("class","students-icon");
    var majors="";
    for(var i=0;i<senior.major_name.length;i++){
        majors+=senior.major_name[i]+",";
    }
    majors=majors.substr(0,majors.length-1);
    var p1=$("<p>"+senior.username+"</p>").attr("class","students-name");
    var p2=$("<p>方向:"+majors+"</p>").attr("class","students-majors");
    var p3=$("<p>"+senior.introduce+"</p>").attr("class","students-introduce");
    div.append(img);
    img.after(p1);
    p1.after(p2);
    p2.after(p3)
}

/*test.js*/
function test(){

}
SingletonInheritor.declare(test);

pr(test).init = function(){
    console.log("init");
    this.submit();
}

pr(test).submit=function(){
    var element = document.createElement("div");
    element.innerHTML="sss";
    $("div").append(element);
    console.log("submit");
}

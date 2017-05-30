/**
 * 进行中拍卖
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_auction_waiting() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_auction_waiting);

pr(Admin_auction_waiting).init = function(){
    console.log("admin_auction_waiting");
}
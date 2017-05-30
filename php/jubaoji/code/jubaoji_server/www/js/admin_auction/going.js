/**
 * 进行中拍卖
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_auction_going() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_auction_going);

pr(Admin_auction_going).init = function(){
    console.log("Admin_auction_going");
}
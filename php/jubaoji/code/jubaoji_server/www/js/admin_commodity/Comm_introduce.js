/**
 * 全部拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Admin_commodity_comm_introduce() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Admin_commodity_comm_introduce);

pr(Admin_commodity_comm_introduce).init = function(){
    console.log("Admin_commodity_comm_introduce");
    console.log(commodity);
    var $divWrap= $("#comm_introduction");

    var array_status = ["未通过","未审核","未开始","开始前半小时","已经开始",
        "结束等待支付","结束流拍用户未支付","结束流拍未到封顶价","正常结束交易","后台关闭"];

    var strMap = {
        id: "序号",
        name : "拍品名称",
        introduction : "拍品描述",
        start_time : "开拍时间",
        end_time : "结束时间",
        start_price : "开拍价格",
        seller_id : "售卖者id",
        status: "状态",
        type : "拍品类型",
        insurance : "保证金",
        commission : "佣金",
        level : "等级",
        capped_price : "封顶价",
        reserve_price : "保留价",
        parameters : "参数值",
        admin_id : "管理者id",
    };

    var appendHook = {
        status : function(){
            return array_status[parseInt(commodity.status)+2];
        }
    }

    for(var key in strMap) {
        var value = key in appendHook? appendHook[key].apply() : commodity[key];
        $("<p>" + strMap[key] + ": " + value +"</p>").appendTo($divWrap);
    }
};
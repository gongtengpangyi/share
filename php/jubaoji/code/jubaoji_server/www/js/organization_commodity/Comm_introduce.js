/**
 * 全部拍品
 * Created by ASUS on 2017/3/5 0005.
 */
function Organization_commodity_comm_introduce() {
    SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Organization_commodity_comm_introduce);

pr(Organization_commodity_comm_introduce).init = function(){
    console.log("Organization_commodity_comm_introduce");
    console.log(commodity);
    var $divWrap= $("#comm_introduction");

    var commodity_id = commodity.id;
    var commodity_name = commodity.name;
    var commodity_introduction = commodity.introduction;
    var commodity_describing = commodity.describing;
    var commodity_image_url = commodity.image_url;
    var commodity_start_time = commodity.start_time;
    var commodity_end_time = commodity.end_time;
    var commodity_start_price = commodity.start_price;
    var commodity_seller_id = commodity.seller_id;
    var commodity_status = commodity.status;//拍品状态
    var array_status = ["未通过","未审核","未开始","开始前半小时","已经开始",
        "结束等待支付","结束流拍用户未支付","结束流拍未到封顶价","正常结束交易","后台关闭"];
    var array_status_show = array_status[parseInt(commodity_status)+2];
    var commodity_type = commodity.type;
    var commodity_insurance = commodity.insurance;
    var commodity_commission = commodity.commission;
    var commodity_level = commodity.level;
    var commodity_capped_price = commodity.capped_price;
    var commodity_reserve_price = commodity.reserve_price;
    var commodity_parameters = commodity.parameters;
    var commodity_admin_id = commodity.admin_id;

    $("<p>序号："+commodity_id +"</p>").appendTo($divWrap);
    $("<p>拍品名称："+commodity_name +"</p>").appendTo($divWrap);
    $("<p>拍品描述："+commodity_introduction +"</p>").appendTo($divWrap);
    $("<p>开拍时间："+commodity_start_time +"</p>").appendTo($divWrap);
    $("<p>结束时间："+commodity_end_time +"</p>").appendTo($divWrap);
    $("<p>开拍价格："+commodity_start_price +"</p>").appendTo($divWrap);
    $("<p>售卖者id："+commodity_seller_id +"</p>").appendTo($divWrap);
    $("<p>状态："+array_status_show +"</p>").appendTo($divWrap);
    $("<p>拍品类型："+commodity_type +"</p>").appendTo($divWrap);
    $("<p>保证金："+commodity_insurance +"</p>").appendTo($divWrap);
    $("<p>佣金："+commodity_commission +"</p>").appendTo($divWrap);
    $("<p>等级："+commodity_level +"</p>").appendTo($divWrap);
    $("<p>封顶价："+commodity_capped_price +"</p>").appendTo($divWrap);
    $("<p>保留价："+commodity_reserve_price +"</p>").appendTo($divWrap);
    $("<p>参数值："+commodity_parameters +"</p>").appendTo($divWrap);
    $("<p>管理者id："+commodity_admin_id +"</p>").appendTo($divWrap);
};
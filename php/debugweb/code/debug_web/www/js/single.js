var SingletonInheritor = (function(){
	
	function Singleton() {
	}
	Singleton.prototype = {
		constructor: Singleton,
		s_languageXmlDoc: null,
		
		// 类方法
		instance: function () { // 获取单件对象
			var s_instance = null;
			var that = this;
			return (that.constructor.prototype.instance = function () {
				if (s_instance === null) {
					s_instance = new that.constructor();
				}
				return s_instance;
			})();
		},
		getLxd: function () {
			return Singleton.prototype.s_languageXmlDoc;
		},
		setLxd: function (lxd) {
			Singleton.prototype.s_languageXmlDoc = lxd;
		},
		
		// 实例方法
		init: function() {// 页面初始化
		},
		initCSS: function () {// 样式初始化
		},
		resize: function () {// 窗口大小调整
		},
		submit: function() {// 提交
		},
		beforeLeave: function() {// 页面离开前回调
		}
	};
	
	return {
		implement: function (subObj) {// 继承实现
			Singleton.call(subObj);
		},
		declare: function (SubType) {// 继承声明
			function Shallow() {}
			Shallow.prototype = Singleton.prototype;
			SubType.prototype = new Shallow();
			SubType.prototype.constructor = SubType;
		},
		base: Singleton // 调用基类
	};

})();

function pr(Type) { // 调用原型方法的快捷函数
	return Type.prototype;
}

function ia(Type) { // 调用单件实例方法的快捷函数
	return Type.prototype.instance();
}

/*
// 示例：
// Config继承自Singleton
function Config() {
	SingletonInheritor.implement(this);
}
SingletonInheritor.declare(Config);

// 调用Config单件对象方法
pr(Config).instance().init();
// 或
ia(Config).init();
*/

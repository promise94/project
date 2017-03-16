console.log('load register.js');

define('register', [
    '../action/verify'
], function(){ // 在define中引入app和Cookie，表示app.js和Cookie.js的源码引入demo.js，合并成一个大的

    var vm = new Vue({
		el: "#app",
		data: {
			btn_codeval: '获取验证码',
			phone: '',
			code: '',
			password: '',
			eye: false,
			check: true,
			btn_code: false, // 获取验证码按钮锁
			btn_register: false, // 注册按钮锁
			active: ''
		},
		methods: {
			show: function(){ // 是否展示密码
				var $elem = $('#J-mobile-password');
				$elem.attr('type') == 'text' ? $elem.attr('type', 'password') : $elem.attr('type', 'text');
				this.eye = this.eye ? false : true;
			},
			choose: function(){ // 是否同意相关条款
				this.check = this.check ? false : true;
				this.active = this.check ? '1' : '0.5';
			},
			getCode: function(){ // 获取验证码
				// 点击锁
				if(this.btn_code) return;
				this.btn_code = true;

				if(!this.phone){
					$.toast('请输入手机号码');
					this.btn_code = false;
					return;
				}
				if(!$.verify.mobilePhone({ elem: '#J-mobile-phone' })){
					$.toast('请输入正确的手机号码');
					this.btn_code = false;
					return;
				}
				$.showIndicator();
				getCode(this.phone, 60);
			},
			register: function(){ // 注册
				// 如果不同意相关条款，则不能注册
				if(!this.check){
					this.active = '0.5';
					this.btn_register = true;
				} else {
					this.active = '1';
					this.btn_register = false;
				}
				// 点击锁
				if(this.btn_register) return;
				this.btn_register = true;

				if(!this.phone){
					$.toast('请输入手机号码');
					this.btn_register = false;
					return;
				}
				if(!$.verify.mobilePhone({ elem: '#J-mobile-phone' })){
					$.toast('请输入正确的手机号码');
					this.btn_register = false;
					return;
				}
				if(!this.code){
					$.toast('请输入验证码');
					this.btn_register = false;
					return;
				}
				if(!this.password){
					$.toast('请输入密码');
					this.btn_register = false;
					return;
				}
				if(!$.verify.password({ elem: '#J-mobile-password' })){
					$.toast('密码格式错误，请输入6-32位数字或字母');
					this.btn_register = false;
					return;
				}
				$.showIndicator();
				$.ajax({
		            type: "post",
		            url: Host + 'front/user/register',
		            dataType: "jsonp",
		            //传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			        jsonp: "callback",
			        //自定义的jsonp回调函数名称"jsonpCallback"，返回的json也必须有这个函数名称
					jsonpCallback:"jsonpCallback",
		            data: {
		            	version: version,
				        system: system,
				        lang: lang,
				        APIGEEHEADER2: APIGEEHEADER2,
		            	hotelId: hotelId,
		            	telphone: this.phone,
		            	password: this.password,
		            	msgCode: this.code
		            },
		            success: function(data) {
		                vm.btn_register = false;
		                if(data.code == 1000){
		                	$.toast(data.message);
		                	window.location.href = '/front/user/login?hotelId=' + hotelId
		                } else {
		                	$.toast(data.message);
		                }
		            },
		            complete: function(){
			        	$.hideIndicator();
			        },
		            error: function() {
		            	vm.btn_register = false;
		                $.toast('网络异常，请检查网络再重试');
		            }
		        });
			}
		},
		// 实例创建后调用
		created: function(){
			
		}
	});

	/**
	 * [监控手机号码变化]
	 * @param  {[type]} ){	if($pattern4.test(vm.phone)){		vm.disable [description]
	 * @param  {[type]} options.immediate:                          true          [description]
	 * @return {[type]}                                             [description]
	 */
	vm.$watch('phone', function(){
		if(!$.verify.mobilePhone({ elem: '#J-mobile-phone' })){
			vm.btn_code = true;
		} else {
			vm.btn_code = false;
		}
	}, {
		immediate: true
	});

	$(function(){

	});

	/**
	 * [getCode 获取验证码]
	 * @param  {[type]} phone [description]
	 * @return {[type]}       [description]
	 */
	var getCode = function(phone, times){
		$.ajax({
	        url: Host + "api/user/sendmsgcode",
	        type: 'POST',
	        dataType: 'jsonp',
	        //传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
	        jsonp: "callback",
	        //自定义的jsonp回调函数名称"jsonpCallback"，返回的json也必须有这个函数名称
			jsonpCallback:"jsonpCallback",
	        data: {
	        	version: version,
		        system: system,
		        lang: lang,
		        APIGEEHEADER2: APIGEEHEADER2,
	        	hotelId: hotelId,
	        	telphone: phone,
	        	type: 0
	        },
	        success: function(result) {
	        	if(result.code == 1000){
	        		$.toast(result.message);

	        		vm.btn_codeval = '已发送';
	        		var time = setInterval(function(){
						times -= 1;
						vm.btn_codeval = times + '秒后可重发';
						if(times == 0) {
							clearInterval(time);
							vm.btn_codeval = '获取验证码';
							vm.btn_code = false;
						}
					}, 1000);
					setTimeout(function(){vm.pass_lock = false;}, 60000);
	        	} else {
	        		vm.btn_code = false;
	        		$.toast(result.message);
	        		return;
	        	}
	        },
	        complete: function(){
				$.hideIndicator();
	        },
	        error: function() {
	        	vm.btn_code = false;
	        	$.toast('网络有点问题，请重试');
	        	return;
	        }
	    });
	}

    /*
    *  注：现在同时兼容多文件合并压缩成单文件，和按需引入文件两种方式，可灵活使用，
    *  由于项目规模较小，建议尽量采用合并打包的方式，这样代码会简洁一些
    * */
});

require(['register']); // demo模块运行
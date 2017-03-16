!function(e){function t(s){if(n[s])return n[s].exports;var o=n[s]={exports:{},id:s,loaded:!1};return e[s].call(o.exports,o,o.exports,t),o.loaded=!0,o.exports}var n={};return t.m=e,t.c=n,t.p="",t(0)}([function(e,t,n){var s,o;console.log("load register.js"),s=[n(1)],!(o=function(){var e=new Vue({el:"#app",data:{btn_codeval:"获取验证码",phone:"",code:"",password:"",eye:!1,check:!0,btn_code:!1,btn_register:!1,active:""},methods:{show:function(){var e=$("#J-mobile-password");"text"==e.attr("type")?e.attr("type","password"):e.attr("type","text"),this.eye=!this.eye},choose:function(){this.check=!this.check,this.active=this.check?"1":"0.5"},getCode:function(){if(!this.btn_code){if(this.btn_code=!0,!this.phone)return $.toast("请输入手机号码"),void(this.btn_code=!1);if(!$.verify.mobilePhone({elem:"#J-mobile-phone"}))return $.toast("请输入正确的手机号码"),void(this.btn_code=!1);$.showIndicator(),t(this.phone,60)}},register:function(){if(this.check?(this.active="1",this.btn_register=!1):(this.active="0.5",this.btn_register=!0),!this.btn_register){if(this.btn_register=!0,!this.phone)return $.toast("请输入手机号码"),void(this.btn_register=!1);if(!$.verify.mobilePhone({elem:"#J-mobile-phone"}))return $.toast("请输入正确的手机号码"),void(this.btn_register=!1);if(!this.code)return $.toast("请输入验证码"),void(this.btn_register=!1);if(!this.password)return $.toast("请输入密码"),void(this.btn_register=!1);if(!$.verify.password({elem:"#J-mobile-password"}))return $.toast("密码格式错误，请输入6-32位数字或字母"),void(this.btn_register=!1);$.showIndicator(),$.ajax({type:"post",url:Host+"front/user/register",dataType:"jsonp",jsonp:"callback",jsonpCallback:"jsonpCallback",data:{version:version,system:system,lang:lang,APIGEEHEADER2:APIGEEHEADER2,hotelId:hotelId,telphone:this.phone,password:this.password,msgCode:this.code},success:function(t){e.btn_register=!1,1e3==t.code?($.toast(t.message),window.location.href="/front/user/login?hotelId="+hotelId):$.toast(t.message)},complete:function(){$.hideIndicator()},error:function(){e.btn_register=!1,$.toast("网络异常，请检查网络再重试")}})}}},created:function(){}});e.$watch("phone",function(){$.verify.mobilePhone({elem:"#J-mobile-phone"})?e.btn_code=!1:e.btn_code=!0},{immediate:!0}),$(function(){});var t=function(t,n){$.ajax({url:Host+"api/user/sendmsgcode",type:"POST",dataType:"jsonp",jsonp:"callback",jsonpCallback:"jsonpCallback",data:{version:version,system:system,lang:lang,APIGEEHEADER2:APIGEEHEADER2,hotelId:hotelId,telphone:t,type:0},success:function(t){if(1e3!=t.code)return e.btn_code=!1,void $.toast(t.message);$.toast(t.message),e.btn_codeval="已发送";var s=setInterval(function(){n-=1,e.btn_codeval=n+"秒后可重发",0==n&&(clearInterval(s),e.btn_codeval="获取验证码",e.btn_code=!1)},1e3);setTimeout(function(){e.pass_lock=!1},6e4)},complete:function(){$.hideIndicator()},error:function(){e.btn_code=!1,$.toast("网络有点问题，请重试")}})}}.apply(t,s))},function(e,t){!function(e){e.verify={getByte:function(e){for(var t=0,n=0;n<e.length;n++)t+=null!=e[n].match(/[^\x00-\xff]/gi)?2:1;return t},company:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[A-Za-z0-9_()（）\-\u4e00-\u9fa5]+$/;s=t.must?r!=o&&i.test(r)?r:"":""==r||r==o||(i.test(r)?r:"")}return s},telephone:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[0-9-]+$/;s=t.must?i.test(r)?r:"":""==r||r==o||(i.test(r)?r:"")}return s},mobilePhone:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^1[3578][01379]\d{8}$/g,a=/^1[34578][01256]\d{8}$/g,l=/^(134[0-8]\d{7}|1[34578][0-47-8]\d{8})$/g;s=t.must?r!=o&&(i.test(r)||a.test(r)||l.test(r))?r:"":""==r||r==o||(reg.test(r)?r:"")}return s},qq:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[0-9]+$/;s=t.must?r!=o&&i.test(r)?r:"":""==r||r==o||(i.test(r)?r:"")}return s},email:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/;s=t.must?r!=o&&i.test(r)?r:"":""==r||r==o||(i.test(r)?r:"")}return s},crCode:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[A-Za-z0-9_\-\u4e00-\u9fa5]+$/;s=t.must?r!=o&&i.test(r)?r:"":""==r||r==o||(i.test(r)?r:"")}return s},username:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[A-Za-z0-9_\-\u4e00-\u9fa5]+$/;s=t.must?r==o||!i.test(r)||this.getByte(r)<4||this.getByte(r)>30?"":r:""==r||r==o||(!i.test(r)||this.getByte(r)<4||this.getByte(r)>30?"":r)}return s},password:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),i=/^[0-9|a-zA-Z]{6,32}$/;s=t.must?r==o||!i.test(r)||r.indexOf(" ")>-1?"":r:""==r||r==o||(i.test(r)?r:"")}return s}}}(jQuery)}]);
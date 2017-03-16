!function(e){function t(s){if(n[s])return n[s].exports;var o=n[s]={exports:{},id:s,loaded:!1};return e[s].call(o.exports,o,o.exports,t),o.loaded=!0,o.exports}var n={};return t.m=e,t.c=n,t.p="",t(0)}([function(e,t,n){var s,o;console.log("load updatepassword.js"),s=[n(1)],!(o=function(){var e=new Vue({el:"#app",data:{btn_codeval:"获取验证码",phone:"",showPhone:"",code:"",password1:"",password2:"",btn_code:!1,btn_register:!1},methods:{updatePhone:function(e){return e.substr(0,3)+"****"+e.substr(7)},choose:function(){this.check="&#xe61c;"==this.check?"&#xe607;":"&#xe61c;",this.active="&#xe61c;"==this.check?"":"red"},getCode:function(){this.btn_code||(this.btn_code=!0,$.showIndicator(),t(this.phone,60))},submit:function(){if(!this.btn_register){if(this.btn_register=!0,!this.code)return $.toast("请输入验证码"),void(this.btn_register=!1);if(!this.password1)return $.toast("请输入新密码"),void(this.btn_register=!1);if(!$.verify.password({elem:"#J-mobile-pas1"}))return $.toast("密码格式错误，请输入6-32位数字或字母"),void(this.btn_register=!1);if(!this.password2)return $.toast("请再次输入新密码"),void(this.btn_register=!1);if(this.password1!=this.password2)return $.toast("两次输入的密码不一致"),void(this.btn_register=!1);$.showIndicator(),$.ajax({type:"post",url:webUrl+"api/user/changepassword",dataType:"jsonp",jsonp:"callback",jsonpCallback:"jsonpCallback",data:{version:version,system:system,lang:lang,APIGEEHEADER2:APIGEEHEADER2,hotelId:hotelId,telphone:this.phone,msgCode:this.code,password:this.password1,rePassword:this.password2,type:0,securetKey:securityKey},success:function(t){return 1e3!=t.code?(e.btn_register=!1,void $.toast(t.message)):($.toast("密码修改成功."),e.btn_register=!1,setTimeout(function(){window.location.href=webUrl+"front/userCenter/"+getUrlParams("sourcePage")+"?hotelId="+hotelId},500),void 0)},complete:function(){$.hideIndicator()},error:function(){$.toast("网络异常，请检查网络再重试"),e.btn_register=!1}})}}},created:function(){this.phone=userPhone,this.phone||(window.location.href=webUrl+"front/index/index?hotelId="+hotelId),this.showPhone=this.updatePhone(this.phone)}});$(function(){});var t=function(t,n){$.ajax({url:Host+"api/user/sendmsgcode",type:"POST",dataType:"jsonp",jsonp:"callback",jsonpCallback:"jsonpCallback",data:{version:version,system:system,lang:lang,APIGEEHEADER2:APIGEEHEADER2,hotelId:hotelId,telphone:t,type:3,securetKey:securityKey},success:function(t){if(1e3!=t.code)return e.btn_code=!1,void $.toast(t.message);$.toast("发送成功."),e.btn_codeval="已发送";var s=setInterval(function(){n-=1,e.btn_codeval=n+"秒后可重发",0==n&&(clearInterval(s),e.btn_codeval="获取验证码",e.btn_code=!1)},1e3);setTimeout(function(){e.pass_lock=!1},6e4)},complete:function(){$.hideIndicator()},error:function(){e.btn_code=!1,$.toast("网络有点问题，请重试")}})}}.apply(t,s))},function(e,t){!function(e){e.verify={getByte:function(e){for(var t=0,n=0;n<e.length;n++)t+=null!=e[n].match(/[^\x00-\xff]/gi)?2:1;return t},company:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[A-Za-z0-9_()（）\-\u4e00-\u9fa5]+$/;s=t.must?r!=o&&a.test(r)?r:"":""==r||r==o||(a.test(r)?r:"")}return s},telephone:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[0-9-]+$/;s=t.must?a.test(r)?r:"":""==r||r==o||(a.test(r)?r:"")}return s},mobilePhone:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^1[3578][01379]\d{8}$/g,i=/^1[34578][01256]\d{8}$/g,l=/^(134[0-8]\d{7}|1[34578][0-47-8]\d{8})$/g;s=t.must?r!=o&&(a.test(r)||i.test(r)||l.test(r))?r:"":""==r||r==o||(reg.test(r)?r:"")}return s},qq:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[0-9]+$/;s=t.must?r!=o&&a.test(r)?r:"":""==r||r==o||(a.test(r)?r:"")}return s},email:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/;s=t.must?r!=o&&a.test(r)?r:"":""==r||r==o||(a.test(r)?r:"")}return s},crCode:function(t){var t=e.extend({elem:null,must:!1},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[A-Za-z0-9_\-\u4e00-\u9fa5]+$/;s=t.must?r!=o&&a.test(r)?r:"":""==r||r==o||(a.test(r)?r:"")}return s},username:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[A-Za-z0-9_\-\u4e00-\u9fa5]+$/;s=t.must?r==o||!a.test(r)||this.getByte(r)<4||this.getByte(r)>30?"":r:""==r||r==o||(!a.test(r)||this.getByte(r)<4||this.getByte(r)>30?"":r)}return s},password:function(t){var t=e.extend({elem:null,must:!0},t),n=t.elem instanceof jQuery?t.elem:e(t.elem),s="";if(n.length){var o=n[0].defaultValue,r=e.trim(n.val()),a=/^[0-9|a-zA-Z]{6,32}$/;s=t.must?r==o||!a.test(r)||r.indexOf(" ")>-1?"":r:""==r||r==o||(a.test(r)?r:"")}return s}}}(jQuery)}]);
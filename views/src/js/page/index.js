/**
 * 引入jquery提示文件
 */
/// <reference path="../jquery/jquery.d.ts" />
/// <reference path="../jqueryui/jqueryui.d.ts" />

$(document).ready(function () {
    $('#dropMenu1').hover(function () {
        $('.dropMenu1').stop().fadeToggle('slow');
    });
    $('.dropMenu1>li>a').click(function () {});
    $('.carouselBox').hover(function () {
            $('.carousel-btn').stop().fadeIn();
        },
        function () {
            $('.carousel-btn').stop().fadeOut();
        }
    );
    $("[data-toggle='popover']").popover();
})
$(document).on('turbolinks:load', function() {
    // ↓タブをクリックした時の処理↓
    $('.profile-tab').click(function(){
        // ↓現在アクティブなタブを切り替え↓
        $('.profile-tab-active').removeClass('profile-tab-active');
        // ↓タブをアクティブにする↓
        $(this).addClass('profile-tab-active');
        // ↓現在アクティブなタブの中身を非表示
        $('.box-show').removeClass('box-show');
        // ↓クリックしたタブから順番を取得↓
        const index = $(this).index();
        // ↓クリックしたタブと同じ順番のコンテンツを表示↓
        $('.tabbox').eq(index).addClass('box-show');
    });
});

$(document).on('turbolinks:load', function() {
    $('.notification_btn').on('click', () => {
        $('.notification_index').toggle();
    });
});

$(window).on('turbolinks:load', function() {
var top = $('#message_form').offset().top;
console.log(top);
$('html').animate({scrollTop:top}, 'fast');
});


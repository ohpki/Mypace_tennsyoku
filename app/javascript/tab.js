var uncheckedId;

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
    // ↓タブをクリックした時の処理↓
    $('.paginate').click(function(){
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


// $(document).on('turbolinks:load', function() {
//     $('.notification_btn').on('click', () => {
//         $('.notification_index').toggle();
//     });
// });

$(document).on('turbolinks:load', function() {
    $('.notification_btn').on('ajax:before', () => {
    if ($('.notification_index').is(':visible')) {
        // 表示されている場合の処理
        $('.notification_index').hide();
    } else {
        // 非表示の場合の処理
        $('.notification_index').show();

    }
    });

});

$(window).on('turbolinks:load', function() {
var top = $('#message_form').offset().top;
console.log(top);
$('html').animate({scrollTop:top}, 'fast');
});


// $(window).on('scroll', function() {
//     scrollHeight = $(document).height();
//     scrollPosition = $(window).height() + $(window).scrollTop();
//     if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
//           $('.jscroll').jscroll({
//             contentSelector: '.scroll-list',
//             nextSelector: 'span.next:last a'
//           });
//     }
// });

$(window).on('scroll', function() {
    $(".jscroll").jscroll(

)
});

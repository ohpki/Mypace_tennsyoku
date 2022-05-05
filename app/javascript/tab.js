var uncheckedId;

$(document).on('turbolinks:load', function() {
    // urlをログで書きだす↓
    let url = new URL(window.location.href)
    // urlの?以降を取得↓
    let params = url.searchParams;
    // とってきた?以降のurlのtab=〇の〇部分の値を取得する↓
    let tab = url.searchParams.get('tab');
    // nullは0以下で帰ってくるので↓
    if (Number(tab) > 0) {
        $('.box-show').removeClass('box-show');
        // tab=〇の〇部分の値のタブをクリックしている状態にする↓
        $('.tabbox').eq(Number(tab)).addClass('box-show');
        $('.profile-tab-active').removeClass('profile-tab-active');
        $('.profile-tab').eq(Number(tab)).addClass('profile-tab-active');
    }

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
    // lengthは要素があれば1を返すため
    if ($('#message_form').length > 0) {
        var top = $('#message_form').offset().top;
        // console.log(top);
        $('html').animate({scrollTop:top}, 'fast');
    }
});


var ready = function () {

    $('#tabs').tabs({ event: "mouseover" });

    initialiseImageSliders();

      $('#watch_video').on('click touchstart', function () {
        displayVideo();
    });
    $('#close-x').on('touchstart click', function (e) {
        closeVideo();
    });

};

$(document).ready(ready);
$(document).on('page:load', ready);

function initialiseImageSliders() {

    $('.bxslider1').bxSlider({
        controls: false,
        auto: true,
        mode: 'fade',
        adaptiveHeight: true,
        slideWidth: 1170,
        slideMargin: 0,
        speed: 500,
        pager: false
    });

    $('.bxslider2').bxSlider({
        controls: false,
        auto: true,
        mode: 'horizontal',
        adaptiveHeight: true,
        slideWidth: 450,
        speed: 2000,
        pager: false
    });
}


function displayVideo() {
    $('.overlay').show();
    $('.absolute').show();
    ytplayer.playVideo();
}
function closeVideo() {
    $('.overlay').hide();
    $('.absolute').hide();
    ytplayer.stopVideo();
}

//Create the youtube player
var ytplayer = null;

var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


function onYouTubeIframeAPIReady() {
    // it is important to return when window.ytplayer
    // is already created - because you will be missing
    // certain methods like getCurrentTime


    console.log("YT ready");

    if (!window.YT || window.ytplayer) {
        return;
    }
    ytplayer = new YT.Player('ytplayer', {
        height: '315',
        width: '560',
        videoId: 'g-tjpOAJ6Ms',
        origin: 'http://localhost:3000'
    });
}
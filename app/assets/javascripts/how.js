

function getFlickrImagesForSlider(photoset, container, size, callback) {


    // Load images from flickr:
    $.ajax({
        type: 'POST',
        url: 'home/get_json_photos',
        data: {photoset_id: photoset }

    }).done(function (result) {

        var parsedFile = $.parseJSON($.parseJSON(result));
        var photos = parsedFile.photoset.photo;

        console.log(photos);

        var baseUrl,imageUrl;

        // Add the images as links with thumbnails to the page:
        $.each(photos, function (index, photo) {

            baseUrl = 'http://farm' + photo.farm + '.static.flickr.com/' +
                photo.server + '/' + photo.id + '_' + photo.secret;

            imageUrl = baseUrl + '_' + size + '.jpg';

            console.log(imageUrl);

            $(container).append($('<li>').append($('<img>').attr('src', baseUrl + '_' + size + '.jpg')));
        });
        //run the callback
        callback();
    });
}

function initialiseImageSlider() {

    console.log('callback');

    $('#image-slider').bxSlider({

        captions: false,
        mode: 'vertical',
        slideMargin: 20,
        minSlides: 9,
        maxSlides: 10,
        slideHeight: 300,
        moveSlides: 1,
        pager: false,
        controls: true,
        onSliderLoad: function(){
            // do funky JS stuff here
            $('#loader').hide();
        }
    });
}


function appendShowLoader(div) {
    $(div).append($('<img>').attr('src', 'assets/loading.gif').addClass('loader'));
    $('.loader').show();
}

var loader = new function () {
    this.hideImage = function () {
        $('.loader').hide();
    };
    this.appendToDiv = function (div) {
        $(div).append($('<img>')
            .attr('src', 'assets/loading.gif').addClass('loader'));
        $('.loader').show();
    };
}


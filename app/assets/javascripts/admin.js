var ready = function () {

    $('.close-x-grey').on('click touchstart', function () {
        $('.form-view').empty();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

/* AJAX METHOD TO CHANGE POSITION IN THE DATABASE TABLE
 1. Calls the controller method to update the tab order in the database
 2. a callback to another controller method to update the tableview */
function updatePosition(id, position, urlPost, urlCallback) {

    $.ajax({
        type: 'POST',
        url: urlPost,
        data: {id: id, new_position: position},
        success: function () {
            sendAjaxCall(urlCallback, id);
        }
    }); //end ajax
}


/* AJAX METHOD TO CHANGE TAB VISIBILITY
 1. Calls the controller method to update the tab visibility in the database
 2. a callback to another controller method to update the tab view */
function updateVisibility(id, visible, urlPost, urlCallback) {
    $.ajax({
        type: 'POST',
        url: urlPost,
        data: {id: id, new_visibility: visible},
        success: function () {

            urlCallback != null ? sendAjaxCall(urlCallback, null) : '';
        }
    }); //end ajax
}


/* HELPER METHODS ************************************************************/

// Make an ajax call via the controller action, then re-initialise the div
function sendAjaxCall(path, id) {

    $.ajax({
        type: 'POST',
        url: path,
        dataType: 'script',
        data: {id: id},
        success: function () {
            //console.log('ajax call to ' + path + ' was successful');//for testing
        }
    }); //end ajax
}

// Method to initialise a sortable list
function initialiseSortableList(listElement, urlPost, urlCallback) {

    $(listElement).sortable({

        stop: function (event, ui) {

            //callback when sorting finishes, i.e. update the database
            // loop through the sorted items and update the order in the database
            var order = ($(listElement).sortable('toArray'));

            $.each(order, function (index, item) {
                updatePosition(item, index + 1, urlPost, urlCallback); // pass the id and the new position
            });//end each
        }
    });
    $(listElement).disableSelection();
}

// Creates the jQuery method to initialise the sortable tabs
jQuery.fn.initialiseSortableTabs = function () {

    $(this).tabs();

    //callback at the end of the dragging
    $(this).find(".ui-tabs-nav").sortable({

        stop: function (event, ui) {

            // loop through the sorted items and update the tab order in the database
            var order = ($(this).sortable('toArray')).reverse();

            $.each(order, function (index, item) {
                updatePosition(item, index + 1, 'admin_tabs/update_tab_order', 'admin_tabs/tableview'); // pass the tab id and the new position
            });//end each
            $('.tab-view').tabs("refresh");
        }//end stop
    });//end sortable
    return this;
}


// Create a jQuery method to initialise the switches
jQuery.fn.initialiseSwitches = function (urlPost, urlCallback) {

    $.fn.bootstrapSwitch.defaults.size = 'mini';
    $.fn.bootstrapSwitch.defaults.onText = 'Show';
    $.fn.bootstrapSwitch.defaults.offText = 'Hide';

    $(this).bootstrapSwitch();

    //if the switch isn't part of a form element, then initialise the event to listen for switch change
    if (urlPost != null) {
        $(".switch").on('switchChange.bootstrapSwitch', function (event, state) {
            var visibility = state ? 1 : 0;
            updateVisibility($(this).attr('id'), visibility, urlPost, urlCallback);
        });
    }
    return this;
}


/* Call Flickr to obtain images based on the name of te photoset.
*  When done, append the images to the container
*  - run the callback to select the image
* */

function getFlickrImages(form_name, photoset, container, size, callback, image_id_field, original_secret_field) {


    //append an image representing a nil value
    $('<img>').attr('id', 'no_image').appendTo($(container));

    // Load images from flickr:
    $.ajax({
        type: 'POST',
        url: 'home/get_json_photos',
        data: {photoset_id: photoset }

    }).done(function (result) {

        loader.hideImage();

        var parsedFile = $.parseJSON($.parseJSON(result));
        var photos = parsedFile.photoset.photo;

        var baseUrl, imageId;

        // Add the images as links with thumbnails to the page:
        $.each(photos, function (index, photo) {

            baseUrl = 'http://farm' + photo.farm + '.static.flickr.com/' +
                photo.server + '/' + photo.id + '_' + photo.secret;


            //replace the forward slash '/' with '-' dash
            imageId = photo.farm + '.static.flickr.com-' +
                photo.server + '-' + photo.id + '_' + photo.secret;


            $('<img>')
                .prop('src', baseUrl + '_' + size + '.jpg')
                .addClass('image-link')
                .attr('id', imageId)
                .attr('alt', photo.originalsecret)
                .appendTo($(container));
        });

        //run the callback e.g. selectImage
        callback != null ? callback(form_name, container, image_id_field, original_secret_field) : '';
    });
}


/*
 Show the current Image by changing the css (border - red)
 Initialise the images for selection event
 Change the css (border - red) on selection
 */
function selectImage(form_name, container, image_id_field, original_secret_field) {

    //show which pic is currently selected (if any)
    var currentPicId = $('#' + form_name + '_' + image_id_field).val();

    //make this jquery safe by replacing period with escaped backslashes
    currentPicId = currentPicId.replace(/\./g, '\\.');

    if (currentPicId !== 'undefined') {
        $('#' + currentPicId).css({borderColor: 'red'});
    } else {
        $('#no_image').css({borderColor: 'red'});
    }

    $(container + ' img').on('click touchstart', function () {

        // change all images back to default border
        $(container + ' img').css({borderColor: 'lightgrey'});

        //place a red border around the selected image
        $(this).css({borderColor: 'red'});

        //assign the value selected from the chosen field to the input text field boxes
        $('#' + form_name + '_' + image_id_field).val($(this).attr('id'));
        $('#' + form_name + '_' + original_secret_field).val($(this).attr('alt'));
    });
}

function addCloseIcon() {
    $('.form-view').append($('<img>').attr('src', 'assets/black-cross-md.png').addClass('close-x image-link'));

    $('.close-x').on('click touchstart', function () {
        $('.form-view').empty();
    });
}


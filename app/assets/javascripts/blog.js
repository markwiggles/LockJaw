var ready = function () {


    if (document.location.hash) {
        console.log("hash location " + document.location.hash);
        $(document.location.hash).show();

    } else {
        $('#blog-content').children('.hide-elem').show();
    }
};

$(document).ready(ready);
$(document).on('page:load', ready);

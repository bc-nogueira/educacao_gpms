$( document ).on('turbolinks:load', function() {
    $(".course-rate-show3").each( function() {
        $(this).rateYo({
            rating: $(this).attr("data-rate"),
            fullStar: true,
            readOnly: true
        });
    });
});
$( document ).on('turbolinks:load', function() {
    $(".course-average-rate").each( function() {
        $(this).rateYo({
            rating: $(this).attr("data-rate"),
            fullStar: true,
            readOnly: true
        });
    });
});
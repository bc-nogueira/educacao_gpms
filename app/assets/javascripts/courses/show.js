$( document ).on('turbolinks:load', function() {
    $(".courseRate").each( function() {
        $(this).rateYo({
            rating: $(this).attr("data-rate"),
            fullStar: true,
            readOnly: true
        });
    });
});
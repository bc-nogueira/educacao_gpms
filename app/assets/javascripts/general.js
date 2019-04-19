$( document ).on('turbolinks:load', function() {
    $("#discount-alert").fadeTo(5000, 500).slideUp(500, function(){
        $("#discount-alert").slideUp(500);
    });
});
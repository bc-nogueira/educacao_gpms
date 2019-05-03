$( document ).on("turbolinks:load", function() {
    $("#teacher_phone_number").mask("(00) 0000-00009")
    .blur(function (event) {
        var target, phone, element;
        target = (event.currentTarget) ? event.currentTarget : event.srcElement;
        phone = target.value.replace(/\D/g, '');
        element = $(target);
        element.unmask();
        if(phone.length > 10) {
            element.mask("(00) 00000-0009");
        } else {
            element.mask("(00) 0000-00009");
        }
    });
});
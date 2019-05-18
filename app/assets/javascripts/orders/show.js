$( document ).on("turbolinks:load", function() {
    if($("#removeCourseCart").length > 0) {
        const elem = $("#removeCourseCart");
        $(document).on("click", "#removeCourseCart", function() {
            const title = "Deseja excluir avaliação?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/orders/" + elem.data("order") + "/remove_course?course_id=" + elem.data("id"),
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                }, function() {});
        });
    }
});
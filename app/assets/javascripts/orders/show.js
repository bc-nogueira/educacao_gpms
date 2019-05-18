$( document ).on("turbolinks:load", function() {
    if($("#removeCourseCart").length > 0) {
        $(document).on("click", "#removeCourseCart", function() {
            const order = $(this).data("order");
            const id = $(this).data("id");
            const title = "Deseja excluir esse curso do carrinho?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/orders/" + order + "/remove_course?course_id=" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                }, function() {});
        });
    }
});
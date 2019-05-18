$( document ).on("turbolinks:load", function() {
    if($("#destroyTeacherRating").length > 0) {
        $(document).on("click", "#destroyTeacherRating", function() {
            const title = "Deseja excluir avaliação?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/teacher_ratings/" + $("#destroyTeacherRating").data("id"),
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('Sua avaliação está a salvo.')});
        });
    }
});

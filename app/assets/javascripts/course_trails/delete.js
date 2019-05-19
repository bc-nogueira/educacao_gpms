$( document ).on("turbolinks:load", function() {
    if($("#removeCourse").length > 0) {
        $(document).on("click", "#removeCourse", function() {
            const id = $(this).data("id");
            const title = "Deseja remover o curso desse trilha?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/course_trails/" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('O curso não foi removido da trilha.')});
        });
    }
});
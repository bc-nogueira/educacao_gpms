$( document ).on("turbolinks:load", function() {
    if($("#destroyLesson").length > 0) {
        $(document).on("click", "#destroyLesson", function() {
            const id = $(this).data("id");
            const title = "Deseja excluir aula?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/lessons/" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('Sua aula está a salvo.')});
        });
    }
});
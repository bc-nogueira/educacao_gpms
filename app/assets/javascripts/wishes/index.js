$( document ).on("turbolinks:load", function() {
    if($("#destroyWish").length > 0) {
        $(document).on("click", "#destroyWish", function() {
            const title = "Deseja excluir esse curso da lista de desejos?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/wishes/" + $("#destroyWish").data("id"),
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                }, function() { alertify.success("O seu desejo foi salvo!") });
        });

        $(document).on("click", "#destroyAllWishes", function() {
            const title = "Deseja excluir todos os cursos da lista de desejos?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/wishes/destroy_all",
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                }, function() { alertify.success("Os seus desejos estão salvos!") });
        });
    }
});

// http://localhost:3000/wishes/3

// http://localhost:3000/wishes/destroy_all
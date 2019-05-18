$( document ).on("turbolinks:load", function() {
    if($("#destroyDiscount").length > 0) {
        $(document).on("click", "#destroyDiscount", function() {
            const id = $(this).data("id");
            const title = "Deseja excluir desconto?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/discounts/" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('O desconto está a salvo.')});
        });
    }
});
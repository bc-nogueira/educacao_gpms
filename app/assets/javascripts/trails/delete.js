$( document ).on("turbolinks:load", function() {
    if($(".destroyTrail").length > 0) {
        $(document).on("click", ".destroyTrail", function() {
            const id = $(this).data("id");
            const title = "Deseja excluir trilha?";
            const message = "Essa ação não poderá ser desfeita.";
            alertify.confirm(title, message,
                function(){
                    $.ajax({
                        url: "/trails/" + id,
                        data: { authenticity_token: $('[name="csrf-token"]')[0].content},
                        method: 'DELETE',
                    });
                },
                function(){ alertify.success('A trilha está a salvo.')});
        });
    }
});
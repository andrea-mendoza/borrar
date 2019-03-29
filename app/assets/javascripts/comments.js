$(function(){
    $('.new_comment').validate({
        rules: { 'comment[commentary]': 'required' },
        messages: { 'comment[commentary]': { required: 'El comentario no puede estar vacío'} },
        errorElement : 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });
})
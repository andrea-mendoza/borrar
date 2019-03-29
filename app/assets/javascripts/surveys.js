$(function(){
    $('#new_survey').validate({
        rules: { 'survey[name]': 'required'},
        messages: { 'survey[name]': 'El título no puede estar vacío'},
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    })
})
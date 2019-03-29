$(function() {
    $.validator.setDefaults({
        ignore:[]
      });
    $('#new_assingment').validate({
        rules: {
            'assingment[director_id]': 'required',
            'assingment[tutor_id]': 'required',
            'assingment[relator_id]': 'required'
        },
        messages: {
            'assingment[director_id]': 'Debe elegir al director',
            'assingment[tutor_id]': 'Debe elegir un tutor',
            'assingment[relator_id]': 'Debe elegir un relator'
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    })

    $('.edit_assingment').validate({
        rules: {
            'assingment[director_id]': 'required',
            'assingment[tutor_id]': 'required',
            'assingment[relator_id]': 'required'
        },
        messages: {
            'assingment[director_id]': 'Debe elegir al director',
            'assingment[tutor_id]': 'Debe elegir un tutor',
            'assingment[relator_id]': 'Debe elegir un relator'
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    })
})
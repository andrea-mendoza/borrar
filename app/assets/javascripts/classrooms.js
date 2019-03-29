$(function(){
    $.validator.setDefaults({
        ignore:[]
    });

    $('#new_classroom').validate({
        rules: {
            'classroom[ambient]' : 'required',
            'classroom[defense_date]' : 'required',
            'classroom[defense_hour]' : 'required'
        },
        messages: {
            'classroom[ambient]' : 'El ambiente no puede estar vacío',
            'classroom[defense_date]' : 'Debe elegir una fecha',
            'classroom[defense_hour]' : 'Debe elegir una hora'
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    })

    $('.edit_classroom').validate({
        rules: {
            'classroom[ambient]' : 'required',
            'classroom[defense_date]' : 'required',
            'classroom[defense_hour]' : 'required'
        },
        messages: {
            'classroom[ambient]' : 'El ambiente no puede estar vacío',
            'classroom[defense_date]' : 'Debe elegir una fecha',
            'classroom[defense_hour]' : 'Debe elegir una hora'
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    })
})
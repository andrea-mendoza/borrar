$(function() {
    $.validator.setDefaults({
        ignore:[]
      });
    $('#event_form').validate({
        rules: {
            'event[name]': 'required',
            'event[semester]': 'required',
            'event[career]': 'required',
            'event[limit_date]': 'required'
        },
        messages: { 
            'event[name]': 'El nombre no puede estar vacío',
            'event[semester]': 'Debe elegir un semestre',
            'event[career]': 'Debe elegir la carrera',
            'event[limit_date]': 'Debe elegir una fecha límite'
        },
        errorElement: 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });
});
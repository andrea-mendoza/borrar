$(function(){
    $('#new_user').validate({
        rules: {
            'user[name]': 'required',
            'user[lastname]': 'required',
            'user[username]': 'required',
            'user[career]': 'required',
            'user[phone]': { maxlength: 8 },
            'user[password]': {
                required: true,
                minlength: 6
            },
            'user[password_confirmation]': {
                required: true,
                minlength: 6,
                equalTo: "#user_password"
            }
        },
        messages: {
            'user[name]': 'El nombre no puede estar vacío',
            'user[lastname]': 'Los apellidos no pueden estar vacíos',
            'user[username]': 'El nombre de usuario no puede estar vacío',
            'user[career]': 'Debe elegir una carrera',
            'user[phone]': { maxlength: 'El celular no puede tener más de 8 caracteres' },
            'user[password]': {
                required: 'Ingrese su contraseña',
                minlength: 'La contraseña debe tener al menos 6 caracteres'
            },
            'user[password_confirmation]': {
                required: 'Repita su contraseña',
                minlength: 'La contraseña debe tener al menos 6 caracteres',
                equalTo: 'La contraseña debe coincidir con la anterior'
            }
        },
        errorElement: 'div',
        errorPlacement: function(error, element){
            error.insertAfter(element);
        }
    })

    $('.edit_user').validate({
        rules: {
            'user[name]': 'required',
            'user[lastname]': 'required',
            'user[username]': 'required',
            'user[career]': 'required',
            'user[email]': 'required',
            'user[phone]': { maxlength: 8 }
        },
        messages: {
            'user[name]': 'El nombre no puede estar vacío',
            'user[lastname]': 'Los apellidos no pueden estar vacíos',
            'user[username]': 'El nombre de usuario no puede estar vacío',
            'user[career]': 'Debe elegir una carrera',
            'user[email]': 'El correo no puede estar vacío',
            'user[phone]': { maxlength: 'El celular no puede tener más de 8 caracteres' }
        },
        errorElement: 'div',
        errorPlacement: function(error, element){
            error.insertAfter(element);
        }
    })
})
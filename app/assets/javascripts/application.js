// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require materialize
//= require activestorage
//= require toastr
//= require trix
//= require quill.min
//= require quill.global
//= require cocoon
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .

$(function() {

    $('#role_degree').change(function(){
        var optionSelected = $(this).find("option:selected");
        var textSelected = optionSelected.text();
        if(textSelected=="admin" || textSelected=="docente" || textSelected=="director")
            document.getElementById("show_degree").style.display="block";
        else
            document.getElementById("show_degree").style.display="none";
    })

    $('.dropdown-trigger').dropdown({
        coverTrigger: false,
        constrainWidth: false,
        alignment: 'right'
    });
    
    $('select').formSelect();

    $('.modal').modal();

    $('.fixed-action-btn').floatingActionButton();

    $('.tooltipped').tooltip();

    $('.datepicker').datepicker({
        minDate: new Date(),
        format: 'yyyy-mm-dd',
        i18n: {
            cancel: 'Cancelar',
            done: 'Aceptar',
            months: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
            monthsShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
            weekdaysShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
            weekdaysAbbrev: ['D','L','M','M','J','V','S']
        }
    });

    $('.timepicker').timepicker({
        i18n: {
            cancel: 'Cancelar',
            done: 'Aceptar'
        }
    });

    $('.materialize-textarea').trigger('autoresize');
})
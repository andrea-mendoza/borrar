$(function(){
    $.validator.setDefaults({
        ignore:[]
    });
    $('#new_paper').validate({
        rules: {
            'paper[doc_type]': 'required',
            'paper[title]': 'required',
            'paper[google_docs_link]': 'required',
            'paper[pdf_file]': 'required'
        },
        messages: {
            'paper[doc_type]': 'Debe elegir su tipo de documento',
            'paper[title]': 'Campo obligatorio',
            'paper[google_docs_link]': 'Campo obligatorio',
            'paper[pdf_file]': 'Debe elegir un archivo PDF'
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });

    $('.edit_paper').validate({
        rules: {
            'paper[doc_type]': 'required',
            'paper[title]': 'required',
            'paper[google_docs_link]': 'required'
        },
        messages: {
            'paper[doc_type]': 'Debe elegir su tipo de documento',
            'paper[title]': 'Campo obligatorio',
            'paper[google_docs_link]': 'Campo obligatorio'
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });
})
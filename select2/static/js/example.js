$(document).ready(function() {
    $('single').each(function() {
        $(this).select2(
            placeholder : '请选择',
        );
    });

    $('multiple').each(function() {
        $(this).select2(
            placeholder : '请选择',
        );
    });
})

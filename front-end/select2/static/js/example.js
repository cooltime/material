$(document).ready(function() {
    $('.single select').each(function() {
        $(this).select2({
            placeholder : '请选择',
            width : 'element',
            theme : 'bootstrap',
            multiple : true,
            tags : true,
            allowClear : true,
        });
    });

    $('.multiple select').each(function() {
        $(this).select2({
            placeholder : '请选择',
            width : 'element',
            theme : 'bootstrap',
            allowClear : true,
            templateResult : function() {},
            templateSelection : function() {},
        });
    });

    $('#target').on('select2:open', function(e) {
        log("select2:open", e);
    });
    $('#target').on('select2:close', function(e) {
        log("select2:close", e);
    });
    $('#target').on('select2:select', function(e) {
        log("select2:select", e);
    });
    $('#target').on('select2:unselect', function(e) {
        log("select2:unselect", e);
    });
    $('#target').on('change', function(e) {
        log("change", e);
    });

    $('#target').val(null).trigger('change');
    $('#target').val(["ABC", "DEF"]).trigger('change');
    $('#target').select2("open");
    $('#target').select2("close");
    $('#target').select2("destroy");

});

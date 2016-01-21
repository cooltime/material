$(document).ready(function() {

    $('#endTime').val(dateFormat(new Date()));
    $('#endTime').datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose : true,
    });
})

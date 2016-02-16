$(document).ready(function () {
    var targetApp = $('#selectedApp').val();
    var targetHost = $('#selectedHost').val();
    $('#app').find("option[value='" + targetApp + "']").attr('selected', true);
    $('#host').find("option[value='" + targetHost + "']").attr('selected', true);
    $('#startTime').datetimepicker({ 
        format: "yyyy-mm-dd hh:ii:ss",
    }); 
    $('#endTime').datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",
    }); 
	$('#show').click(function() { renderTable(); });
    renderTable();
});


function renderTable() {
    var app = $('#app').val();
    var host = $('#host').val();
    var start = $('#startTime').val();
    var end = $('#endTime').val();

    $.ajax({
        type : 'get', 
        url : '/index/get?app=' + app + '&host=' + host + "&startTime=" + start + "&endTime=" + end,
        dataType : 'json',
        success : function (jsonData) {
            if (jsonData.errno == 0) {
                var rawData = jsonData.data;
                var data = []
                $.each(rawData, function (i, item) {
                    var arrItem = {
                        'recordId' : i,
                        'content' : item,
                    };
                    data.push(arrItem);
                });
                $('#logger').dataTable({
                    "data": data,
                    "columns" : [
                        { data : 'recordId' },
                        { data : 'content' },
                    ],
					"destroy" : true,
//                    "bPaginate": true,
//                    "bSort" : false,
//                    "bDestroy" : true,
//                    "sPaginationType": "full_numbers",
//                    "aoColumns": [
//                        {'mData':'recordId'},
//                        {'mData':'content'},
//                    ],  
//                    "sDom": "<'row-fluid'<'span6 myBtnBox'><'span6'f>r>t<'row-fluid'<'span6'i><'span6 'p>>",
//                    "fnDrawCallback" : function () {
//                    },  
                }); 
            } else {
                alert(jsonData.errmsg);
            }   
        },  
        error : function () {}, 
    })      
}

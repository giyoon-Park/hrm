$(document).ready(function() {
	$('#searchEmp').click(function(){
		var sabun = $('#sabun').val();
		if(!sabun) {
			$('#sabun').val('0');
		}
		
		var nowPage = $('#nowPage').val();
		if(!nowPage) {
			$('#nowPage').val('0');
		}
		
		$.ajax({
			url: '/hrm/emp.search',
			type: 'POST',
			dataType: 'text',
			data: $('#frmsch').serialize(),
			contentType: false,
			processData: false,
			cache : false,
			success: function(result) {
				var html = $('#dnonelist').html(result);
				var totalCont = html.find('div#totalCount').text();
				var nowPage = html.find('div#nowPage').text();
				var list = html.find('table#ajaxtable').html();
				var paging = html.find('div#pagingbtns').html();
				
				if(totalCont == '0') {
					alert('검색 결과가 없습니다.');
				} else {
					$('#nowPage').val(nowPage);
					$('#emptable').html(list);
					$('#paging').html(paging);
				}
			},
			error: function(request, status, error){
				alert("code = " + request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	});
	
	$('.pbtn').click(function(){
		var pagebtn = $(this).text();
	});
});

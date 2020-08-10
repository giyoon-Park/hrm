$(document).ready(function() {
	if($('#ssabun').val() == 0) {
		$('#ssabun').val('');
	}

	$('#searchEmp').click(function(){
		var sabun = $('#ssabun').val();
		var nowPage = $('#nowPage').val();

		if(sabun == '') {
			$('#sabun').val(0);
		} else {
			$('#sabun').val(sabun);
		}

		if(nowPage == '') {
			$('#nowPage').val(0);
		}

		$('#frmsch').attr('action', '/hrm/insaListForm.do');
		$('#frmsch').submit();
	});
	
	$('.pbtn').click(function(){
		var pagebtn = $(this).text();
		
		if(pagebtn == 'PRE') {
			$('#nowPage').val('${PAGE.startPage - 1}');
		} else if(pagebtn == 'NEXT') {
			$('#nowPage').val('${PAGE.endPage + 1}');
		} else {
			$('#nowPage').val(pagebtn);
		}
		
		$('#frmsch').attr('action', '/hrm/insaListForm.do');
		$('#frmsch').submit();
	});
	
	$('.content').click(function(){
		var sabun = $(this).attr('id');

		$('#frmsch').attr('action', '/hrm/insaUpdateForm.do?sabun=' + sabun);
		$('#frmsch').submit();
	})
});

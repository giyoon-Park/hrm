$(document).ready(function() {
	$('#searchEmp').click(function(){
		var sabun = $('#sabun').val();
		if(!sabun) {
			
		}
		
		$.ajax({
			url: '/hrm/emp.search',
			type: 'POST',
			dataType: 'json',
			data: $('#frmsch').serialize(),
			success: function(data) {
				if(data.PAGE.totalCount == 0) {
					$('#noresult').removeClass('dnone');
					alert('검색 결과가 없습니다.');
				} else {
					var htmlt = '<c:forEach var="emp" items="${data.LIST}">';
					htmlt += '<tr>';
					htmlt += '<td>${emp.sabun}</td>';
					htmlt += '<td>${emp.name}</td>';
					htmlt += '<td>${emp.reg_no}</td>';
					htmlt += '<td>${emp.hp}</td>';
					htmlt += '<td>${emp.pos_gbn_code}</td>';
					htmlt += '<td>${emp.join_day}</td>';
					htmlt += '<td>${emp.retire_day}</td>';
					htmlt += '<td>${emp.put_yn}</td>';
					htmlt += '<td>${emp.salary}</td>';
					htmlt += '</tr>';
					htmlt += '</c:forEach>';

					var htmlp = '<c:if test="${data.PAGE.startPage ge (data.PAGE.pageGroup + 1)}">'
					htmlp += '<span class="btn btn-outline-primary">PRE</span>';
					htmlp += '</c:if>';
					htmlp += '<c:forEach var="pageNo" begin="${data.PAGE.startPage}" end="${data.PAGE.endPage}">';
					htmlp += '<c:if test="${data.PAGE.nowPage eq pageNo}">';
					htmlp += '<span class="btn btn-primary pbtn">${pageNo}</span>';
					htmlp += '</c:if>';
					htmlp += '<c:if test="${data.PAGE.nowPage ne pageNo}">';
					htmlp += '<span class="btn btn-outline-primary pbtn">${pageNo}</span>';
					htmlp += '</c:if>';
					htmlp += '</c:forEach>';
					htmlp += '<c:if test="${data.PAGE.endPage ne data.PAGE.totalPage}">';
					htmlp += '<span class="btn btn-outline-primary">NEXT</span>';
					htmlp += '</c:if>';

					$('#noresult').addClass('dnone');
					$('#emptable').append(htmlt);
					$('#paging').append(htmlp);
				}
			},
			error: function(request, status, error){
				alert("code = " + request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	});
});

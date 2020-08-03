function goPopup() {
	var pop = window.open(
		"/hrm/popup/jusoPopup.jsp",
		"pop",
		"width=570,height=420,scrollbars=yes,resizable=yes"
	);
}

function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
	$("input#zip").val(zipNo);
	$("input#addr1").val(roadAddrPart1);
	$("input#addr2").val(addrDetail);
}

$(document).ready(function() {
	$("#hp").keyup(function() {
		$(this).val(
			$(this).val().replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1\d{3}|^0\d{2})(\d+)?(\d{4})$/, "$1-$2-$3")
			.replace("--", "-")
		);
	});
	
	$("#phone").keyup(function() {
		$(this).val(
			$(this).val()
			.replace(/[^0-9]/g, "")
			.replace(/(^02|^0505|^1\d{3}|^0\d{2})(\d+)?(\d{4})$/, "$1-$2-$3")
			.replace("--", "-")
		);
	});
	
	$("#cmp_reg_no").keyup(function() {
		$(this).val(
			$(this).val()
			.replace(/[^0-9]/g, "")
			.replace(/(^\d{3})(\d{2})(\d{5})$/, "$1-$2-$3")
			.replace("--", "-")
		);
	});

	$('#profileimg').change(function(e) {
		var vfile = URL.createObjectURL(e.target.files[0]);
		$('#profilef').attr('src', vfile);
	});
	
	$('#cmp_reg_img').change(function(e) {
		var rname = $(this).val();
		rname = rname.substring(rname.lastIndexOf('\\') + 1);
		$('#ori_cmp_reg_img').val(rname);
		var rfile = URL.createObjectURL(e.target.files[0]);
		$('#preview_cmp_reg').attr('src', rfile);
	});
	
	$('#resume_img').change(function(e) {
		var cname = $(this).val();
		cname = cname.substring(cname.lastIndexOf('\\') + 1);
		$('#resume').val(cname);
		var cfile = URL.createObjectURL(e.target.files[0]);
		$('#preview_carrier').attr('src', cfile);
	});
	
	$('#show_cmp_reg_img').click(function() {
		$('#cmp_modal_header').removeClass('dnone');
		$('#preview_cmp_reg').removeClass('dnone');
		$('#carrier_modal_header').addClass('dnone');
		$('#preview_carrier').addClass('dnone');
	});
	
	$('#show_resume_img').click(function() {
		$('#carrier_modal_header').removeClass('dnone');
		$('#preview_carrier').removeClass('dnone');
		$('#cmp_modal_header').addClass('dnone');
		$('#preview_cmp_reg').addClass('dnone');
	});
});

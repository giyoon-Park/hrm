function goPopup(){
    var pop = window.open("/hrm/popup/jusoPopup.jsp","pop","width=570,height=420,scrollbars=yes,resizable=yes");
}

function jusoCallBack(roadAddrPart1,addrDetail,zipNo) {
    $('input#zip').val(zipNo);
    $('input#addr1').val(roadAddrPart1);
    $('input#addr2').val(addrDetail);
}

$(document).ready(function(){
	$(document).on("keyup", "#hp", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1\d{3}|^0\d{2})(\d+)?(\d{4})$/,"$1-$2-$3").replace("--", "-") ); });
	$(document).on("keyup", "#phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1\d{3}|^0\d{2})(\d+)?(\d{4})$/,"$1-$2-$3").replace("--", "-") ); });
	$(document).on("keyup", "#cmp_reg_no", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^\d{3})(\d{2})(\d{5})$/,"$1-$2-$3").replace("--", "-") ); });
});
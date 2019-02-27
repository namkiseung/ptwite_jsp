//api사용하자
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=siup_zip]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=siup_addr1]').val(data.address);
			$('[name=siup_addr2]').val(data.buildingName);
		}
	}).open();
}

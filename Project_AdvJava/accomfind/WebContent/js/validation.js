function checkEmpty(data) {
	if (data.length == 0)
		return false
	else
		return true
}
function checkControls(arr) {
	flag = 0;
	for (i = 0; i < arr.length; i++) {
		if (arr[i].checked) {
			flag = 1;
			break;
		}

	}
	if (flag == 0)
		return false;
	else
		return true;

}
function checkCombo(info) {
	if (info == "default") {
		return false;
	} else
		return true

}
function checkLength(data) {
	if (data.length <= 8)
		return false
	else
		return true

}

function addCheck(){
	
	if(frm.custname.value.length==0){
		alert("회원성명을 입력하세요.")
		frm.custname.focus()
		return false
	}
	else if(frm.phone.value.length==0){
		alert("회원전화를 입력하세요.")
		frm.phone.focus()
		return false
	}
	else if(frm.address.value.length==0){
		alert("회원주소를 입력하세요.")
		frm.address.focus()
		return false
	}
	else if(frm.grade.value.length==0){
		alert("회원등급을 입력하세요.")
		frm.grade.focus()
		return false
	}
	else if(frm.city.value.length==0){
		alert("도시코드를 입력하세요.")
		frm.city.focus()
		return false
	}
	else{
		alert("회원등록이 완료되었습니다!")
		document.frm.submit()
		
	}
	return true

}

function search(){
	window.location = 'list.jsp'
}

function modify(){
	alert("회원정보 수정이 완료되었습니다!")
		document.frm.submit()
}
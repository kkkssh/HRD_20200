<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section style="position: fixed; top:140px; height:100%; width:100%; 
				background-color: lightgray;">
<h2 style="text-align: center; padding-bottom: 50px">쇼핑몰 회원관리 프로그램</h2>
<form action="joinAction.jsp" method="post" name="frm"
		style="display:flex; align-content: center; justify-content: center; text-align: center; ">
		<input type="hidden" name="mode" value="join">
<table border="1">
<%
request.setCharacterEncoding("UTF-8");

Connection conn = null;
PreparedStatement pstmt = null;
String custno = "";

try{
	conn = OracleUtil.getConnection();
	String sql = "SELECT MAX(custno)+1 custno FROM member_tbl_02";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	custno = rs.getString(1);
	
}catch(Exception e){
	e.printStackTrace();
}



%>
<tr>
<td>회원번호(자동발생)</td>
<td><input type="text" name="custno" value="<%=custno %>" readonly="readonly"></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" name="custname"></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" name="phone"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" name="address"></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type="text" name="joindate" disabled="disabled"></td>
</tr>
<tr>
<td>고객등급[A:VIP,B:일반,C:직원]</td>
<td><input type="text" name="grade"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type="text" name="city"></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" onclick="return addCheck()">
<input type="button" value="조회" onclick="return search()">
</td>
</tr>







</table>

</form>

</section>

<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>
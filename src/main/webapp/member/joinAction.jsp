<%@page import="DBPKG.OracleUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAction</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt = null;
String mode = request.getParameter("mode");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
	conn = OracleUtil.getConnection();
	String sql = "";
	switch(mode){
	case "join":
		sql = "insert into member_tbl_02 values(?,?,?,?,sysdate,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="join.jsp"></jsp:forward>
		<%
		
		
		break;
	case "modify":
		sql = "update member_tbl_02 set custname=?,phone=?,address=?,grade=?,city=? where custno =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, grade);
		pstmt.setString(5, city);
		pstmt.setString(6, custno);
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="list.jsp"></jsp:forward>
		<%
		break;
	}
	
	
	
	
}catch(Exception e){
	e.printStackTrace();
}




%>

</body>
</html>
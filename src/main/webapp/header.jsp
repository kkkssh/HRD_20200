<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

<header style="position: fixed; top:0px; height:100px; width:100%; text-align:center; line-height:100px;
				background-color: blue; color: white; font-size:25px">
				쇼핑몰 회원관리 ver 1.0
</header>

<nav style="position: fixed; top:100px; height:40px; width:100%; line-height:40px;
				background-color: lightblue;">
<a href="<%=request.getContextPath() %>/member/join.jsp" style="text-decoration:none; margin-left:20px;">회원등록</a>
<a href="<%=request.getContextPath() %>/member/list.jsp" style="text-decoration:none; margin-left:20px;">회원목록조회/수정</a>
<a href="<%=request.getContextPath() %>/sale/salary.jsp" style="text-decoration:none; margin-left:20px;">회원매출조회</a>
<a href="<%=request.getContextPath() %>" style="text-decoration:none; margin-left:40px;">홈으로</a>
</nav>
</body>
</html>
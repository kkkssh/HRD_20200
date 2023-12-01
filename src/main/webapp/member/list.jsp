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
<title>list</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<section
		style="position: fixed; top: 140px; height: 100%; width: 100%; background-color: lightgray;">
		<h2 style="text-align: center; padding-bottom: 50px">쇼핑몰 회원관리
			프로그램</h2>
		<form action="joinAction.jsp" method="post" name="frm"
			style="display: flex; align-content: center; justify-content: center; text-align: center;">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>


				<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				String grade = "";

				try {
					conn = OracleUtil.getConnection();
					String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
					pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
						grade = rs.getString("grade");
						switch (grade) {
						case "A":
					grade = "VIP";
					break;
						case "B":
					grade = "일반";
					break;
						case "C":
					grade = "직원";
					break;

						}
				%>
				<tr>
					<td><a href="modify.jsp?custno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getDate(5)%></td>
					<td><%=grade%></td>
					<td><%=rs.getString(7)%></td>
				</tr>





				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>






			</table>

		</form>

	</section>

	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript" src="../js/check.js"></script>
</body>
</html>
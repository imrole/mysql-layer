<%--
  Created by IntelliJ IDEA.
  User: 马骏
  Date: 2019/12/17
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="dao.UserDao"%>
<%@ page import="entity.User"%>
<%
    String us=request.getParameter("uname");
    if(UserDao.deleteUser(us))
    {
        out.print("<script>alert('删除成功'); location.href='home.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('删除失败，请重试'); location.href='home.jsp';</script>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>

</body>
</html>

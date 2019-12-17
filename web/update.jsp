<%--
  Created by IntelliJ IDEA.
  User: 马骏
  Date: 2019/12/17
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String us=request.getParameter("uname");
    if(us!=null)
    {
        session.setAttribute("updatausername",us);
    }
    else
    {
        out.print("<script>alert('请登录'); location.href='login.jsp';</script> ");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>
<form action="updateuser.jsp" method="post">
    用户名：<input type="text" name="uname" value=<%= request.getParameter("uname")%>>
    <br>
    密码：<input type="text" name="upwd" value=<%= request.getParameter("upwd")%>>
    <br>
    <input type="submit" value="确定">
</form>
</body>
</html>

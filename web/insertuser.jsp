<%--
  Created by IntelliJ IDEA.
  User: 马骏
  Date: 2019/12/17
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="dao.UserDao"%>
<%@ page import="entity.User"%>
<%
    String us=request.getParameter("uname");
    String pw=request.getParameter("upwd");

    User user= new User();
    user.setUsername(us);
    user.setPassword(pw);
%>
<%
    out.print(user.getUsername());

    out.print(user.getPassword());

    //UserDao.login(user)>0
    if(UserDao.insertUser(user))
    {
        out.print("<script>alert('添加成功'); location.href='home.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('添加失败，请稍后尝试'); location.href='insert.jsp';</script>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>

</body>
</html>

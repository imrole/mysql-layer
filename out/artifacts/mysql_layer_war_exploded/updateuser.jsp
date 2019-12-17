<%--
  Created by IntelliJ IDEA.
  User: 马骏
  Date: 2019/12/17
  Time: 9:11
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
    //UserDao.login(user)>0
    if(UserDao.updateUser(session.getAttribute("updatausername").toString(), user))
    {
        out.print("<script>alert('修改成功'); location.href='home.jsp';</script>");
        //response.sendRedirect("home.jsp");
        session.setAttribute("val",us);
    }
    else
    {
        out.print("<script>alert('修改失败，请重试'); location.href='update.jsp';</script> ");
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

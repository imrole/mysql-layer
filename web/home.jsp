<%--
  Created by IntelliJ IDEA.
  User: 马骏
  Date: 2019/12/17
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="dao.UserDao"%>
<%@ page import="entity.User"%>
<%@ page import="java.util.List"%>
<%
    //为了解决相对路径的问题，可返回站点的根路径
    String path = request.getContextPath();
    //request.getScheme,可以返回当前页面使用的协议-----http 或是 https
    //request.getServerName可以返回当前页面所在的服务器的名字-----localhost
    //request.getServerPort可以返回当前页面所在的服务器使用的端口------8888
    //request.getContextPath可以返回当前页面所在的应用的名字 -----List.jsp
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    if(session.getAttribute("val") != null)
    {
        List<User> userlist = new ArrayList<User>();
        userlist = UserDao.selectAllUser();

        //request.setAttribute用于传值（只能在本页面用）
        //方法：（“a”,b）------b:传递的值，a:方便调用起的名字
        request.setAttribute("list", userlist);
        session.setAttribute("val", null);
    }
    else
    {
        out.print("<script>alert('请先登录'); location.href='login.jsp';</script>");
        //response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>all </title>
    <base href="<%=basePath%>">
</head>
<body>
<table>
    <tr>
        <td>用户名</td>
        <td>密码</td>
        <td colspan="2">操作</td>

    </tr>
    <c:forEach items="${requestScope.list}" var="res" varStatus="ids">
        <tr>
            <td><input type="text" value="${res.getUsername()}" name="nam"></td>
            <td><input type="text" value="${res.getPassword()}" name="pwd"></td>
            <td><input type="button" value="修改" onclick="javascrtpt:window.location.href='update.jsp?uname=${res.getUsername()}&&upwd=${res.getPassword()}'"></td>
            <td><input type="button" value="删除" onclick="javascrtpt:window.location.href='delete.jsp?uname=${res.getUsername()}'"></td>
            <td></td>
        </tr>
    </c:forEach>
</table>
<form action="select.jsp" method="get">
    <input type="text" name="usernametext"><input type="submit" value="搜索" >
    <input type="button" value="添加" onclick="window.location.href='insert.jsp'">
</form>
</body>
</html>

<%@ page import="java.util.ArrayList" %>
<%@ page import="model.users" %><%--
  Created by IntelliJ IDEA.
  User: ss
  Date: 8.7.2017
  Time: 09:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <link href="../style/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="../style/css/bootstrap-responsive.css" rel="stylesheet"
          media="screen">
    <link href="../style/css/bootstrap-responsive.min.css" rel="stylesheet"
          media="screen">
    <script src="../style/js/bootstrap.min.js"></script>
    <script src="../style/js/bootstrap.js"></script>

</head>
<body>
<%
    ArrayList<users> usersArrayList = new ArrayList<>();
    try {
        usersArrayList = (ArrayList<users>) request.getAttribute("userArrayList");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<br>
<br>
<div class="container">
    <div class="panel-group">
        <div class="panel panel-default">
            <b>
                <div class="panel-heading" align="center">KULLANICI LİSTESİ</div>
            </b>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>İSİM</th>
                        <th>SOYİSİM</th>
                        <th>YAŞ</th>
                        <th>EĞİTİM</th>
                        <th></th>
                    </tr>
                    </thead>
                    <%
                        for (users users1 : usersArrayList) {
                    %>
                    <tbody>
                    <tr>
                        <th scope="row"></th>
                        <td><%=users1.getId()%>
                        </td>
                        <td><%=users1.getUserName()%>
                        </td>
                        <td><%=users1.getUserSurname()%>
                        </td>
                        <td><%=users1.getUserAge()%>
                        </td>
                        <td><%=users1.getUserEdu().getUserEducation()%>
                        </td>
                        <td>
                            <a href="/UserControlServlet?param=1"
                                type="button" class="btn btn-info btn-xs" name="updateUser" id="updateUser"><span
                                        class="glyphicon glyphicon-pencil"></span> Edit
                            </a>
                         </td>
                        <td>
                            <form name="form2" method="GET" action="/UserControlServlet">
                                <input type="hidden" name="islem" value="userDelete">
                                <input type="hidden" name="deleteUserID" value="<%=users1.getId()%>">
                                <button type="submit" class="btn btn-danger btn-xs">
                                    <span class="glyphicon glyphicon-trash"></span> Sil
                                </button>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                    <% } %>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ page import="model.users" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ss
  Date: 6.7.2017
  Time: 09:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    users users;
    ArrayList<users> usersArrayList = new ArrayList<>();
    try {
        if (request.getParameter("userID") != null) {       /* Kullanıcı Güncelleme */
            users = new users();
            users.setId(Integer.parseInt(request.getParameter("userID")));
            users.setUserName(request.getParameter("AD"));
            users.setUserSurname(request.getParameter("SOYAD"));
            users.setUserAge(Integer.parseInt(request.getParameter("AGE")));
            users.setEducationId(Integer.parseInt(request.getParameter("EDUCATION")));
            users.updateUser(users);
            usersArrayList = users.showUsers();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    try {
        if (request.getParameter("delete_user") != null) {      /* Kullanıcı Silme */
            users = new users();
            String userId = request.getParameter("delete_user");
            users.deleteUser(userId);
            usersArrayList = users.showUsers();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    try {
        if (request.getParameter("find_user") != null) {      /* Kullanıcı Arama */
            users = new users();
            String findUser = request.getParameter("find_user");
            usersArrayList = users.findUser(null, findUser);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    if (request.getParameter("pageNum") != null) {      /* Kullanıcı Ekleme */
        if (request.getParameter("pageNum").equals("0")) {
            String userName = request.getParameter("AD");
            String userSurname = request.getParameter("SOYAD");
            int userAge = Integer.parseInt(request.getParameter("AGE"));
            int educationId = Integer.parseInt(request.getParameter("EDUCATION"));

            if (userName != null && userSurname != null && String.valueOf(userAge) != null && request.getParameter("EDUCATION") != null) {
                users = new users(userName, userSurname, userAge, educationId);
                if (users.getInsertUser()) {
                    usersArrayList = users.showUsers();
                }
            }

        } else if (request.getParameter("pageNum").equals("1")) {       /* Kullanıcı Listeleme */
            users = new users();
            usersArrayList = users.showUsers();
        }
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
                        <td><a href="update.jsp?userID=<%=users1.getId()%>">
                            <button type="button" class="btn btn-info btn-xs" name="editUser">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                        </a>
                        </td>
                        <td><a href="kontrol.jsp?delete_user=<%=users1.getId()%>">
                            <button type="button" class="btn btn-danger btn-xs" name="deleteUser">
                                <span class="glyphicon glyphicon-trash"></span> Sil
                            </button>
                        </a>
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

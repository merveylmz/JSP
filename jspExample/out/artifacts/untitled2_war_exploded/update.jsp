<%@ page import="model.users" %>
<%@ page import="java.util.ArrayList" %>
<%--
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

<body>
<%
    String userID = "0";
    users user = new users();
    ArrayList<users> usersArrayList = new ArrayList<>();
    try {
        userID = request.getParameter("userID");
        usersArrayList = user.findUser(userID, null);
        for (users users : usersArrayList) {
            user = users;
        }
    } catch (Exception e) {
    }
%>
<br>
<br>
<div class="panel-group">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-default">
            <div class="panel-heading" align="center">GÜNCELLEME PANELİ</div>
            <div class="panel-body">
                <div class="col-xs-8 col-sm-12 " style="background-color:white" ;>
                    <div class="row">
                        <form name="form2" method="post" action="kontrol.jsp?userID=<%=userID%>">
                            <div class="form-group">
                                <label for="AD">ADINIZ</label>
                                <input type="text" class="form-control" name="AD" id="AD"
                                       value="<%=user.getUserName()%>"
                                       placeholder="Ad">
                            </div>
                            <div class="form-group">
                                <label for="SOYAD">SOYADINIZ</label>
                                <input type="text" class="form-control" name="SOYAD" id="SOYAD"
                                       value="<%=user.getUserSurname()%>" placeholder="Soyad">
                            </div>
                            <div class="form-group">
                                <label for="AGE">YAŞINIZ</label>
                                <input type="text" class="form-control" name="AGE" id="AGE"
                                       value="<%=user.getUserAge()%>"
                                       placeholder="Yaş">
                            </div>
                            <div class="form-group">
                                <label>EĞİTİM</label>
                                <select class="form-control" name="EDUCATION" id="EDUCATION">
                                    <option value="1">Lise</option>
                                    <option value="2">Ön Lisans</option>
                                    <option value="3">Lisans</option>
                                    <option value="4">Yüksek Lisans</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-default" name="update" id="update" value="GÜNCELLE">
                                GÜNCELLE
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
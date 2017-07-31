<%--
  Created by IntelliJ IDEA.
  User: ss
  Date: 8.7.2017
  Time: 09:22
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
    String pageNum1 = "0", pageNum2 = "1";
%>
<br>
<br>
<div class="panel-group">
    <div class="col-xs-12 col-sm-6 margin-top:25pix;">
        <div class="panel panel-default">
            <div class="panel-heading" align="center">KAYIT PANELİ</div>
            <div class="panel-body">
                <div class="col-xs-8 col-sm-12 " style="background-color:white" ;>
                    <div class="row">
                        <form name="form2" method="post" action="/UserControlServlet">
                            <div class="form-group">
                                <label for="NAME">ADINIZ</label>
                                <input type="text" class="form-control" name="NAME" id="NAME" placeholder="Ad" required>
                            </div>
                            <div class="form-group">
                                <label for="SURNAME">SOYADINIZ</label>
                                <input type="text" class="form-control" name="SURNAME" id="SURNAME" placeholder="Soyad"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="AGE">YAŞINIZ</label>
                                <input type="text" class="form-control" name="AGE" id="AGE" placeholder="Yaş" required>
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
                            <button type="submit" class="btn btn-default" name="insertUser" id="insertUser" value="KAYIT OL">
                                KAYIT OL
                            </button>

                        </form>
                        <form name="form1" method="post" action="/UserControlServlet">
                            <button type="submit" class="btn btn-default" name="showUser" id="showUser" value="KAYIT LISTELE">
                                KAYIT LISTELE
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-6 margin-top:25pix;">
        <div class="panel panel-default">
            <div class="panel-heading" align="center">ARAMA PANELİ</div>
            <div class="panel-body">
                <div class="col-xs-8 col-sm-12" style="background-color: white" ;>
                    <div class="row">
                        <form name="form1" method="post" action="/UserControlServlet">
                            <div class="form-group">
                                <label for="find_user">Aranacak Kullanıcı</label>
                                <input type="text" class="form-control" name="find_user" id="find_user"
                                       placeholder="Aranacak Kullanıcı" required>
                            </div>
                            <button type="submit" name="findUser" id="findUser" value="Arama Yap" class="btn btn-default">ARAMA
                                YAP
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

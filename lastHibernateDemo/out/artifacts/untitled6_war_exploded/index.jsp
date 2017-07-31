<%@ page import="Pojo.Employee" %>
<%@ page import="PojoDaoImpl.EmployeeDao" %>
<%@ page import="PojoDaoImpl.DepartmentDao" %>
<%@ page import="com.sun.xml.internal.messaging.saaj.packaging.mime.util.LineInputStream" %>
<%@ page import="java.util.List" %>
<%@ page import="Pojo.Department" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Util.Warnings" %><%--
  Created by IntelliJ IDEA.
  User: menginar
  Date: 06.07.2017
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="Style/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <script src="Style/js/bootstrap.min.js"></script>
    <script src="Style/js/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>Home</title>
</head>
<body>
<%
    Warnings warnings = new Warnings();
    List<Department> departmentList = new ArrayList<>();
    DepartmentDao departmentDao = new DepartmentDao();

    departmentList = departmentDao.getDepartmentAll();
%>
<div class="container-fluid" style="margin-top: 25px;">
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Employee Register</div>
                <div class="panel-body">
                    <%
                        int warningNumberEmployee = 0;
                        try {
                            warningNumberEmployee = (int) (request.getSession().getAttribute("warningNumberEmployee"));
                        } catch (Exception e) {
                        }

                        if (warningNumberEmployee == 1) {
                            request.getSession().removeAttribute("warningNumberEmployee");
                    %>
                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberEmployee)%>
                    </div>
                    <% }

                        if (warningNumberEmployee == 2) {
                            request.getSession().removeAttribute("warningNumberEmployee");
                    %>
                    <div class="alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberEmployee)%>
                    </div>
                    <% } %>

                    <form action="/EmployeeControlServlet" method="post">
                        <div class="form-group">
                            <label for="employeeName">Employee Name</label>
                            <input type="text" class="form-control" id="employeeName" name="employeeName"
                                   placeholder="Employee Name">
                        </div>

                        <div class="form-group">
                            <label for="employeeSurname">Employee Surname</label>
                            <input type="text" class="form-control" id="employeeSurname" name="employeeSurname"
                                   placeholder="Employee Surname">
                        </div>

                        <div class="form-group">
                            <label for="employeSalary">Employee Salary</label>
                            <input type="text" class="form-control" id="employeSalary" name="employeSalary"
                                   placeholder="Employee Salary">
                        </div>

                        <div class="form-group">
                            <label for="departmentId">Department Name</label>
                            <select class="form-control" id="departmentId" name="departmentId">
                                <% for (Department department : departmentList) { %>
                                    <option value="<%=department.getId()%>"> <%=department.getDepartmentName()%></option>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="employeeAdd"
                                value="Employee Register">Employee Register
                        </button>

                        <button type="submit" class="btn btn-primary" name="employeeList"
                                value="Employee List">Employee List
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Department Register</div>
                <div class="panel-body">
                    <%
                        int warningNumberDepartment = 0;
                        try {
                            warningNumberDepartment = (int) (request.getSession().getAttribute("warningNumberDepartment"));
                        } catch (Exception e) {
                        }

                        if (warningNumberDepartment == 1) {
                            request.getSession().removeAttribute("warningNumberDepartment");
                    %>
                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberDepartment)%>
                    </div>

                    <% }

                        if (warningNumberDepartment == 2) {
                            request.getSession().removeAttribute("warningNumberDepartment");
                    %>

                    <div class="alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberDepartment)%>
                    </div>

                    <% } %>
                    <form action="/DepartmentControlServlet" method="post">

                        <div class="form-group">
                            <label for="departmentName">Department Name</label>
                            <input type="text" class="form-control" id="departmentName" name="departmentName"
                                   placeholder="Department Name">
                        </div>

                        <div class="form-group">
                            <label for="departmentDesc">Department Description</label>
                            <input type="text" class="form-control" id="departmentDesc"
                                   name="departmentDesc" placeholder="Department Description">
                        </div>

                        <button type="submit" class="btn btn-primary" name="departmentAdd"
                                value="Department Register">Department Register
                        </button>

                        <button type="submit" class="btn btn-primary" name="departmentList"
                                value="Department List">Department List
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">Meeting Register</div>
                <div class="panel-body">

                    <%
                        int warningNumberMeeting = 0;
                        try {
                            warningNumberMeeting = (int) (request.getSession().getAttribute("warningNumberMeeting"));
                        } catch (Exception e) {
                        }

                        if (warningNumberMeeting == 1) {
                            request.getSession().removeAttribute("warningNumberMeeting");
                    %>

                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberMeeting)%>
                    </div>

                    <% }

                        if (warningNumberMeeting == 2) {
                            request.getSession().removeAttribute("warningNumberMeeting");
                    %>

                    <div class="alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberMeeting)%>
                    </div>

                    <% } %>

                    <form action="/MeetingControlServlet" method="post">

                        <div class="form-group">
                            <label for="meetingName">Meeting Name</label>
                            <input type="text" class="form-control" id="meetingName" name="meetingName"
                                   placeholder="Meeting Name">
                        </div>

                        <div class="form-group">
                            <label for="meetingDesc">Meeting Description</label>
                            <input type="text" class="form-control" id="meetingDesc" name="meetingDesc"
                                   placeholder="Meeting Description">
                        </div>

                        <div class="form-group">
                            <label for="departmentmId">Department Name</label>
                            <select class="form-control" id="departmentmId" name="departmentmId">
                                <% for (Department department : departmentList) { %>
                                <option value="<%=department.getId()%>"> <%=department.getDepartmentName()%></option>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="meetingAdd"
                                value="Meeting Register">Meeting Register
                        </button>

                        <button type="submit" class="btn btn-primary" name="meetingList"
                                value="Meeting List">Meeting List
                        </button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

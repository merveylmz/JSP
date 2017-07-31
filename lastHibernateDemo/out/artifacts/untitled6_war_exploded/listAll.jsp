<%@ page import="java.util.List" %>
<%@ page import="Pojo.Employee" %>
<%@ page import="Pojo.Department" %>
<%@ page import="Pojo.Meeting" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Util.Warnings" %>
<%@ page import="PojoDaoImpl.DepartmentDao" %><%--
  Created by IntelliJ IDEA.
  User: menginar
  Date: 11.07.2017
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
    <link href="Style/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <script src="Style/js/bootstrap.min.js"></script>
    <script src="Style/js/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container" style="margin-top: 25px;">

    <%
        Warnings warnings = new Warnings();
        int warningNumberList = 0;
        List<Employee> employeeList = new ArrayList<>();
        List<Department> departmentList = new ArrayList<>();
        List<Meeting> meetingList = new ArrayList<>();

        DepartmentDao departmentDao = new DepartmentDao();


        try {
            employeeList = (List<Employee>) (request.getSession().getAttribute("employeeList"));
            departmentList = (List<Department>) (request.getSession().getAttribute("departmentList"));
            meetingList = (List<Meeting>) (request.getSession().getAttribute("meetingList"));
            warningNumberList = (int) (request.getSession().getAttribute("warningNumberList"));
        } catch (Exception e) {
        }
        if (warningNumberList == 1) {
            request.getSession().removeAttribute("warningNumberList");
    %>

    <div class="alert alert-success alert-dismissible">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberList)%>
    </div>
    <% }

        if (warningNumberList == 2) {
            request.getSession().removeAttribute("warningNumberList");
    %>
    <div class="alert alert-danger alert-dismissible">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberList)%>
    </div>
    <% } %>

    <%
        if (employeeList != null) {
            request.getSession().removeAttribute("employeeList");
    %>
    <h2>Employee</h2>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>#</th>
                <th>Employee Name</th>
                <th>Employee Surname</th>
                <th>Department Name</th>
                <th>Employee Salary</th>
                <th>Process</th>
            </tr>
            </thead>
            <tbody>
            <% for (Employee employee : employeeList) { %>
            <tr>
                <td><%=employee.getId()%>
                </td>
                <td><%=employee.getEmployeeName()%>
                </td>
                <td><%=employee.getEmployeeSurname()%>
                </td>
                <td><%=departmentDao.getDepartmentName(employee.getDepartmentId())%>
                </td>
                <td><%=employee.getEmployeeSalary()%>
                </td>
                <td>
                    <a href="/EmployeeControlServlet?employeeId=<%=employee.getId()%>&statu=employeeEdit"
                       class="btn btn-primary btn-xs">
                        <span class="glyphicon glyphicon-edit"></span> Edit
                    </a>

                    <a href="/EmployeeControlServlet?employeeId=<%=employee.getId()%>&statu=employeeDelete"
                       class="btn btn-danger btn-xs">
                        <span class="glyphicon glyphicon-trash"></span> Trash
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <%
        }

        if (departmentList != null) {
            request.getSession().removeAttribute("departmentList");
    %>
    <h2>Department</h2>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>#</th>
                <th>Department Name</th>
                <th>Department Description</th>
                <th>Process</th>
            </tr>
            </thead>
            <tbody>
            <% for (Department department : departmentList) { %>
            <tr>
                <td><%=department.getId()%>
                </td>
                <td><%=department.getDepartmentName()%>
                </td>
                <td><%=department.getDepartmentDesc()%>
                </td>
                <td>
                    <a href="/DepartmentControlServlet?departmentId=<%=department.getId()%>&statu=departmentEdit"
                       class="btn btn-primary btn-xs">
                        <span class="glyphicon glyphicon-edit"></span> Edit
                    </a>

                    <a href="/DepartmentControlServlet?departmentId=<%=department.getId()%>&statu=departmentDelete"
                       class="btn btn-danger btn-xs">
                        <span class="glyphicon glyphicon-trash"></span> Trash
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% }
        if (meetingList != null) {
            request.getSession().removeAttribute("meetingList");
    %>
    <h2>Meeting</h2>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>#</th>
                <th>Meeting Name</th>
                <th>Meeting Description</th>
                <th>Department Name</th>
                <th>Process</th>
            </tr>
            </thead>
            <tbody>
            <% for (Meeting meeting : meetingList) {%>
            <tr>
                <td><%=meeting.getId()%>
                </td>
                <td><%=meeting.getMeetingName()%>
                </td>
                <td><%=meeting.getMeetingDesc()%>
                </td>
                <td><%=departmentDao.getDepartmentName(meeting.getDepartmentId())%>
                </td>
                <td>

                    <a href="/MeetingControlServlet?meetingID=<%=meeting.getId()%>&statu=meetingEdit"
                       class="btn btn-primary btn-xs">
                        <span class="glyphicon glyphicon-edit"></span> Edit
                    </a>

                    <a href="/MeetingControlServlet?meetingID=<%=meeting.getId()%>&statu=meetingDelete"
                       class="btn btn-danger btn-xs">
                        <span class="glyphicon glyphicon-trash"></span> Trash
                    </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% }%>
</div>

</body>
</html>

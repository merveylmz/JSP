<%@ page import="Pojo.Employee" %>
<%@ page import="Pojo.Meeting" %>
<%@ page import="Pojo.Department" %>
<%@ page import="PojoDaoImpl.EmployeeDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="PojoDaoImpl.DepartmentDao" %>
<%@ page import="Util.Warnings" %><%--
  Created by IntelliJ IDEA.
  User: menginar
  Date: 11.07.2017
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <link href="Style/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.css" rel="stylesheet" media="screen">
    <link href="Style/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <script src="Style/js/bootstrap.min.js"></script>
    <script src="Style/js/bootstrap.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid" style="margin-top: 25px;">
    <div class="row">
        <%
            Warnings warnings = new Warnings();
            List<Department> departmentList = new ArrayList<>();
            DepartmentDao departmentDao= new DepartmentDao();
            departmentList = departmentDao.getDepartmentAll();

            int warningEmployee = 0, warningMeeting = 0, warningDepartment  = 0;
            int warningNumberDepartment = 0, warningNumberEmployee = 0, warningNumberMeeting = 0;

            try {
                warningEmployee = (int) (request.getSession().getAttribute("warningEmployee"));
            } catch (Exception e) {

            }

            try {
                warningNumberEmployee = (int) (request.getSession().getAttribute("warningNumberEmployee"));
            } catch (Exception e) {

            }

            try {
                warningMeeting = (int) (request.getSession().getAttribute("warningMeeting"));
            } catch (Exception e) {

            }

            try {
                warningNumberMeeting = (int) (request.getSession().getAttribute("warningNumberMeeting"));
            } catch (Exception e) {

            }

            try {
                warningDepartment = (int) (request.getSession().getAttribute("warningDepartment"));
            } catch (Exception e) {

            }

            try {
                warningNumberDepartment = (int) (request.getSession().getAttribute("warningNumberDepartment"));
            } catch (Exception e) {

            }

            Employee employee = (Employee) (request.getSession().getAttribute("employeeClass"));
            Meeting meeting = (Meeting) (request.getSession().getAttribute("meetingClass"));
            Department department = (Department) (request.getSession().getAttribute("departmentClass"));


            if (employee != null) {
                request.getSession().removeAttribute("employeeClass");
                request.getSession().removeAttribute("warningEmployee");
                request.getSession().removeAttribute("warningNumberEmployee");

        %>
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">Employee Register</div>
                <div class="panel-body">

                    <%
                        if (warningEmployee == 1 || warningNumberEmployee == 3) {
                    %>

                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong>  <%=warnings.getWarnings(warningNumberEmployee)%>
                    </div>

                    <%
                        }

                        if (warningEmployee == 2 || warningNumberEmployee == 4) {
                    %>

                    <div class="alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberEmployee)%>
                    </div>
                    <% } %>

                    <form action="/EmployeeControlServlet" method="post">

                        <input type="hidden" class="form-control" id="employeeID"
                               name="employeeID" value="<%=employee.getId()%>">

                        <div class="form-group">
                            <label for="employeeName">Employee Name</label>
                            <input type="text" class="form-control" id="employeeName"
                                   name="employeeName" value="<%=employee.getEmployeeName()%>">
                        </div>

                        <div class="form-group">
                            <label for="employeeSurname">Employee Surname</label>
                            <input type="text" class="form-control" id="employeeSurname"
                                   name="employeeSurname" value="<%=employee.getEmployeeSurname()%>">
                        </div>

                        <div class="form-group">
                            <label for="employeSalary">Employee Salary</label>
                            <input type="text" class="form-control" id="employeSalary"
                                   name="employeSalary" value="<%=employee.getEmployeeSalary()%>">
                        </div>

                        <div class="form-group">
                            <label for="departmentId">Department Name</label>
                            <select class="form-control" id="departmentId" name="departmentId">
                                <option value="<%=employee.getDepartmentId()%>"><%=departmentDao.getDepartmentName(employee.getDepartmentId())%></option>
                                <% for (Department departmentone: departmentList) { %>
                                    <% if (departmentone.getId() != employee.getDepartmentId()) {%>
                                        <option value="<%=departmentone.getId()%>"><%=departmentone.getDepartmentName()%></option>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="employeeUpdate"
                                value="Employee Update">Employee Update
                        </button>
                    </form>
                </div>
            </div>

        </div>

        <%
            } if (department != null) {
                request.getSession().removeAttribute("departmentClass");
                request.getSession().removeAttribute("warningDepartment");
                request.getSession().removeAttribute("warningNumberDepartment");
        %>

        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">Department Register</div>
                <div class="panel-body">

                    <%
                        if (warningDepartment == 1 || warningNumberDepartment == 3) {
                    %>

                    <div class="alert alert-success alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberDepartment)%>
                    </div>

                    <%
                        }

                        if (warningDepartment == 2 || warningNumberDepartment == 4) {
                    %>

                    <div class="alert alert-danger alert-dismissible">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> <%=warnings.getWarnings(warningNumberDepartment)%>
                    </div>
                    <% } %>


                    <form action="/DepartmentControlServlet" method="post">

                        <input type="hidden" class="form-control" id="departmentIDs" name="departmentIDs"
                               value="<%=department.getId()%>">

                        <div class="form-group">
                            <label for="departmentName">Department Name</label>
                            <input type="text" class="form-control" id="departmentName" name="departmentName"
                                   value="<%=department.getDepartmentName()%>">
                        </div>

                        <div class="form-group">
                            <label for="departmentDesc">Department Description</label>
                            <input type="text" class="form-control" id="departmentDesc"
                                   name="departmentDesc" value="<%=department.getDepartmentDesc()%>"
                                   placeholder="Department Description">
                        </div>

                        <button type="submit" class="btn btn-primary" name="departmentUpdate"
                                value="Department Update">Department Update
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%
            } if (meeting != null) {
                request.getSession().removeAttribute("meetingClass");
                request.getSession().removeAttribute("warningMeeting");
                request.getSession().removeAttribute("warningNumberMeeting");
        %>
        <div class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">Meeting Register</div>
                <div class="panel-body">

                    <%
                        if (warningMeeting == 1 || warningNumberMeeting == 3) {
                    %>

                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Success!</strong> <%=warnings.getWarnings(warningNumberMeeting)%>
                        </div>

                    <%
                        }

                        if (warningMeeting == 2 || warningNumberMeeting == 4) {
                    %>

                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Success!</strong> <%=warnings.getWarnings(warningNumberMeeting)%>
                        </div>
                    <% } %>

                    <form action="/MeetingControlServlet" method="post">

                        <input type="hidden" class="form-control" id="meetingID"
                               name="meetingID" value="<%=meeting.getId()%>">

                        <div class="form-group">
                            <label for="meetingName">Meeting Name</label>
                            <input type="text" class="form-control" id="meetingName"
                                   name="meetingName" value="<%=meeting.getMeetingName()%>">
                        </div>

                        <div class="form-group">
                            <label for="meetingDesc">Meeting Description</label>
                            <input type="text" class="form-control" id="meetingDesc"
                                   name="meetingDesc" value="<%=meeting.getMeetingDesc()%>">
                        </div>

                        <div class="form-group">
                            <label for="departmentmId">Department Name</label>
                            <select class="form-control" id="departmentmId">
                                <option value="<%=meeting.getDepartmentId()%>"><%=departmentDao.getDepartmentName(meeting.getDepartmentId())%></option>
                                <% for (Department departmentone: departmentList) { %>
                                    <% if (departmentone.getId() != meeting.getDepartmentId()) { %>
                                        <option value="<%=departmentone.getId()%>"><%=departmentone.getDepartmentName()%></option>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary" name="meetingUpdate"
                                value="Meeting Update">Meeting Update
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</div>
</body>
</html>

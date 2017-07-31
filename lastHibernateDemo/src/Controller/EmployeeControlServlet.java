package Controller;

import Pojo.Employee;
import PojoDao.EmployeeInterface;
import PojoDaoImpl.EmployeeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
@WebServlet(name = "EmployeeControlServlet")
public class EmployeeControlServlet extends HttpServlet {

    Employee employee = new Employee();
    EmployeeDao employeeDao = new EmployeeDao();
    EmployeeInterface employeeInterface;
    int warningNumber = -1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("employeeAdd") != null) {
            String employeeName = request.getParameter("employeeName");
            String employeeSurname = request.getParameter("employeeSurname");
            String employeSalary = request.getParameter("employeSalary");
            int departmentId = 0;

            if (!employeeName.equals("") & !employeeSurname.equals("") & !employeSalary.equals("")) {

                try {
                    departmentId = Integer.parseInt(request.getParameter("departmentId"));
                    employee = new Employee(employeeName, employeeSurname, employeSalary, departmentId);
                    if (employeeDao.getEmployeeInsert(employee)) warningNumber = 1;
                    else warningNumber = 2;

                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;

            }

            request.getSession().setAttribute("warningNumberEmployee", warningNumber);
            response.sendRedirect("index.jsp");
        }

        if (request.getParameter("employeeList") != null) {
            List<Employee> employeeList = new ArrayList();

            try {
                employeeList = employeeDao.getEmployeeAll();
                warningNumber = 1;
            } catch (Exception e) {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberList", warningNumber);
            request.getSession().setAttribute("employeeList", employeeList);
            response.sendRedirect("listAll.jsp");
        }

        if (request.getParameter("employeeUpdate") != null) {
            int employeeID = Integer.parseInt(request.getParameter("employeeID"));
            String employeeName = request.getParameter("employeeName");
            String employeeSurname = request.getParameter("employeeSurname");
            String employeSalary = request.getParameter("employeSalary");
            int departmentId = 0;

            if (!employeeName.equals("") & !employeeSurname.equals("") & !employeSalary.equals("")) {

                try {
                    departmentId = Integer.parseInt(request.getParameter("departmentId"));
                    employee = new Employee(employeeName, employeeSurname, employeSalary, departmentId);
                    employee.setId(employeeID);
                    if (employeeDao.getEmployeeUpdate(employee)) warningNumber = 3;
                    else warningNumber = 4;

                } catch (Exception e) {
                    warningNumber = 4;
                }
            } else {
                warningNumber = 4;

            }

            request.getSession().setAttribute("warningNumberEmployee", warningNumber);
            request.getSession().setAttribute("employeeClass", employee);
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String statu = request.getParameter("statu");
        employee = new Employee();

        if (statu.equals("employeeEdit")) {
            String employeeId = request.getParameter("employeeId");
            if (!employeeId.equals("")) {
                try {
                    employee = new Employee();
                    employee = employeeDao.getEmployeeClass(Integer.parseInt(employeeId));

                    if (employee != null) {
                        warningNumber = 1;
                    } else {
                        warningNumber = 2;
                    }

                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningEmployee", warningNumber);
            request.getSession().setAttribute("employeeClass", employee);
            response.sendRedirect("updateAll.jsp");
        }

        if (statu.equals("employeeDelete")) {
            List<Employee> employeeList = new ArrayList();
            String employeeID = request.getParameter("employeeId");

            if (!employeeID.equals("")) {
                try {
                    if (employeeDao.getEmployeeDelete(Integer.parseInt(employeeID))) {
                        employeeList = employeeDao.getEmployeeAll();
                        warningNumber = 1;
                    } else {
                        warningNumber = 2;
                    }
                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberList", warningNumber);
            request.getSession().setAttribute("employeeList", employeeList);
            response.sendRedirect("listAll.jsp");
        }
    }
}

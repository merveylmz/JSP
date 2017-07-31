package Controller;

import Pojo.Department;
import PojoDao.DepartmentInterface;
import PojoDaoImpl.DepartmentDao;

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
@WebServlet(name = "DepartmentControlServlet")
public class DepartmentControlServlet extends HttpServlet {

    Department department = new Department();
    DepartmentDao departmentDao = new DepartmentDao();
    DepartmentInterface departmentInterface;
    int warningNumber = -1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("departmentAdd") != null) {
            String departmentName = request.getParameter("departmentName");
            String departmentDesc = request.getParameter("departmentDesc");

            if (!departmentName.equals("") & !departmentDesc.equals("")) {
                department = new Department(departmentName, departmentDesc);
                if (departmentDao.getDepartmentInsert(department)) warningNumber = 1;
                else warningNumber = 2;
            } else {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberDepartment", warningNumber);
            response.sendRedirect("index.jsp");
        }

        if (request.getParameter("departmentList") != null) {
            List<Department> departmentList = new ArrayList();

            try {
                departmentList = departmentDao.getDepartmentAll();
                warningNumber = 1;
            } catch (Exception e) {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberList", warningNumber);
            request.getSession().setAttribute("departmentList", departmentList);
            response.sendRedirect("listAll.jsp");
        }

        if (request.getParameter("departmentUpdate") != null) {
            int departmentIDs = Integer.parseInt(request.getParameter("departmentIDs"));
            String departmentName = request.getParameter("departmentName");
            String departmentDesc = request.getParameter("departmentDesc");

            if (!departmentName.equals("") & !departmentDesc.equals("")) {

                department = new Department(departmentName, departmentDesc);
                department.setId(departmentIDs);
                if (departmentDao.getDepartmentUpdate(department)) warningNumber = 3;
                else warningNumber = 4;
            } else {
                warningNumber = 4;
            }

            request.getSession().setAttribute("warningNumberDepartment", warningNumber);
            request.getSession().setAttribute("departmentClass", department);
            response.sendRedirect("index.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String statu = request.getParameter("statu");
        department = new Department();

        if (statu.equals("departmentEdit")) {
            String departmentId = request.getParameter("departmentId");
            if (!departmentId.equals("")) {
                try {
                    department = new Department();
                    department = departmentDao.getDepartmentClass(Integer.parseInt(departmentId));

                    if (department != null) {
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

            request.getSession().setAttribute("warningDepartment", warningNumber);
            request.getSession().setAttribute("departmentClass", department);
            response.sendRedirect("updateAll.jsp");
        }

        if (statu.equals("departmentDelete")) {
            String departmentId = request.getParameter("departmentId");
            List<Department> departmentList = new ArrayList();

            if (!departmentId.equals("")) {
                try {
                    if (departmentDao.getDepartmentDelete(Integer.parseInt(departmentId))) {
                        departmentList = departmentDao.getDepartmentAll();
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
            request.getSession().setAttribute("departmentList", departmentList);
            response.sendRedirect("listAll.jsp");
        }
    }
}

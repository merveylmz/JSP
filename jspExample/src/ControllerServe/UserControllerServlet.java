package ControllerServe;

import model.users;
import simple.Connec;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

/**
 * Created by ss on 8.7.2017.
 */
@WebServlet(name = "UserControllerServlet")
public class UserControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<users> usersArrayList = new ArrayList<>();
        users user = new users();
        RequestDispatcher requestDispatcher;
        if (request.getParameter("insertUser") != null) {       /*  Kullanıcı Ekleme    */
            String userFirstName = request.getParameter("NAME");
            String userLastName = request.getParameter("SURNAME");
            int userAge = Integer.parseInt(request.getParameter("AGE"));
            int userEducation = Integer.parseInt(request.getParameter("EDUCATION"));

            user = new users(userFirstName, userLastName, userAge, userEducation);
            if(user.getInsertUser()){
                usersArrayList = user.showUsers();
            }
        }
        if (request.getParameter("showUser") != null) { /*  Kullanıcı Listele   */
            user = new users();
            usersArrayList = user.showUsers();
        }
        if (request.getParameter("findUser") != null) {     /*  Kullanıcı Arama     */
            user = new users();
            String findUser = request.getParameter("find_user");
            usersArrayList = user.findUser(null, findUser);
        }
        if (request.getParameter("editUser") != null) {     /*  Kullanıcı Düzenle    */
            usersArrayList = user.findUser(request.getParameter("userID"), null);
            for (users users : usersArrayList) {
                user = users;
            }
            request.setAttribute("user",user);   /*  Kullanıcı ArrayList     */
            requestDispatcher = request.getRequestDispatcher("/showUser.jsp");
            requestDispatcher.forward(request, response);
        }
        if (request.getParameter("updateUSer") != null) {       /* Kullanıcı Güncelleme */
            user = new users();
            user.setId(Integer.parseInt(request.getParameter("userID")));
            user.setUserName(request.getParameter("AD"));
            user.setUserSurname(request.getParameter("SOYAD"));
            user.setUserAge(Integer.parseInt(request.getParameter("AGE")));
            user.setEducationId(Integer.parseInt(request.getParameter("EDUCATION")));
            user.updateUser(user);
            usersArrayList = user.showUsers();
        }
        if (request.getParameter("deleteUser") != null) {   /*  Kullanıcı Silme */
            user = new users();
            user.deleteUser(request.getParameter("delete_user"));
            usersArrayList = user.showUsers();
        }
        request.setAttribute("userArrayList", usersArrayList);   /*  Kullanıcı ArrayList     */
        requestDispatcher = request.getRequestDispatcher("/showUser.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<users> usersArrayList = new ArrayList<>();
        users user = new users();
        RequestDispatcher requestDispatcher;


        if (request.getParameter("islem") != null) {

            String a = request.getParameter("islem");
            String id = request.getParameter("deleteUserID");

            user = new users();
            user.deleteUser(request.getParameter("deleteUserID"));
            usersArrayList = user.showUsers();

        }

        if (request.getParameter("param") == "1") {
            user = new users();
            user.setId(Integer.parseInt(request.getParameter("userID")));
            user.setUserName(request.getParameter("NAME"));
            user.setUserSurname(request.getParameter("SURNAME"));
            user.setUserAge(Integer.parseInt(request.getParameter("AGE")));
            user.setEducationId(Integer.parseInt(request.getParameter("EDUCATION")));
            user.updateUser(user);
            usersArrayList = user.showUsers();
        }
        if (request.getParameter("deleteUser") != null) {
            user = new users();
            user.deleteUser(request.getParameter("deleteUserID"));
            usersArrayList = user.showUsers();
        }
        request.setAttribute("userArrayList",usersArrayList);
        requestDispatcher = request.getRequestDispatcher("/showUser.jsp");
        requestDispatcher.forward(request, response);
    }
}

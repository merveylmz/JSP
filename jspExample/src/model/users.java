package model;

import simple.Connec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.System.out;

/**
 * Created by ss on 3.7.2017.
 */
public class users {

    public int id;

    public education getUserEdu() {
        return userEdu;
    }

    public void setUserEdu(education userEdu) {
        this.userEdu = userEdu;
    }

    public String userName;
    public String userSurname;
    public int userAge;
    public int educationId;
    public education userEdu;

    public users(String userName, String userSurname, int userAge, int educationId) {
        this.userName = userName;
        this.userSurname = userSurname;
        this.userAge = userAge;
        this.educationId = educationId;
    }

    public users() {
        this.userName = "";
        this.userSurname = "";
        this.userAge = 0;
        this.educationId = 0;
    }

    public ArrayList<users> showUsers() {

        ArrayList<users> usersArrayList = new ArrayList<>();
        users user = new users(null, null, 0, 0);
        try {
            Connection connection = Connec.getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user INNER JOIN edication on user.edication_id=edication.id ");
            while (rs.next()) {
                user = new users();
                user.setId(rs.getInt(1));
                user.setUserName(rs.getString(2));
                user.setUserSurname(rs.getString(3));
                user.setUserAge(rs.getInt(4));
                user.setEducationId(rs.getInt(5));
                user.userEdu = new education();
                user.userEdu.setUserEducation(rs.getString(7));

                usersArrayList.add(user);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return usersArrayList;
    }

    public boolean getInsertUser() {

        boolean statu = false;
        Connection connection = Connec.getConnection();
        try {
            PreparedStatement preStmt;
            preStmt = connection.prepareStatement("INSERT INTO user(first_name, last_name, age, edication_id) VALUES (?,?,?,?)");
            preStmt.setString(1, this.getUserName());
            preStmt.setString(2, this.getUserSurname());
            preStmt.setInt(3, this.getUserAge());
            preStmt.setInt(4, this.getEducationId());
            preStmt.executeUpdate();
            preStmt.close();
            connection.close();
            statu = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statu;
    }

    public ArrayList<users> findUser(String userID, String findUser) {

        String sql = "";
        ArrayList<users> arrayList = new ArrayList<>();
        users users = new users(null, null, 0, 0);
        try {
            if (userID != null) {
                sql = "SELECT user.id, user.first_name, user.last_name, user.age, edication.Type FROM user INNER JOIN edication on user.edication_id=edication.id WHERE user.id=" + userID;
            }
            if (findUser != null) {
                sql = "SELECT user.id, user.first_name, user.last_name, user.age, edication.Type FROM user INNER JOIN edication on user.edication_id=edication.id WHERE user.first_name LIKE '%" + findUser + "%' or user.last_name LIKE '%" + findUser + "%'";
            }
            Connection connection = Connec.getConnection();
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                users = new users();
                users.setId(rs.getInt(1));
                users.setUserName(rs.getString(2));
                users.setUserSurname(rs.getString(3));
                users.setUserAge(rs.getInt(4));
                users.userEdu = new education();
                users.userEdu.setUserEducation(rs.getString(5));

                arrayList.add(users);
            }
            stmt.close();
            connection.close();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return arrayList;
    }

    public void deleteUser(String userID) {
        try {
            Connection connection = Connec.getConnection();
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM user WHERE id=" + userID);
            st.close();
            connection.close();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    public void updateUser(users user) {
        try {
            Connection connection = Connec.getConnection();
            Statement statement = connection.createStatement();
            statement.executeUpdate("UPDATE user SET first_name='" + user.getUserName()
                    + "', last_name='" + user.getUserSurname()
                    + "', age=" + user.getUserAge()
                    + ", edication_id=" + user.getEducationId()
                    + " WHERE id=" + user.getId());
            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public int getUserAge() {
        return userAge;
    }

    public void setUserAge(int userAge) {
        this.userAge = userAge;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSurname() {
        return userSurname;
    }

    public void setUserSurname(String userSurname) {
        this.userSurname = userSurname;
    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }
}

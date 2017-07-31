package model;

/**
 * Created by ss on 3.7.2017.
 */
public class education {
    public int userId;
    public String userEducation;

    public void education(int userId, String userEducation) {
        this.userId = userId;
        this.userEducation = userEducation;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEducation() {
        return userEducation;
    }

    public void setUserEducation(String userEducation) {
        this.userEducation = userEducation;
    }
}

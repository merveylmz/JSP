package Beans;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 * Created by ss on 14.7.2017.
 */

@ManagedBean (name = "user")
@SessionScoped
public class User {
    String name;
    String surName;
    String number;

    public void User (String name, String surName, String number) {
        this.name = name;
        this.surName = surName;
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surName) {
        this.surName = surName;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}

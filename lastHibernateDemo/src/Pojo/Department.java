package Pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by menginar on 11.07.2017.
 */

@Entity
@Table(name = "Department")
public class Department implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "departmentName", nullable = false)
    public String departmentName;

    @Column(name = "departmentDesc", nullable = false)
    public String departmentDesc;

    public Department() {
    }

    public Department(String departmentName, String getDepartmentDesc) {
        this.departmentName = departmentName;
        this.departmentDesc = getDepartmentDesc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentDesc() {
        return departmentDesc;
    }

    public void settDepartmentDesc(String departmentDesc) {
        this.departmentDesc = departmentDesc;
    }

}

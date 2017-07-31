package Pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by menginar on 11.07.2017.
 */

@Entity
@Table(name = "Employee")
public class Employee implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "employeeName", nullable = false)
    public String employeeName;

    @Column(name = "employeeSurname", nullable = false)
    public String employeeSurname;

    @Column(name = "employeeSalary", nullable = false)
    public String employeeSalary;

    @Column(name = "departmentId", nullable = false)
    public int departmentId;

    public Employee() {
    }

    public Employee(String employeeName, String employeeSurname, String employeeSalary, int departmentId) {
        this.employeeName = employeeName;
        this.employeeSurname = employeeSurname;
        this.employeeSalary = employeeSalary;
        this.departmentId = departmentId;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeSurname() {
        return employeeSurname;
    }

    public void setEmployeeSurname(String getEmployeeSurname) {
        this.employeeSurname = getEmployeeSurname;
    }

    public String getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(String employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
}

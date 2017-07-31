package PojoDao;

import Pojo.Employee;

import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
public interface EmployeeInterface {
    public boolean getEmployeeInsert(Employee employee);
    public boolean getEmployeeUpdate(Employee employee);
    public boolean getEmployeeDelete(int employeeId);
    public Employee getEmployeeClass(int employeeId);
    public List<Employee> getEmployeeSearch(String editTitle);
    public List<Employee> getEmployeeAll();
}

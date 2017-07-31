package PojoDao;

import Pojo.Department;

import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
public interface DepartmentInterface {
    public boolean getDepartmentInsert(Department department);
    public boolean getDepartmentUpdate(Department department);
    public boolean getDepartmentDelete(int departmentId);
    public Department getDepartmentClass(int departmentId);
    public String getDepartmentName(int departmentId);
    public List<Department> getDepartmentAll();
}

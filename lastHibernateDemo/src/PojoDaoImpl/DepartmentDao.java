package PojoDaoImpl;

import Pojo.Department;
import PojoDao.DepartmentInterface;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
public class DepartmentDao implements DepartmentInterface {

    public boolean state = false;

    @Override
    public boolean getDepartmentInsert(Department department) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.save(department);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {
            this.state = false;
        }

        return this.state;
    }

    @Override
    public boolean getDepartmentUpdate(Department department) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.update(department);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {
            this.state = false;
        }

        return this.state;
    }

    @Override
    public boolean getDepartmentDelete(int departmentId) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();

            Object persistentInstance = session.load(Department.class, departmentId);
            if (persistentInstance != null) {
                session.delete(persistentInstance);
            }

            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {
            this.state = false;
        }

        return this.state;
    }

    @Override
    public Department getDepartmentClass(int departmentId) {
        Department department = new Department();
        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            department = (Department) session.get(Department.class, departmentId);
            transaction.commit();
            session.close();
        } catch (Exception e) {
        }

        return department;
    }

    @Override
    public List<Department> getDepartmentAll() {
        List<Department> departmentList = new ArrayList<>();

        try {
            Session session = Main.getSession();
            departmentList = session.createQuery("from Department").list();
            session.close();
        } catch (Exception e) {

        }

        return departmentList;
    }

    @Override
    public String getDepartmentName(int departmentId) {
        String departmentName = "";
        List<Department> departmentList = new ArrayList<>();
        try {
            Session session = Main.getSession();
            departmentList = session.createQuery("from Department").list();

            for (Department department : departmentList) {
                if (department.getId() == departmentId) {
                    departmentName = department.getDepartmentName();
                    break;
                }
            }
            session.close();
        } catch (Exception e) {

        }

        return departmentName;
    }
}

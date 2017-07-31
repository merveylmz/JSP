package PojoDaoImpl;

import Pojo.Employee;
import PojoDao.EmployeeInterface;
import oracle.jrockit.jfr.parser.ParseException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * Created by menginar on 11.07.2017.
 */
public class EmployeeDao implements EmployeeInterface {

    public boolean state = false;

    @Override
    public boolean getEmployeeInsert(Employee employee) {

        try {

            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.save(employee);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {

        }

        return this.state;
    }

    @Override
    public boolean getEmployeeUpdate(Employee employee) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.update(employee);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {

        }

        return this.state;
    }



    @Override
    public boolean getEmployeeDelete(int employeeId) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();

            Object persistentInstance = session.load(Employee.class, employeeId);
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
    public Employee getEmployeeClass(int employeeId) {
        Employee employee = new Employee();
        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            employee = (Employee) session.get(Employee.class, employeeId);
            transaction.commit();
            session.close();
        } catch (Exception e) {
        }

        return employee;
    }

    @Override
    public List<Employee> getEmployeeAll() {
        List<Employee> employeeList = new ArrayList<>();

        try {
            Session session = Main.getSession();
            employeeList = session.createQuery("From Employee").list();
            session.close();
        } catch (Exception e) {

        }


        return employeeList;
    }

    @Override
    public List<Employee> getEmployeeSearch(String editTitle){
        List<Employee>  employeeList = new ArrayList<>();

        try {

        } catch (Exception e) {

        }

        return employeeList;
    }

}

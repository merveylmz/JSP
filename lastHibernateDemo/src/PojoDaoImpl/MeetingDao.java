package PojoDaoImpl;

import Pojo.Meeting;
import PojoDao.MeetingInterface;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
public class MeetingDao implements MeetingInterface {
    public boolean state = false;

    @Override
    public boolean getMeetingInsert(Meeting meeting) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.save(meeting);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {
            this.state = false;
        }

        return this.state;
    }

    @Override
    public boolean getMeetingUpdate(Meeting meeting) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();
            session.update(meeting);
            transaction.commit();
            session.close();
            this.state = true;
        } catch (Exception e) {
            this.state = false;
        }

        return this.state;
    }

    @Override
    public Meeting getMeetingClass(int meetingId) {
        Meeting meeting = new Meeting();
        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();

            meeting = (Meeting) session.get(Meeting.class, meetingId);

            transaction.commit();
            session.close();
        } catch (Exception e) {
        }

        return meeting;
    }

    @Override
    public boolean getMeetingDelete(int meetingId) {

        try {
            Session session = Main.getSession();
            Transaction transaction = session.beginTransaction();

            Object persistentInstance = session.load(Meeting.class, meetingId);
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
    public List<Meeting> getMeetingAll() {
        List<Meeting> meetingList = new ArrayList<>();

        try {
            Session session = Main.getSession();
            meetingList = session.createQuery("from Meeting ").list();
            session.close();
        } catch (Exception e) {

        }

        return meetingList;
    }
}

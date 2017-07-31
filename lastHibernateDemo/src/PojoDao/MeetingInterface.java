package PojoDao;

import Pojo.Meeting;

import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
public interface MeetingInterface {
    public boolean getMeetingInsert(Meeting meeting);
    public boolean getMeetingUpdate(Meeting meeting);
    public boolean getMeetingDelete(int meetingId);
    public Meeting getMeetingClass(int meetingId);
    public List<Meeting> getMeetingAll();
}

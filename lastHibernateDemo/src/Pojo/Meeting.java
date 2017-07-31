package Pojo;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by menginar on 11.07.2017.
 */

@Entity
@Table(name = "Meeting")
public class Meeting implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int id;

    @Column(name = "meetingName", nullable = false)
    public String meetingName;

    @Column(name = "meetingDesc", nullable = false)
    public String meetingDesc;

    @Column(name = "departmentId", nullable = false)
    public int departmentId;

    public Meeting() {}

    public Meeting(String meetingName, String meetingDesc, int departmentId) {
        this.meetingName = meetingName;
        this.meetingDesc = meetingDesc;
        this.departmentId = departmentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMeetingName() {
        return meetingName;
    }

    public void setMeetingName(String meetingName) {
        this.meetingName = meetingName;
    }

    public String getMeetingDesc() {
        return meetingDesc;
    }

    public void setMeetingDesc(String meetingDesc) {
        this.meetingDesc = meetingDesc;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
}

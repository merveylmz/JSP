package Controller;

import Pojo.Meeting;
import PojoDao.MeetingInterface;
import PojoDaoImpl.MeetingDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by menginar on 11.07.2017.
 */
@WebServlet(name = "MeetingControlServlet")
public class MeetingControlServlet extends HttpServlet {

    Meeting meeting = new Meeting();
    MeetingDao meetingDao = new MeetingDao();
    MeetingInterface meetingInterface;
    int warningNumber = -1;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("meetingAdd") != null) {
            String meetingName = request.getParameter("meetingName");
            String meetingDesc = request.getParameter("meetingDesc");
            int departmentmId = 0;

            if (!meetingName.equals("") & !meetingDesc.equals("")) {
                try {
                    departmentmId = Integer.parseInt(request.getParameter("departmentmId"));
                    meeting = new Meeting(meetingName, meetingDesc, departmentmId);
                    if (meetingDao.getMeetingInsert(meeting)) warningNumber = 1;
                    else warningNumber = 2;
                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberMeeting", warningNumber);
            response.sendRedirect("index.jsp");
        }

        if (request.getParameter("meetingList") != null) {
            List<Meeting> meetingList = new ArrayList();

            try {
                meetingList = meetingDao.getMeetingAll();
                warningNumber = 1;
            } catch (Exception e) {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberList", warningNumber);
            request.getSession().setAttribute("meetingList", meetingList);
            response.sendRedirect("listAll.jsp");
        }

        if (request.getParameter("meetingUpdate") != null) {
            int meetingID = Integer.parseInt(request.getParameter("meetingID"));
            String meetingName = request.getParameter("meetingName");
            String meetingDesc = request.getParameter("meetingDesc");
            int departmentmId = 0;

            if (!meetingName.equals("") & !meetingDesc.equals("")) {
                try {
                    departmentmId = Integer.parseInt(request.getParameter("departmentmId"));
                    meeting = new Meeting(meetingName, meetingDesc, departmentmId);
                    meeting.setId(meetingID);
                    if (meetingDao.getMeetingUpdate(meeting)) warningNumber = 3;
                    else warningNumber = 4;
                } catch (Exception e) {
                    warningNumber = 4;
                }
            } else {
                warningNumber = 4;
            }

            request.getSession().setAttribute("warningNumberMeeting", warningNumber);
            request.getSession().setAttribute("meetingClass", meeting);
            response.sendRedirect("index.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String statu = request.getParameter("statu");
        meeting = new Meeting();

        if (statu.equals("meetingEdit")) {
            List<Meeting> meetingList = new ArrayList();
            String meetingID = request.getParameter("meetingID");
            if (!meetingID.equals("")) {
                try {
                    meeting = new Meeting();
                    meeting = meetingDao.getMeetingClass(Integer.parseInt(meetingID));

                    if (meeting != null) {
                        warningNumber = 1;
                    } else {
                        warningNumber = 2;
                    }
                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;
            }
            request.getSession().setAttribute("warningMeeting", warningNumber);
            request.getSession().setAttribute("meetingClass", meeting);
            response.sendRedirect("updateAll.jsp");
        }

        if (statu.equals("meetingDelete")) {
            List<Meeting> meetingList = new ArrayList();
            String meetingID = request.getParameter("meetingID");

            if (!meetingID.equals("")) {
                try {
                    if (meetingDao.getMeetingDelete(Integer.parseInt(meetingID))) {
                        meetingList = meetingDao.getMeetingAll();
                        warningNumber = 1;
                    } else {
                        warningNumber = 2;
                    }
                } catch (Exception e) {
                    warningNumber = 2;
                }
            } else {
                warningNumber = 2;
            }

            request.getSession().setAttribute("warningNumberList", warningNumber);
            request.getSession().setAttribute("meetingList", meetingList);
            response.sendRedirect("listAll.jsp");
        }
    }
}

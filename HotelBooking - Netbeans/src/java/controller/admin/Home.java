package controller.admin;

import connection.AccountDAO;
import connection.BookingDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.Booking;

@WebServlet(urlPatterns = "/admin")
public class Home extends HttpServlet implements HttpSessionListener {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        System.out.println(username);
        System.out.println(AccountDAO.Instance().getRoleOfUser(username));
        ArrayList<Booking> list = BookingDAO.Instance().getInforBooking();
        req.setAttribute("list", list);
        if (AccountDAO.Instance().getRoleOfUser(username).equals("0")) {
            RequestDispatcher rd = req.getRequestDispatcher("/admin/index.jsp");
            rd.forward(req, resp);
        } else {
            resp.sendRedirect("home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
    }
    private List sessions = new ArrayList();

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        sessions.add(session.getId());
        session.setAttribute("counter", this);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        sessions.remove(session.getId());
        session.setAttribute("counter", this);
    }
    public int getActiveSessionNumber(){
        return sessions.size();
    }
}

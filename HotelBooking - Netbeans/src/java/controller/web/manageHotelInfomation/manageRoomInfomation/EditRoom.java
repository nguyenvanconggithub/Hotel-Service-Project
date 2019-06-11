package controller.web.manageHotelInfomation.manageRoomInfomation;

import connection.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

@WebServlet(urlPatterns = {"/edit-room"})
public class EditRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getData(req, resp);
        RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-room.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        boolean addSuccess = true;
        String message = "";
        try {
            int roomType = Integer.valueOf(req.getParameter("loaiPhong"));
            String roomName = req.getParameter("tenPhong");
            int bedType = Integer.valueOf(req.getParameter("loaiGiuong"));
            int quantity = Integer.valueOf((req.getParameter("soPhong")));
            int people = Integer.valueOf(req.getParameter("soNguoi"));
            float agre = Float.valueOf(req.getParameter("dienTich"));
            int cost = Integer.valueOf(req.getParameter("gia"));
            int idRoom = Integer.valueOf(req.getParameter("idRoom"));
            Room room = new Room();
            room.getBed().setIdBed(bedType);
            room.setAgcreage(agre);
            room.setCost(cost);
            room.getRoomType().setIdRoomType(roomType);
            room.setQuantity(quantity);
            room.setPeople(people);
            room.setRoomName(roomName);
            //System.out.println(""+roomName+" | "+roomType+" | "+quantity+" | "+cost+" | "+req.getParameter("idRoom"));
            room.setIdRoom(idRoom);
            addSuccess = RoomDAO.Instance().updateRoom(room);
            //end infor Room
            //begin utility room
            String[] arrayIDUltilites = req.getParameterValues("tienIch");
            ArrayList<String> listIDUltilities = new ArrayList<String>(Arrays.asList(arrayIDUltilites));
            RoomUltilitiesDAO.Instance().deleteRoomUtilities(idRoom);
            for (int i = 0; i < arrayIDUltilites.length; i++) {
                RoomUltilitiesDAO.Instance().addRoomUtilities(Integer.parseInt(arrayIDUltilites[i]), idRoom);
                System.out.println("Pair: " + Integer.parseInt(arrayIDUltilites[i]) + "||" + idRoom);
            }
            //end uilityRoom
        } catch (Exception e) {
            addSuccess = false;
            e.printStackTrace();
        }
        if (addSuccess) {
            message = "Sửa phòng thành công!";
        } else {
            message = "Thất bại";
        }
        req.setAttribute("addSuccess", addSuccess);
        req.setAttribute("message", message);
        
        //Lay dũ lieu moi o day nũa no tu dâatase do giong dooét
        getData(req, resp);
        RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-room.jsp");
        //RequestDispatcher rd = req.getRequestDispatcher("edit-room");
        rd.forward(req, resp);
        
    }
    public void getData(HttpServletRequest req,HttpServletResponse resp){
        String idHotel = req.getParameter("idHotel");
        String idRoom = req.getParameter("idRoom");
        ArrayList<RoomType> listRoomTypes = RoomTypeDAO.Instance().getListRoomType();
        ArrayList<Bed> listBeds = BedDAO.Instance().getListBed();
        ArrayList<Utilities> listUti = UltilitiesDAO.Instance().getListUtilities();
        ArrayList<RoomUltilities> listOldUti = RoomUltilitiesDAO.Instance().getListRoomUtility(idRoom);
        ArrayList<RoomImage> listRoom = RoomImageDAO.Instance().getShortRoomInfor(idHotel);
        req.setAttribute("listBed", listBeds);
        req.setAttribute("listRT", listRoomTypes);
        req.setAttribute("listUti", listUti);
        req.setAttribute("listOldUti", listOldUti);
        req.setAttribute("listRoomImg", listRoom);
        req.setAttribute("idRoom", idRoom);
        req.setAttribute("idHotel", idHotel);
    }
}

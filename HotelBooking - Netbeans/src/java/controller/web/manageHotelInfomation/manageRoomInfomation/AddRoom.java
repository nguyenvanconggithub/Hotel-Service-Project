package controller.web.manageHotelInfomation.manageRoomInfomation;

import connection.BedDAO;
import connection.HotelDAO;
import connection.HotelImageDAO;
import connection.HotelUltilitiesDAO;
import connection.RoomDAO;
import connection.RoomImageDAO;
import connection.RoomTypeDAO;
import connection.RoomUltilitiesDAO;
import connection.UltilitiesDAO;
import java.io.File;
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
import javax.servlet.http.Part;
import model.Bed;
import model.Hotel;
import model.HotelImage;
import model.Room;
import model.RoomType;
import model.Utilities;
import static org.apache.tomcat.jni.User.username;

@WebServlet(urlPatterns = {"/add-new-room"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get");
        //dương gửi id bên viewroom sang
        String hotelID = req.getParameter("id");
        //hotelID="5";
        String username = (String) req.getSession().getAttribute("username");
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(Integer.parseInt(hotelID), username);
        if (isOwnHotel) {
            req.setAttribute("id", hotelID);
            ArrayList<HotelImage> hotelImage = HotelImageDAO.Instance().getShortHotelInfoByID(hotelID);
            req.setAttribute("hotelImage", hotelImage);

            Hotel hotel = HotelDAO.Instance().getHotelByID(Integer.parseInt(hotelID));
            req.setAttribute("hotel", hotel);

            //get all Untilities to Display
            ArrayList<Utilities> lstUltilities = new ArrayList<>();
            lstUltilities = UltilitiesDAO.Instance().getListUtilities();
            req.setAttribute("listUltilities", lstUltilities);

            ArrayList<Bed> beds = BedDAO.Instance().getListBed();
            req.setAttribute("beds", beds);

            ArrayList<RoomType> roomTypes = RoomTypeDAO.Instance().getListRoomType();
            req.setAttribute("roomTypes", roomTypes);
            

            //redirect to add room
            RequestDispatcher rd = req.getRequestDispatcher("/web/add-new-room.jsp");
            rd.forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post");
        String hotelID = req.getParameter("id");
        boolean check = true;
        try {
            String username = (String) req.getSession().getAttribute("username");

            //get all parameter[values]
            req.setCharacterEncoding("UTF-8");
            String roomType = req.getParameter("loaiPhong");
            String roomName = req.getParameter("tenPhongTuyChon");
            String loaiGiuong = req.getParameter("loaiGiuong");
            String soPhong = req.getParameter("soPhong");
            String soNguoiToiDa = req.getParameter("soNguoi");
            String dienTich = req.getParameter("dienTich");
            String gia = req.getParameter("gia");
            String[] arrayTienIch = req.getParameterValues("tienIch");

            Room room = new Room();

            RoomType roomType1 = new RoomType();

            roomType1.setIdRoomType(Integer.parseInt(roomType));
            room.setRoomType(roomType1);
            room.setRoomName(roomName);

            Hotel hotel = new Hotel();
            hotel.setIdHotel(Integer.parseInt(hotelID));
            room.setHotel(hotel);

            Bed bed = new Bed();
            bed.setIdBed(Integer.parseInt(loaiGiuong));
            room.setBed(bed);

            room.setAgcreage(Float.parseFloat(dienTich));
            room.setCost(Integer.parseInt(gia));
            room.setPeople(Integer.parseInt(soNguoiToiDa));
            room.setQuantity(Integer.parseInt(soPhong));
            room.setRoomLeft(Integer.parseInt(soPhong));
            room.setRemoved(false);

            RoomDAO.Instance().addNewRoom(room);
            int idRoom = RoomDAO.Instance().newestIDRoomOfIDHotel(hotelID);

            //then set RoomUtilities by idRoom + list IDUltilities send via <Input> tag
            for (int i = 0; i < arrayTienIch.length; i++) {
                RoomUltilitiesDAO.Instance().addRoomUtilities(Integer.parseInt(arrayTienIch[i]), idRoom);
            }

            //process image and save to HoteilImage by idHotel and LinkImage 
            /*GET IMAGE FROM REQUEST AND SAVE TO SERVER + SAVE TO DATABASE*/
            try {
                String SAVE_DIRECTORY = "images";
                // Đường dẫn tuyệt đối tới thư mục gốc của web app.
                String appPath = req.getServletContext().getRealPath("");
                appPath = appPath.replace('\\', '/');

                // Thư mục để save file tải lên.
                String fullSavePath = null;
                if (appPath.endsWith("/")) {
                    fullSavePath = appPath + SAVE_DIRECTORY;
                } else {
                    fullSavePath = appPath + "/" + SAVE_DIRECTORY;
                }
                // Tạo thư mục nếu nó không tồn tại.
                File fileSaveDir = new File(fullSavePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                // Danh mục các phần đã upload lên (Có thể là nhiều file).
                for (Part part : req.getParts()) {
                    String fileName = extractFileName(part);
                    //int idHotel;
                    String imageNumber = String.valueOf(RoomImageDAO.Instance().numberImageOfRoom() + 1);
                    if (fileName != null && fileName.length() > 0) {
                        String filePath = fullSavePath + File.separator + username + "ROOM" + imageNumber + fileName;
                        String linkToSaveInSQL = SAVE_DIRECTORY + File.separator + username + "ROOM" + imageNumber + fileName;
                        //Save LinkImage to SQL
                        RoomImageDAO.Instance().addNewRoomImage(linkToSaveInSQL, idRoom);
                        System.out.println("Write attachment to file: " + filePath);

                        // Ghi vào file.
                        part.write(filePath);
                    }
                }

                // Upload thành công.
                System.out.println("Ghi File Thành Công !");
            } catch (Exception e) {
                check = false;
                System.out.println("Process File Fail with err: ");
                e.printStackTrace();
            }

            /*END GET IMAGE FROM REQUEST AND SAVE TO SERVER + SAVE TO DATABASE*/
            //return result
            ArrayList<HotelImage> hotelImage = HotelImageDAO.Instance().getShortHotelInfoByID(hotelID);
            req.setAttribute("hotelImage", hotelImage);

            Hotel hotel2 = HotelDAO.Instance().getHotelByID(Integer.parseInt(hotelID));
            req.setAttribute("hotel", hotel2);

            //get all Untilities to Display
            ArrayList<Utilities> lstUltilities = new ArrayList<>();
            lstUltilities = UltilitiesDAO.Instance().getListUtilities();
            req.setAttribute("listUltilities", lstUltilities);

            ArrayList<Bed> beds = BedDAO.Instance().getListBed();
            req.setAttribute("beds", beds);

            ArrayList<RoomType> roomTypes = RoomTypeDAO.Instance().getListRoomType();
            req.setAttribute("roomTypes", roomTypes);
        } catch (Exception e) {
            check = false;

            ArrayList<HotelImage> hotelImage = HotelImageDAO.Instance().getShortHotelInfoByID(hotelID);
            req.setAttribute("hotelImage", hotelImage);

            Hotel hotel2 = HotelDAO.Instance().getHotelByID(Integer.parseInt(hotelID));
            req.setAttribute("hotel", hotel2);

            //get all Untilities to Display
            ArrayList<Utilities> lstUltilities = new ArrayList<>();
            lstUltilities = UltilitiesDAO.Instance().getListUtilities();
            req.setAttribute("listUltilities", lstUltilities);

            ArrayList<Bed> beds = BedDAO.Instance().getListBed();
            req.setAttribute("beds", beds);

            ArrayList<RoomType> roomTypes = RoomTypeDAO.Instance().getListRoomType();
            req.setAttribute("roomTypes", roomTypes);
        }

        req.setAttribute("addSuccess", check);
        String mes;
        if (check == true) {
            mes = "thêm phòng thành công";
        } else {
            mes = "thêm phòng thất bại";
        }
        req.setAttribute("message", mes);
        //redirect to add room
        RequestDispatcher rd = req.getRequestDispatcher("/web/add-new-room.jsp");
        rd.forward(req, resp);
    }

    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip

                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }
}

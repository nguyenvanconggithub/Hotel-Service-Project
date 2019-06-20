package controller.web.manageHotelInfomation.manageRoomInfomation;

import connection.*;
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
import model.*;

@WebServlet(urlPatterns = {"/edit-room"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        String idHotel = req.getParameter("idHotel");
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(Integer.parseInt(idHotel), username);
        if (isOwnHotel) {
            getData(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-room.jsp");
            rd.forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = (String) req.getSession().getAttribute("username");
        String idHotel = req.getParameter("idHotel");
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(Integer.parseInt(idHotel), username);
        if (isOwnHotel) {
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

                /*
            *REMOVE IMAGES WHICH IS REMOVED OR EDITED
                 */
                //ListRemoveImage pattern "55-88-77-66-22-11-44-66,..." number is idRoomImage
                if (req.getParameter("listRemoveImage") != null) {
                    String[] listRemoveID = req.getParameter("listRemoveImage").split("-");
                    for (String removeID : listRemoveID) {
                        System.out.println(removeID);
                        //get link image and remove file equal that link
                        String removeImageFile = req.getServletContext().getRealPath(RoomImageDAO.Instance().getLinkRoomImageBy(removeID));
                        System.out.println(removeImageFile);
                        File removeFile = new File(removeImageFile);
                        removeFile.delete();
                        //remove record where ID Image = removeID
                        RoomImageDAO.Instance().removeRoomImageID(removeID);
                    }
                }

                /*
            *END REMOVE IMAGES WHICH IS REMOVED OR EDITED
                 */
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

    }

    public void getData(HttpServletRequest req, HttpServletResponse resp) {
        String idHotel = req.getParameter("idHotel");
        String idRoom = req.getParameter("idRoom");
        ArrayList<RoomType> listRoomTypes = RoomTypeDAO.Instance().getListRoomType();
        ArrayList<Bed> listBeds = BedDAO.Instance().getListBed();
        ArrayList<Utilities> listUti = UltilitiesDAO.Instance().getListUtilities();
        ArrayList<RoomUltilities> listOldUti = RoomUltilitiesDAO.Instance().getListRoomUtility(idRoom);
        ArrayList<RoomImage> listRoom = RoomImageDAO.Instance().getShortRoomInfor(idHotel);
        ArrayList<RoomImage> listImgRoom = RoomImageDAO.Instance().getListImg(idRoom);
        Hotel HotelInfor = HotelDAO.Instance().getShortHotelInfoByID(idHotel);
        ArrayList<HotelImage> listHotelImg = HotelImageDAO.Instance().getShortHotelInfoByID(idHotel);
        req.setAttribute("listBed", listBeds);
        req.setAttribute("listRT", listRoomTypes);
        req.setAttribute("listUti", listUti);
        req.setAttribute("listOldUti", listOldUti);
        req.setAttribute("listHotelImg", listHotelImg);
        req.setAttribute("listRoomImg", listRoom);
        req.setAttribute("idRoom", idRoom);
        req.setAttribute("idHotel", idHotel);
        req.setAttribute("hotel", HotelInfor);
        req.setAttribute("listImg", listImgRoom);
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

package controller.web.manageHotelInfomation;

import connection.HotelDAO;
import connection.HotelImageDAO;
import connection.HotelUltilitiesDAO;
import connection.UltilitiesDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Hotel;
import model.Utilities;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

@WebServlet(urlPatterns = {"/edit-hotel"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String HOTEL_MANAGER = "1";
        String role = (String) req.getSession().getAttribute("role");
        String ownUsername = (String) req.getSession().getAttribute("username");
        System.out.println(req.getParameter("tenKhachSan"));
        int idHotel = Integer.parseInt(req.getParameter("id"));
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(idHotel, ownUsername);

        if (role.equals(HOTEL_MANAGER) && isOwnHotel) {

            //get hotel table by id
            req.setAttribute("idHotel", idHotel);
            req.setAttribute("hotelInfo", HotelDAO.Instance().getHotelByID(idHotel));
            req.setAttribute("listIdUtilitiesNow", HotelUltilitiesDAO.Instance().listIDUtilitiesOfIDHotel(idHotel));
            req.setAttribute("listFullUtilities", UltilitiesDAO.Instance().getListUtilities());
            req.setAttribute("listFullImageHotel", HotelImageDAO.Instance().getShortHotelInfoByID(String.valueOf(idHotel)));
            //redirect edit hotel
            RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
            rd.forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String HOTEL_MANAGER = "1";
        String role = (String) req.getSession().getAttribute("role");
        String ownUsername = (String) req.getSession().getAttribute("username");
        int idHotel = Integer.parseInt(req.getParameter("idHotel"));
        boolean isOwnHotel = HotelDAO.Instance().hotelIsOwnByUsername(idHotel, ownUsername);
        if (!role.equals(HOTEL_MANAGER) || !isOwnHotel) {
            return;
        }
        if (role.equals(HOTEL_MANAGER) && isOwnHotel) {

            boolean addSuccess = true;
            ArrayList<Utilities> lstUltilities = new ArrayList<>();
            lstUltilities = UltilitiesDAO.Instance().getListUtilities();

            //get all parameter[values]
            req.setCharacterEncoding("UTF-8");

            String hotelName = req.getParameter("tenKhachSan");

            String phone = req.getParameter("SDT");
            String address = req.getParameter("diaChi");
            int star = Integer.parseInt(req.getParameter("star"));
            String[] arrayIDUltilites = req.getParameterValues("tienIch");
            if (arrayIDUltilites == null) {
                arrayIDUltilites = new String[0];
            }
            //store hotel first and get newest username's idHotel
            Hotel hotel = new Hotel();
            hotel.setHotelName(hotelName);
            hotel.setAddress(address);
            hotel.setStar(star);
            hotel.setSDT(phone);
            addSuccess = HotelDAO.Instance().editHotel(hotel, idHotel);
            if (addSuccess == false) {
                //get all Untilities to Display
                req.setAttribute("addSuccess", addSuccess);
                req.setAttribute("listUltilities", lstUltilities);
                req.setAttribute("message", "Mã Lỗi ANKS_001. New IDHotel return ZERO or HotelName, hotelAdress, Phone error. Contact us at footer");
                RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
                rd.forward(req, resp);
                return;
            }
            //remove all old utilities
            addSuccess = HotelUltilitiesDAO.Instance().removeAllOldUltilOfIdHotel(idHotel);
            
            //then set HotelUtilities by idHotel + list IDUltilities send via <Input> tag
            for (int i = 0; i < arrayIDUltilites.length; i++) {
                addSuccess = HotelUltilitiesDAO.Instance().addHotelUtilities(Integer.parseInt(arrayIDUltilites[i]), idHotel);
                if (addSuccess == false) {
                    req.setAttribute("addSuccess", addSuccess);
                    //get all Untilities to Display
                    req.setAttribute("listUltilities", lstUltilities);
// >>>>>>>>>>>>>>>>>>REMOVE ALL ADDED UTILITIES WHERE idHotel = newIDHotel AND REMOVE Hotel(COMING SOON)<<<<<<<<<
                    req.setAttribute("message", "Mã Lỗi ANUH_001. Add Utilities ERROR. Contact us at footer");
                    RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
                    rd.forward(req, resp);
                    return;
                }
            }
            
            
            /*
            *REMOVE IMAGES WHICH IS REMOVED OR EDITED
            */
            //ListRemoveImage pattern "55-88-77-66-22-11-44-66,..." number is idHotelImage
            if(req.getParameter("listRemoveImage") != null){
                String[] listRemoveID = req.getParameter("listRemoveImage").split("-");
                for(String removeID : listRemoveID){
                    //get link image and remove file equal that link
                    String removeImageFile = req.getServletContext().getRealPath(HotelImageDAO.Instance().getLinkHotelImageBy(removeID));
                    File removeFile = new File(removeImageFile);
                    removeFile.delete();
                    //remove record where ID Image = removeID
                    HotelImageDAO.Instance().removeHotelImageID(removeID);
                }
            }
            
            
            /*
            *END REMOVE IMAGES WHICH IS REMOVED OR EDITED
            */
            
            
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
                    String imageNumber = String.valueOf(HotelImageDAO.Instance().numberImageOfHotel() + 1);
                    if (fileName != null && fileName.length() > 0) {
                        String filePath = fullSavePath + File.separator + ownUsername + "HOTEL" + imageNumber + fileName;
                        String linkToSaveInSQL = SAVE_DIRECTORY + File.separator + ownUsername + "HOTEL" + imageNumber + fileName;
                        //Save LinkImage to SQL
                        addSuccess = HotelImageDAO.Instance().addNewHotelImage(linkToSaveInSQL, idHotel);
                        if (addSuccess == false) {
                            req.setAttribute("addSuccess", addSuccess);
                            //get all Untilities to Display
                            req.setAttribute("listUltilities", lstUltilities);
// >>>>>>>>>>>>>>>>>>REMOVE ALL ADDED UTILITIES,LinkImage WHERE idHotel = newIDHotel AND REMOVE Hotel(COMING SOON)<<<<<<<<<
                            req.setAttribute("message", "Mã Lỗi ANIL_001. Add Image Link ERROR. Contact us at footer");
                            RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
                            rd.forward(req, resp);
                            return;
                        }

                        // Ghi vào file.
                        part.write(filePath);
                    }
                }
            } catch (Exception e) {
                //get all Untilities to Display
                addSuccess = false;
                req.setAttribute("addSuccess", addSuccess);
                req.setAttribute("listUltilities", lstUltilities);
                // >>>>>>>>>>>>>>>>>>REMOVE ALL ADDED UTILITIES,LinkImage WHERE idHotel = newIDHotel AND REMOVE Hotel(COMING SOON)<<<<<<<<<
                req.setAttribute("message", "Mã Lỗi ANIM. Process File error. Contact us at footer");
                RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
                rd.forward(req, resp);
                System.out.println("Process File Fail with err: ");
                e.printStackTrace();
                return;
            }

            
            req.setAttribute("addSuccess", addSuccess);
            req.setAttribute("message", "Sửa thông tin khách sạn thành công");
            
            //get hotel table by id
            req.setAttribute("idHotel", idHotel);
            req.setAttribute("hotelInfo", HotelDAO.Instance().getHotelByID(idHotel));
            req.setAttribute("listIdUtilitiesNow", HotelUltilitiesDAO.Instance().listIDUtilitiesOfIDHotel(idHotel));
            req.setAttribute("listFullUtilities", UltilitiesDAO.Instance().getListUtilities());
            req.setAttribute("listFullImageHotel", HotelImageDAO.Instance().getShortHotelInfoByID(String.valueOf(idHotel)));
             //redirect edit hotel
            RequestDispatcher rd = req.getRequestDispatcher("/web/edit-hotel-infomation.jsp");
            rd.forward(req, resp);
            return;
            /*END GET IMAGE FROM REQUEST AND SAVE TO SERVER + SAVE TO DATABASE*/
            //return result

        }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UploadFile;

/**
 *
 * @author Admin
 */
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/uploadFileResults")
public class UploadFileResultsServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
 
   public UploadFileResultsServlet() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
 
       RequestDispatcher dispatcher
           = request.getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFileResults.jsp");
 
       dispatcher.forward(request, response);
   }
 
}
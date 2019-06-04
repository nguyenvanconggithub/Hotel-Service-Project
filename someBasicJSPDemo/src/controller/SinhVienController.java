package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
//import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.SinhVienTable;
import modal.SinhVien;

@WebServlet(urlPatterns = {"/danh-sach","/danh-sach/edit","/danh-sach/remove","/danh-sach-Panination"})
public class SinhVienController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private void in(String value) {
		System.out.println(value);
	}
	private void logAllRequestMethodValue(HttpServletRequest req) {
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logAllRequestMethodValue(req);
		String servletPath = req.getServletPath();
		String pathInfo = req.getPathInfo();
		System.out.print("Servlet: " + servletPath + " AND PathInfo: " + pathInfo + "\n");
		if(servletPath.equals("/danh-sach")) {
			List<SinhVien> lst = SinhVienTable.getInstance().getAllData();
			//ArrayList<SinhVien> danhSachSinhVien = SinhVienTable.getInstance().getAllData();
			req.setAttribute("ListSinhVien", lst);
			req.setAttribute("testTag", "Xin Chào Các Bạn");
			RequestDispatcher rd = req.getRequestDispatcher("/views/danhSachSinhVien.jsp");
			rd.forward(req, resp);
		}
		if(servletPath.equals("/danh-sach-Panination")) {
			int page = Integer.parseInt(req.getParameter("page"));
			int pageSize = 20;
			SinhVienTable.getInstance().setPageSize(pageSize);
			ArrayList<SinhVien> lst =  SinhVienTable.getInstance().getDataInPage(page);
			req.setAttribute("ListSinhVien", lst);
			req.setAttribute("testTag", "Xin Chào Các Bạn");
			RequestDispatcher rd = req.getRequestDispatcher("/views/danhSachSinhVien.jsp");
			rd.forward(req, resp);
		}
		if(servletPath.equals("/danh-sach/edit")) {
			String maSV = req.getParameter("MaSV");
			SinhVien sv = SinhVienTable.getInstance().getSinhVien(maSV);
			
			req.setAttribute("SinhVienINFO", sv);
			
			RequestDispatcher rd = req.getRequestDispatcher("/views/editSinhVien.jsp");
			rd.forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}

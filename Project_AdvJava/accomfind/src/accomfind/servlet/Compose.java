package accomfind.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accomfind.dbtasks.CrudOperation;

/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps, ps2;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid = request.getParameter("txtid");
		String subject = request.getParameter("txtsub");
		String message = request.getParameter("txtmsg");
		String senderid = request.getParameter("txtsenderid");

		java.util.Date dt = new java.util.Date();
		long t = dt.getTime();
		java.sql.Date sd = new java.sql.Date(t);
		
		con = CrudOperation.createConnection();
		//System.out.println(userid + subject + message + senderid + sd);
		
		try {

			String sql = "insert into inbox(senderid, receiverid, subject, message, dateofmsg)values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, senderid);
			ps.setString(2, userid);
			ps.setString(3, subject);
			ps.setString(4, message);
			ps.setDate(5, sd);
			// System.out.println(ps);
			int rw = ps.executeUpdate();

			if (rw > 0) {
				System.out.println("row inserted successfully");
				response.sendRedirect("/accomfind/html/home.html");
			}

		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}
		
		try {

			String sql2 = "insert into sentitem(senderid, receiverid, subject, message, dateofmsg)values(?,?,?,?,?)";
			ps2 = con.prepareStatement(sql2);
			ps2.setString(1, senderid);
			ps2.setString(2, userid);
			ps2.setString(3, subject);
			ps2.setString(4, message);
			ps2.setDate(5, sd);
			// System.out.println(ps);
			int rw1 = ps2.executeUpdate();

			if (rw1 > 0) {
				System.out.println("row inserted successfully");
				/* response.sendRedirect("/accomfind/html/home.html"); */
			}

		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (ps2 != null)
					ps2.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}
		
		
	}

}

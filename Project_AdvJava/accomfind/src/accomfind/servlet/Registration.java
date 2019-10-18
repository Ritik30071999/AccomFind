package accomfind.servlet;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accomfind.dbtasks.CrudOperation;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement pssr, pslogin/* , psarea */;
	private ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		con = CrudOperation.createConnection();
		String strsql = "select * from hostel_pg_owner where ownerid=?";
		try {
			pslogin = con.prepareStatement(strsql);
			rs = CrudOperation.getData(strsql, id);
			if (rs.next()) {
				out.println("userid already exists");
			}
		} catch (SQLException se) {
			System.out.println(se);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("txtuserid");
		String userownname = request.getParameter("txtuserownname");
		String userpass = request.getParameter("txtuserpass");
		String username = request.getParameter("txtusername");
		String useradd = request.getParameter("txtuseradd");
		String useremail = request.getParameter("txtuseremail");
		String userphone = request.getParameter("txtuserphone");
		String userarea = request.getParameter("cmbarea");
		String usercat = request.getParameter("cmbcat");
		String usersubid = request.getParameter("txtusersubid");
		String userhosteltype = request.getParameter("cmbtype");

		con = CrudOperation.createConnection();

		try {
			con.setAutoCommit(false);
			String strinsert = "insert into logininfo values(?,?,?)";
			pslogin = con.prepareStatement(strinsert);
			pslogin.setString(1, userid);
			pslogin.setString(2, userpass);
			pslogin.setString(3, "Hostel Owner");
			int row1 = pslogin.executeUpdate();

			/*
			 * String strarea = "insert into area values(?)"; psarea =
			 * con.prepareStatement(strarea); psarea.setString(1, userarea); int row2 =
			 * pslogin.executeUpdate();
			 */

			java.util.Date dt = new java.util.Date();
			long t = dt.getTime();
			java.sql.Date sd = new java.sql.Date(t);
			String sql = "insert into hostel_pg_owner(ownerid, hostelname, address, email, phoneno, dor, ownername, areaid, category, subscriptionid, type)values(?,?,?,?,?,?,?,?,?,?,?)";
			pssr = con.prepareStatement(sql);
			pssr.setString(1, userid);
			pssr.setString(2, username);
			pssr.setString(3, useradd);
			pssr.setString(4, useremail);
			pssr.setString(5, userphone);
			pssr.setDate(6, sd);
			pssr.setString(7, userownname);
			pssr.setString(8, userarea);
			pssr.setString(9, usercat);
			pssr.setString(10, usersubid);
			pssr.setString(11, userhosteltype);
			// System.out.println(pssr);
			int rw = pssr.executeUpdate();

			if (rw > 0 && row1 > 0 /* && row2>0 */) {
				con.commit();
				System.out.println("row inserted successfully");
				response.sendRedirect("/accomfind/jsp/ownerhome.jsp");
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (pssr != null)
					pssr.close();
				if (pslogin != null)
					pslogin.close();
				/*
				 * if (psarea != null) psarea.close();
				 */
			} catch (SQLException se) {
				System.out.println(se);
			}
		}

	}

}

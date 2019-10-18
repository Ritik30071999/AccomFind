package accomfind.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accomfind.dbtasks.CrudOperation;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psur, pslogin;
	private ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegistration() {
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
		String strsql = "select * from user where userid=?";
		try {
			pslogin = con.prepareStatement(strsql);
			rs = CrudOperation.getData(strsql, id);
			if (rs.next()) {
				out.println("userid already exists");
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (pslogin != null)
					pslogin.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid = request.getParameter("txtuserid");
		String username = request.getParameter("txtusername");
		String userpass = request.getParameter("txtuserpass");
		String useradd = request.getParameter("txtuseradd");
		String useremail = request.getParameter("txtuseremail");
		String usergender = request.getParameter("gender");
		String userphone = request.getParameter("txtuserphone");
		String userdob = request.getParameter("txtuserdob");

		con = CrudOperation.createConnection();

		try {
			con.setAutoCommit(false);
			String strinsert = "insert into logininfo values(?,?,?)";
			pslogin = con.prepareStatement(strinsert);
			pslogin.setString(1, userid);
			pslogin.setString(2, userpass);
			pslogin.setString(3, "User");
			int row1 = pslogin.executeUpdate();

			java.util.Date dt = new java.util.Date();
			long t = dt.getTime();
			java.sql.Date sd = new java.sql.Date(t);
			String sql = "insert into user(userid, name, address, email, gender, phoneno, dor, dob)values(?,?,?,?,?,?,?,?)";
			psur = con.prepareStatement(sql);
			psur.setString(1, userid);
			psur.setString(2, username);
			psur.setString(3, useradd);
			psur.setString(4, useremail);
			psur.setString(5, usergender);
			psur.setString(6, userphone);
			psur.setDate(7, sd);
			psur.setString(8, userdob);
			// System.out.println(psur);
			int rw = psur.executeUpdate();

			if (rw > 0 && row1 > 0) {
				con.commit();
				System.out.println("row inserted successfully");
				response.sendRedirect("/accomfind/jsp/userhome.jsp");
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (psur != null)
					psur.close();
				if (pslogin != null)
					pslogin.close();
			} catch (SQLException se) {
				System.out.println(se);
			}
		}
	}

}

package accomfind.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accomfind.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class RoomDetails
 */
@WebServlet("/RoomDetails")
public class RoomDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	//private ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomDetails() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ownerid = request.getParameter("txtownerid");
		String charges = request.getParameter("txtcharges");
		String total = request.getParameter("txttotal");
		String facilities = request.getParameter("txtfacilities");
		String ac = request.getParameter("cmbac");
		String type = request.getParameter("cmbroomtype");

		con = CrudOperation.createConnection();

		try {
			con.setAutoCommit(false);
			String strinsert = "insert into room_details values(?,?,?,?,?,?)";
			ps = con.prepareStatement(strinsert);
			ps.setString(1, type);
			ps.setString(2, charges);
			ps.setString(3, total);
			ps.setString(4, facilities);
			ps.setString(5, ac);
			ps.setString(6, ownerid);
			int row = ps.executeUpdate();
			if (row > 0) {
				con.commit();
				System.out.println("row inserted successfully");
				response.sendRedirect("/accomfind/jsp/ownerhome.jsp");
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

	}
}

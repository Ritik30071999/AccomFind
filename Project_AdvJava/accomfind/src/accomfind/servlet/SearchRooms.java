package accomfind.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accomfind.dbtasks.CrudOperation;

import java.sql.*;

/**
 * Servlet implementation class SearchRooms
 */
@WebServlet("/SearchRooms")
public class SearchRooms extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchRooms() {
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
		String strsql = "select * from hostel_pg_owner where areaid=?";
		try {
			ps = con.prepareStatement(strsql);
			rs = CrudOperation.getData(strsql, id);
			if (rs.next()) {
				out.println("<%\r\n"
						+ "				String strsql = \"select * from hostel_pg_owner where areaid=?\";\r\n"
						+ "					ResultSet rsdata = CrudOperation.getData(strsql, userid);\r\n"
						+ "					if (rsdata.next()) {\r\n"
						+ "						String hostelname = rsdata.getString(\"hostelname\");\r\n"
						+ "						String address = rsdata.getString(\"address\");\r\n"
						+ "						String email = rsdata.getString(\"email\");\r\n"
						+ "						String phoneno = rsdata.getString(\"phoneno\");\r\n"
						+ "						String ownername = rsdata.getString(\"ownername\");\r\n"
						+ "						String area = rsdata.getString(\"areaid\");\r\n"
						+ "						String category = rsdata.getString(\"category\");\r\n"
						+ "						String subid = rsdata.getString(\"subscriptionid\");\r\n"
						+ "						String type = rsdata.getString(\"type\");\r\n" + "			%>\r\n"
						+ "			<table border=2 style=\"margin-left: 100px; margin-top: 100px\">\r\n"
						+ "				<tr>\r\n" + "					<th>Hostel Name</th>\r\n"
						+ "					<th><%=hostelname%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Address</th>\r\n"
						+ "					<th><%=address%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Email</th>\r\n"
						+ "					<th><%=email%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Phone No.</th>\r\n"
						+ "					<th><%=phoneno%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Owner Name</th>\r\n"
						+ "					<th><%=ownername%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Area</th>\r\n"
						+ "					<th><%=area%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Category</th>\r\n"
						+ "					<th><%=category%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Subscription ID</th>\r\n"
						+ "					<th><%=subid%></th>\r\n" + "				</tr>\r\n"
						+ "				<tr>\r\n" + "					<th>Type</th>\r\n"
						+ "					<th><%=type%></th>\r\n" + "				</tr>\r\n"
						+ "			</table>\r\n" + "			<%\r\n" + "				}\r\n" + "			%>");
			}
		} catch (SQLException se) {
			System.out.println(se);
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
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
		doGet(request, response);
	}

}

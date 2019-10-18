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
 * Servlet implementation class Inbox
 */
@WebServlet("/Inbox")
public class Inbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement ps;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inbox() {
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
		String[] arr = request.getParameterValues("chk");
		con = CrudOperation.createConnection();

		String strdelete = "delete from inbox where senderid=?";

		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(strdelete);
			for (int i = 0; i < arr.length; i++) {
				ps.setString(1, arr[i]);
				ps.addBatch();
			}
			int flag = 0;
			int[] rows = ps.executeBatch();
			for (int j = 0; j < rows.length; j++) {
				if (rows[j] < 0) {
					flag = 1;
					break;
				}

			}
			if (flag == 0) {
				con.setAutoCommit(true);
				response.sendRedirect("/accomfind/jsp/inbox.jsp");
			}

		} catch (SQLException se) {
			System.out.println(se);
			//con.rollback();//it can also be used other than setAutoCommit
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

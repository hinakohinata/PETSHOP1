package com.fpltn.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fpltn.dao.CartDao;
import com.fpltn.entities.Cartlist;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CartDao dao= new CartDao();
		int user=Integer.parseInt(request.getParameter("user"));
		List<Cartlist> danhsachAll=dao.getCartlist();
		List<Cartlist> danhsach= new ArrayList<>();
		double tongtien=0;
		for(Cartlist i: danhsachAll) {
			if(i.getUser().getId()==user) {
				danhsach.add(i);
				tongtien+= i.getTongtien();
			}
		}
		jakarta.servlet.http.HttpSession session = request.getSession();
		session.setAttribute("listSP", danhsach);
		session.setAttribute("thanhtien", tongtien);
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

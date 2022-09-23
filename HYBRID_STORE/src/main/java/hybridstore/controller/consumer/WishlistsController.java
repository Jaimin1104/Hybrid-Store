package hybridstore.controller.consumer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.consumer.WishlistsDao;


@WebServlet("/WishlistsController.do")
public class WishlistsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out ;

    public WishlistsController() {
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("add item"))
		{
			int consumerid = Integer.parseInt(request.getParameter("consumerid"));
			int productid = Integer.parseInt(request.getParameter("productid"));
			boolean isSuccess = new WishlistsDao().addProductInWishlist(consumerid, productid);
			if(isSuccess)
			{
				out = response.getWriter();
				out.println("Product is added");
			}
			else
			{
				out = response.getWriter();
				out.println("Product is not added");
			}
		}
		else if(btn.equalsIgnoreCase("delete item"))
		{
			int consumerid = Integer.parseInt(request.getParameter("consumerid"));
			int productid = Integer.parseInt(request.getParameter("productid"));
			System.out.println(consumerid + " hello "+ productid);
			boolean isSuccess = new WishlistsDao().removeProductFromWishlist(consumerid, productid);
			if(isSuccess)
			{
				out = response.getWriter();
				String caller = request.getParameter("caller");
				if(caller!=null)
				{
					response.sendRedirect(caller+".jsp");
				}
				else
				{
					out.println("Product is deleted");
				}
			}
			else
			{
				out = response.getWriter();
				out.println("Product is not deleted");
			}
		}
	}

}

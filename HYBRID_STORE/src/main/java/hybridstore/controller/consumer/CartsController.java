package hybridstore.controller.consumer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hybridstore.dao.consumer.CartDao;
import hybridstore.dao.consumer.CartItemsDao;


@WebServlet("/CartsController.do")
public class CartsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
    public CartsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btn = request.getParameter("btn");
		CartItemsDao cartitem = new CartItemsDao();
		CartDao cart = new CartDao();
		String caller = request.getParameter("caller");
		if(btn.equalsIgnoreCase("add item"))
		{
			int productid = Integer.parseInt(request.getParameter("productid"));
			int consumerid = 0;
			if(request.getParameter("consumerid") != null)
			{
				consumerid = Integer.parseInt(request.getParameter("consumerid"));
			}
			else
			{
				response.sendRedirect("login.jsp");
			}
			int quantity;
			if((request.getParameter("quantity"))!=null)
			{
				quantity = Integer.parseInt(request.getParameter("quantity"));	
			}
			else
			{
				quantity = 1;
			}
			boolean isSuccess = cartitem.addProductInCart(productid, consumerid,quantity);
			if(isSuccess)
			{
				isSuccess = cart.updateCartOfConsumer(consumerid);
				if(isSuccess)
				{
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					if(caller!=null)
					{
						out.println("window.location.href='shop.jsp';");
						//out.println("window.location.href='shop.jsp?show=cart';");
					}
					else
					{
						out.println("window.location.href='cart.jsp';");
					}
					//	out.println("alert('Product is added in cart');");
					out.println("</script>");
				}
			}
			else
			{
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='shop.jsp';");
			//	out.println("alert('Product is not added');");
				out.println("</script>");	
			}
		}
		if(btn.equalsIgnoreCase("delete item"))
		{
			int productid = Integer.parseInt(request.getParameter("productid"));
			int consumerid = Integer.parseInt(request.getParameter("consumerid"));
			boolean isSuccess = cartitem.deleteProductInCart(productid);
			if(isSuccess)
			{
				isSuccess = cart.updateCartOfConsumer(consumerid);
				if(isSuccess)
				{
					out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					if(caller!=null)
					{
						out.println("window.location.href='"+caller+".jsp';");
					//out.println("window.location.href='shop.jsp?show=cart';");
					}
					else
					{
						out.println("window.location.href='cart.jsp';");
					}
					//	out.println("alert('Product is added in cart');");
					out.println("</script>");
				}	
			}
			else
			{
				out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("window.location.href='cart.jsp';");
				out.println("alert('Product is not deleted');");
				out.println("</script>");	
			}
		}
	}

}

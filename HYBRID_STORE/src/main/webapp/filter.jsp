<%@page import="hybridstore.model.StockModel"%>
<%@page import="hybridstore.model.WishlistsModel"%>
<%@page import="hybridstore.model.SubCategoriesModel"%>
<%@page import="java.security.PolicySpi"%>
<%@page import="hybridstore.dao.consumer.CartItemsDao"%>
<%@page import="hybridstore.dao.consumer.CartDao"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="hybridstore.model.CartModel"%>
<%@page import="hybridstore.model.CartItemsModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hybridstore.model.ProductsModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="hybridstore.util.DBConnector"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

</head>
<body>
	<%
	String query;
	 Connection connection = new DBConnector().getConnection();
	if(request.getParameter("action")!=null)
	{
		if((request.getParameter("action")).equalsIgnoreCase("side_filter"))
		{
			
			query = "select * from Categories";
			if((request.getParameter("subcategory")).length()>0)  
			{
				query = query + " where categoryid in (SELECT categoryid FROM products WHERE subcategoryid IN (" + request.getParameter("subcategory") + "))"; 
			}
			else
			{
				query = query + " where categoryid in (select categoryid from categories)";
			}
			if((request.getParameter("brand")).length()>0)  
			{
				query = query + " and categoryid IN (SELECT categoryid FROM products WHERE brandid IN (" + request.getParameter("brand") + "))"; 
			}
			/* System.out.println(query); */
			PreparedStatement pstmt2 = connection.prepareStatement(query);
			ResultSet productResult2 = pstmt2.executeQuery();
			out.println("<div class='mb-30'>");
			out.println("<h4 class='mb-3'>Shop by Category</h4>");
			while (productResult2.next()) {
			 	int totalProducts = new ProductsModel().getTotalProductsByCategoryid(productResult2.getInt("categoryid"));
				if(totalProducts>0)
				{
					out.println("<div class='d-flex justify-content-between custom-checkbox'>");
					out.println("<label class='label'>"+productResult2.getString("categoryname"));
					out.println("<input type='checkbox' onclick='clicked_filter()' id='category' name='category' value='"+productResult2.getInt("categoryid")+"'>"); 
					out.println("<span class='box' style='border-radius: 0%;'></span> </label> <span class='mt-2'>"+totalProducts+"</span>");
					out.println("</div>");
				 } 
			}
			out.println("</div>");
			
			query = "select * from SubCategories";
			if((request.getParameter("category")).length()>0)  
			{
				query = query + " where categoryid in ("+request.getParameter("category")+")"; 
			}
			else
			{
				query = query + " where categoryid in (select categoryid from categories)";
			}
			if((request.getParameter("brand")).length()>0)  
			{
				query = query + " and subcategoryid IN (SELECT subcategoryid FROM products WHERE brandid IN (" + request.getParameter("brand") + "))"; 
			}
			/* System.out.println(query); */
			pstmt2 = connection.prepareStatement(query);
			productResult2 = pstmt2.executeQuery();
			out.println("<div class='mb-30'>");
			out.println("<h4 class='mb-3'>Shop by Subcategory</h4>");
			while (productResult2.next()) {
				int totalProducts = new ProductsModel().getTotalProductsBySubCategoryid(productResult2.getInt("subcategoryid"));
				if(totalProducts>0)
				{
				out.println("<div class='d-flex justify-content-between custom-checkbox'>");
				out.println("<label class='label'>"+productResult2.getString("subcategoryname"));
				out.println("<input type='checkbox' onclick='clicked_filter()' id='subcategory' name='subcategory' value='"+productResult2.getInt("subcategoryid")+"'>"); 
				out.println("<span class='box' style='border-radius: 0%;'></span> </label> <span class='mt-2'>"+totalProducts+"</span>");
				out.println("</div>");
				}
			}
			out.println("</div>");
		
			query = "SELECT * FROM brands WHERE brandid IN (SELECT brandid FROM products";
			if((request.getParameter("subcategory")).length()>0)  
			{
				query = query + " WHERE subcategoryid IN ("+request.getParameter("subcategory")+")"; 
			}
			else if((request.getParameter("category")).length()>0)
			{
				query = query + " WHERE categoryid IN ("+request.getParameter("category")+")"; 
			}
			query = query + ")";
			pstmt2 = connection.prepareStatement(query);
			productResult2 = pstmt2.executeQuery();
			/* System.out.println(productResult2); */
			out.println("<div class='mb-30'>");
			out.println("<h4 class='mb-3'>Shop by Brand</h4>");
			while (productResult2.next()) {
				int totalProducts = new ProductsModel().getTotalProductsByfilter(productResult2.getInt("brandid"), request.getParameter("category"), request.getParameter("subcategory"));
				if(totalProducts>0)
				{
					out.println("<div class='d-flex justify-content-between custom-checkbox'>");
					out.println("<label class='label'>"+productResult2.getString("brandname"));
					out.println("<input type='checkbox' onclick='clicked_filter()' id='brand' name='brand' value='"+productResult2.getInt("brandid")+"'>"); 
					out.println("<span class='box' style='border-radius: 0%;'></span> </label> <span class='mt-2'>"+totalProducts+"</span>");
					out.println("</div>");
				}
			}
			out.println("</div>");
		}
		else 
		{
			query = "select * from products where status='Active'";
		 	if((request.getParameter("category")).length()>0)  
			{
				query = query + " and categoryid in ("+request.getParameter("category")+")"; 
			}
			if((request.getParameter("subcategory")).length()>0)
			{
				query = query + " and subcategoryid in ("+request.getParameter("subcategory")+")";
			}
			if((request.getParameter("brand")).length()>0)
			{
				query = query + " and brandid in ("+request.getParameter("brand")+")";
			}
			if((request.getParameter("price_range")).length()>0)
			{
				String range[] = (request.getParameter("price_range")).split(",");
				query = query + " and price between "+range[0]+" and "+range[1];
			}
			if((request.getParameter("search_data")).length()>0)
			{
				query = query + " and productname like '"+request.getParameter("search_data")+"%'";
			}
			/* System.out.println(query); */
			ArrayList<ProductsModel> products = new ProductsModel().getAllProducts(query);
			if((request.getParameter("action")).equalsIgnoreCase("counter"))
			{
				out.println(products.size());
			}
			else
			{
				int pagenumber = Integer.parseInt(request.getParameter("currentPage"));
				
				if(request.getParameter("display_products").equalsIgnoreCase("thumble"))
				{
					query = query + " Limit "+(pagenumber-1)*12+",12";
					ArrayList<ProductsModel> allProducts = new ProductsModel().getAllProducts(query);
					if(allProducts.isEmpty())
					{
						out.println("<span style='margin-left:40%;'>Products Not Found</span>");
					}
					else
					{
						for (ProductsModel product : allProducts)
						{
							out.println("<div class='col-lg-4 col-sm-6 mb-4'>");	
							out.println("<div class='product text-center'>");
							out.println("<div class='product-thumb'>");
							out.println("<div class='overflow-hidden position-relative'>");
							out.println("<a href='product-single.jsp?productid="+product.getProductid()+"'><img class='img-fluid w-100 mb-3 img-first' style='min-height: 275px;max-height: 275px;' src='"+product.getImg1()+"' alt='product-img'>");
							out.println("<img class='img-fluid w-100 mb-3 img-second' style='min-height: 275px;max-height: 275px;' src='"+product.getImg2()+"' alt='product-img'> </a>");
							out.println("<form action='CartsController.do' method='post'><div class='btn-cart'>");
							ConsumersModel consumer = (ConsumersModel)(session.getAttribute("consumer"));
							if(consumer!=null)
							{
								out.println("<input type='hidden' name='consumerid' value='"+consumer.getConsumerid()+"'>");
							}
							out.println("<input type='hidden' name='caller' value='main'>");
							out.println("<input type='hidden' name='productid' value='"+product.getProductid()+"'>");
							out.println("<button name='btn' value='add item' class='btn btn-primary btn-sm'>Add To Cart</button></div></form></div>");
							out.println("<div class='product-hover-overlay'>");
							out.println("<a href='#' onclick='workToWishlist("+product.getProductid()+",this)' class='product-icon favorite' data-toggle='tooltip' data-placement='left' title='Wishlist'>");
							
							if(consumer!=null)
							{
								if(new WishlistsModel().isPresent(consumer.getConsumerid(), product.getProductid()))
								{
									out.println("<i class='fa fa-heart' aria-hidden='true'></i>");
								}
								else
								{
									out.println("<i class='ti-heart'></i>");
								}
							}
							else
							{
								out.println("<i class='ti-heart'></i>");
							}
							out.println("</a>");
							// <a data-vbtype='inline' href='#quickView' class='product-icon view venobox vbox-item' style='top: 70px;' data-toggle='tooltip' data-placement='left' title='Quick View'><i class='ti-search'></i></a>	
							out.println("</div></div>");	
							out.println("<div class='product-info'><h3 class='h5'><a class='text-color' href='product-single.jsp?productid="+product.getProductid()+"'>"+product.getProductname()+"</a></h3>");			
							out.println("<span class='h5'><span style='font-size: 18px;'>&#x20B9;</span>"+product.getPrice()+"</span></div>");				 		
							out.println("<div class='product-label sale'>-8%</div></div></div>");
						}
					}
				}
				else
				{
					query = query + " Limit "+(pagenumber-1)*8+",8";
					ArrayList<ProductsModel> allProducts = new ProductsModel().getAllProducts(query);
					if(allProducts.isEmpty())
					{
						out.println("<span style='margin-left:40%;'>Products Not Found</span>");
					}
					else
					{
						for(ProductsModel product : allProducts)
						{
							out.println("<div class='product mb-4'>");
							out.println("<div class='row align-items-center'>");
							out.println("<div class='col-sm-4'>");
							out.println("<div class='product-thumb position-relative text-center'>");
							out.println("<div class='overflow-hidden position-relative'>");
							out.println("<a href='product-single.jsp?productid="+product.getProductid()+"'><img class='img-fluid w-100 mb-3 img-first' style='object-fit: contain;max-height: 330px;' src='"+product.getImg1()+"' alt='product-img'>");
							out.println("<img class='img-fluid w-100 mb-3 img-second' style='object-fit: contain;max-height: 330px;' src='"+product.getImg2()+"' alt='product-img'> </a></div>");
							out.println("<div class='product-hover-overlay'>");
							out.println("<a href='#' onclick='workToWishlist("+product.getProductid()+",this)' class='product-icon favorite' data-toggle='tooltip' data-placement='left' title='Wishlist'>");
							ConsumersModel consumer = (ConsumersModel)(session.getAttribute("consumer"));
							if(consumer!=null)
							{
								if(new WishlistsModel().isPresent(consumer.getConsumerid(), product.getProductid()))
								{
									out.println("<i class='fa fa-heart'  aria-hidden='true'></i>");
								}
								else
								{
									out.println("<i class='ti-heart'></i>");
								}
							}
							else
							{
								out.println("<i class='ti-heart'></i>");
							}
							out.println("</a>");
							// <a data-vbtype='inline' href='#quickView' class='product-icon view venobox vbox-item' style='top: 70px;' data-toggle='tooltip' data-placement='left' title='Quick View'><i class='ti-search'></i></a>
							out.println("</div></div></div>");	
							out.println("<div class='col-sm-8'>");
							out.println("<div class='product-info'><h3 class='mb-md-4 mb-3'><a class='text-color' href='product-single.jsp?productid="+product.getProductid()+"'>"+product.getProductname()+"</a></h3>");			
							out.println("<p class='mb-md-4 mb-3'>" + product.getDescription() + "</p>");
							out.println("<span class='h4'><span style='font-size: 23px;'>&#x20B9;</span>"+product.getPrice()+"</span>");				 		
							out.println("<ul class='list-inline mt-3'><li class='list-inline-item'><a href='#' class='btn btn-dark btn-sm'>Add To Favorite</a></li>");
							out.println("<li class='list-inline-item'><form action='CartsController.do' method='post'>");
							if(consumer!=null)
							{
								out.println("<input type='hidden' name='consumerid' value='"+consumer.getConsumerid()+"'>");
							}
							out.println("<input type='hidden' name='caller' value='main'>");
							out.println("<input type='hidden' name='productid' value='"+product.getProductid()+"'>");
							out.println("<button name='btn' value='add item' class='btn btn-primary btn-sm'>Add To Cart</button></form></li></ul></div></div></div>");
						//	out.println("<li class='list-inline-item'><a href='#' class='btn btn-primary btn-sm'>Add To cart</a></li></ul></div></div></div>");
							out.println("<div class='product-label sale'>-8%</div></div>");
						}	
					}
					
				}
			}
		}
	}
	if(request.getParameter("consumerid")!=null)
	{
		int consumerid = Integer.parseInt(request.getParameter("consumerid"));
		int cartid = new CartModel().getActiveCartidByConsumerid(consumerid);
		ArrayList<ProductsModel> products = new ProductsModel().getAllProductsOfCartItemsByConsumerid(consumerid);
		if(products.isEmpty())
		{
			out.println("<div style='max-height: 200px;width: 100%;'>");
			out.println("<ul class='pl-0 mb-3'>");
			out.println("<li class='text-center'>");
			out.println("<p>Your cart is empty</p>");
			out.println("<p>Please add some products to cart to buy products");
			out.println("<a href='shop.jsp' class='btn btn-dark btn-mobile rounded-0' style='margin-top:20px;'>Go to Shopping</a>");
			out.println("</li>");
			out.println("</ul>");
			out.println("</div>");
		}
		else
		{
			out.println("<div style='overflow-y: scroll;max-height: 200px;width: 100%;'>");
			out.println("<ul class='pl-0 mb-3'>");
			for(ProductsModel product : products)
			{
				out.println("<li class='d-flex border-bottom'><div style='width:20%; height:70px;'><img class='img-fluid' style='width: 100%; height: 100%;' src='"+product.getImg1()+"' alt='product-img'></div>");
				out.println("<div class='mx-3'><h6>"+product.getProductname()+"</h6><span>"+(new CartItemsModel().getCartItemsByProduct(product.getProductid(),cartid)).getQuantity()+"</span> X <span><span style='font-size: 18px;'>&#x20B9;</span>"+product.getPrice()+"</span></div>");
				out.println("<form action='CartsController.do' method='post'>");
				out.println("<input type='hidden' name='caller' value='shop'>");
				out.println("<input type='hidden' name ='productid' value='"+product.getProductid()+"'>");
				out.println("<input type='hidden' name ='consumerid' value='"+consumerid+"'>");
				out.println("<i><button style='border: 0px; background-color: white;' class='ti-close' name='btn' value='delete item'></button></i></form>");
				out.println("</li>");
			}
			out.println("</ul>");
			out.println("</div>");
			out.println("<div class='mb-3' style='padding-top: 30px;'><span>Cart Total</span> <span class='float-right'><span style='font-size: 18px;'>&#x20B9;</span>"+ (new CartModel().getActiveCartByCartid(cartid)).getSubtotal() +"</span></div>");
			out.println("<div class='text-center'>");
			out.println("<a href='cart.jsp' class='btn btn-dark btn-mobile rounded-0'>view cart</a>");
			out.println("<a href='shipping.jsp' class='btn btn-dark btn-mobile rounded-0'>check out</a></div>");
		}
	}
 	if(request.getParameter("updatecart")!=null)
	{
		int cartid = new CartModel().getActiveCartidByConsumerid(Integer.parseInt(request.getParameter("consumerid")));
		int productid = Integer.parseInt(request.getParameter("productid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		CartItemsModel cartitem = new CartItemsModel();
		cartitem.setCartid(cartid);
		cartitem.setProductid(productid);
		cartitem.setQuantity(quantity);
		if(new CartItemsDao().updateCartItems(cartitem))
		{
			if(new CartDao().updateCartOfConsumer(Integer.parseInt(request.getParameter("consumerid"))))
			{
				out.println("Updated");
			}
		}
		else
		{
			out.println("Not Updated");
		}
	} 
 	if(request.getParameter("branchid")!=null)
 	{
 		query = "SELECT * FROM products WHERE productid IN (SELECT productid FROM stock WHERE productid IN (SELECT productid FROM cartitems WHERE cartitemid IN (SELECT cartitemid FROM cartitems WHERE cartid = ?)) AND branchid=?)";
 		PreparedStatement pstmt = connection.prepareStatement(query);
 		pstmt.setInt(1, Integer.parseInt(request.getParameter("cartid")));
 		pstmt.setInt(2, Integer.parseInt(request.getParameter("branchid")));
		ResultSet productResult = pstmt.executeQuery();
		int count = 0,total=0;
		while (productResult.next()) {
			CartItemsModel cartitem = new CartItemsModel().getCartItemsByProduct(productResult.getInt("productid"),Integer.parseInt(request.getParameter("cartid")));
			int ProductStockOfBranch = new StockModel().getProductStock(Integer.parseInt(request.getParameter("branchid")), cartitem.getProductid());
				out.println("<tr>");
					out.println("<td>");
					out.println("<input type='hidden' name='ProductStockOfBranch' value='" + ProductStockOfBranch + "' >");
					out.println("<div class='product-info' Productidstyle='width: 100px; height: 100px;'>");
						out.println("<input type='hidden' name='ProductPrice' value='" + productResult.getInt("price") + "' >");
						out.println("<img class='img-fluid img-sm img-thumbnail' style='width: 100%; height: 100%;' src='"+ productResult.getString("img1") +"' alt='product-img' />");
					out.println("</div>");
					out.println("</td>");
					out.println("<td>");
						out.println("<div class='product-info' style='width: 250px; height: 100px;'>");
						out.println("<a href='product-single.jsp?productid="+productResult.getInt("productid")+"'>"+productResult.getString("productname")+"</a>");
						out.println("<input type='hidden' name ='productids' value='"+productResult.getInt("productid")+"' >");	
						out.println("</div>");
					out.println("</td>");
					out.println("<td><span style='font-size: 18px;'>&#x20B9;</span>"+productResult.getInt("price")+"</td>");
					out.println("<td><input type='text' value='"+ cartitem.getQuantity() +"' onchange='gettotal("+productResult.getInt("price")+","+ count +","+productResult.getInt("productid")+")' name='cart-quantity'></td>");
					out.println("<td><label name='subtotal'><span style='font-size: 18px;'>&#x20B9;</span>"+ cartitem.getTotal() +"</label></td>");
				out.println("</tr>");
			total +=  cartitem.getTotal();
			count++;
		}
		if(count==0)
		{
			out.println("<tr><td colspan='6' class='text-center'>Any of products of your cart is not available in selected branch.<br> Please select other branch</td></tr>");
		}
		else
		{
		out.println("<tr><td colspan='4' class='text-right h4 font-weight-bold'>Grand Total </td>");
		out.println("<td colspan='2' class='text-center h4 font-weight-bold'><span id='subtotal' class='h4 font-weight-bold'>&#x20B9;"+total+"</span></td></tr>");
		ConsumersModel consumer = (ConsumersModel)(session.getAttribute("consumer"));
		out.println("<input type='hidden' name ='consumerid' value='"+ consumer.getConsumerid()+"'>");
		out.println("<input type='hidden' id='totalitems' value='"+count+"'>");
		}
 	}
	 
	%>
	<script>
	function gettotal(price,item,productid)
	{
		var total = 0;
		var totalitems = document.getElementById('totalitems');
		var quantity = document.getElementsByName('cart-quantity');
		var ProductStockOfBranch = document.getElementsByName('ProductStockOfBranch');
		for(let i=0;i<totalitems.value;i++)
		{
			if(i==item)
			{
				if(parseInt(quantity[i].value) == 0)
				{
					alert("Quantity must be greater than 0");
					document.getElementsByName('cart-quantity')[i].value = 1;
				}
				if(quantity[i].value > parseInt(ProductStockOfBranch[i].value) - 4)
				{
					alert("Only " + (parseInt(ProductStockOfBranch[i].value) - 4) + " Stock Available at this Branch");
					document.getElementsByName('cart-quantity')[i].value = parseInt(ProductStockOfBranch[i].value) - 4;
				}
				var subtotal = price * quantity[i].value;
				document.getElementsByName('subtotal')[i].innerHTML = "<span style='font-size: 18px;'>&#x20B9;</span>"+subtotal;
				var consumerid = document.getElementsByName('consumerid');
			
				$.ajax({
					url : "filter.jsp",
					method : "GET",
					data : {
						updatecart : "updatecart",
						consumerid : consumerid[0].value,
						productid : productid,
						quantity : quantity[i].value
					},
					success : function(data) {
					}
				});
			}
		}	
	 	var subtotal = document.getElementsByName('subtotal');
		for(let i=0;i<subtotal.length;i++)
		{
			total = total + parseInt(((subtotal[i].innerHTML).split("</span>"))[1]);
		}
		document.getElementById('subtotal').innerHTML = "<span class='h4 font-weight-bold'>&#x20B9;</span>"+total;
	 
	}
	function workToWishlist(productid,ed)
	{
		var action = ed.innerHTML.split('class="')[1].split('">')[0];
		if(action == "ti-heart")
		{
			var consumerid = document.getElementsByName('consumerid');
			if(consumerid.length > 0)
			{
				$.ajax({
					url : "WishlistsController.do",
					method : "Post",
					data : {
						btn : 'add item',
						consumerid : consumerid[0].value,
						productid : productid
					},
					success : function(data) {
						console.log(data);
						ed.innerHTML = "<i class='fa fa-heart'  aria-hidden='true'></i>";
					}
				});
				
			}
			else
			{
				alert("Login Required")
				window.location.href="login.jsp";
			}
		}
		else
		{
			var consumerid = document.getElementsByName('consumerid');
			if(consumerid.length > 0)
			{
				$.ajax({
					url : "WishlistsController.do",
					method : "Post",
					data : {
						btn : 'delete item',
						consumerid : consumerid[0].value,
						productid : productid
					},
					success : function(data) {
						console.log(data);
						ed.innerHTML = "<i class='ti-heart'></i>";
					}
				});
			}
			else
			{
				alert("Login Required")
				window.location.href="login.jsp";
			}
		}
		
		
	}
	</script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="js/script.js"></script> 
	</body>
</html>
function searchAdmin() {
	var search = document.getElementById("searchInAdmin").value;
	if(search.includes("dashboard"))
	{
		window.location.href = "admin-dashboard.jsp";
	}
	else if(search.includes("addproduct")||search.includes("add product"))
	{
		window.location.href = "admin-addproduct.jsp";
	}
	else if(search.includes("products")||search.includes("product"))
	{
		window.location.href = "admin-products.jsp";
	}
	else if(search.includes("categories")||search.includes("category"))
	{
		window.location.href = "admin-categories.jsp";
	}
	else if(search.includes("subcategories")||search.includes("subcategory")||search.includes("sub"))
	{
		window.location.href = "admin-subcategories.jsp";
	}
	else if(search.includes("orders")||search.includes("order"))
	{
		window.location.href = "admin-orders.jsp";
	}
	else if(search.includes("add staff")||search.includes("add staffmember"))
	{
		window.location.href = "admin-addstaff.jsp";
	}
	else if(search.includes("staff")||search.includes("staffmember"))
	{
		window.location.href = "admin-staff.jsp";
	}
	else if(search.includes("addbranch")||search.includes("add branch"))
	{
		window.location.href = "admin-addbranch.jsp";
	}
	else if(search.includes("branches")||search.includes("branch"))
	{
		window.location.href = "admin-branches.jsp";
	}
	else if(search.includes("transactions")||search.includes("transaction"))
	{
		window.location.href = "admin-transactions.jsp";
	}
	else if(search.includes(" addconsumer")||search.includes("add consumer"))
	{
		window.location.href = "admin-addconsumer.jsp";
	}
	else if(search.includes("consumers")||search.includes("consumer"))
	{
		window.location.href = "admin-consumers.jsp";
	}
	else if(search.includes("reviews")||search.includes("review")||search.includes("feedbacks")||search.includes("feedback"))
	{
		window.location.href = "admin-reviews.jsp";
	}
	else if(search.includes("addbrand")||search.includes("add brand"))
	{
		window.location.href = "admin-addbrand.jsp";
	}
	else if(search.includes("brands")||search.includes("brands"))
	{
		window.location.href = "admin-brands.jsp";
	}
}

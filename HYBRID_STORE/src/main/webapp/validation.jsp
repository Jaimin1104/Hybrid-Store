<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.StaffModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean isSuccess = false;
		ArrayList<ConsumersModel> allconsumers = new ConsumersModel().getAllConsumers();
		ArrayList<StaffModel> allstaff = new StaffModel().getAllStaff();
		ArrayList<AdminModel> alladmin = new AdminModel().getAllAdmin();
		System.out.println("Username Request : "+ request.getParameter("username"));
		if(request.getParameter("username")!=null)
		{
			String username = request.getParameter("username");
			for(ConsumersModel consumer : allconsumers)
			{
				if(username.equals(consumer.getUsername()))
				{
					isSuccess = true;
					break;
				}
			}
			if(!isSuccess)
			{
				for(StaffModel staff : allstaff)
				{
					if(username.equals(staff.getUsername()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			if(!isSuccess)
			{
				for(AdminModel admin : alladmin)
				{
					if(username.equals(admin.getUsername()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			out.println(isSuccess);
		}
		else if(request.getParameter("email")!=null)
		{
			String email = request.getParameter("email");
			for(ConsumersModel consumer : allconsumers)
			{
				if(email.equals(consumer.getEmail()))
				{
					isSuccess = true;
					break;
				}
			}
			if(!isSuccess)
			{
				for(StaffModel staff : allstaff)
				{
					if(email.equals(staff.getEmail()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			if(!isSuccess)
			{
				for(AdminModel admin : alladmin)
				{
					if(email.equals(admin.getEmail()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			out.println(isSuccess);
		}
		else if(request.getParameter("password")!=null && request.getParameter("loginUsername")!=null)
		{
			String username = request.getParameter("loginUsername");
			String password = request.getParameter("password"); 
			for(ConsumersModel consumer : allconsumers)
			{
				if(username.equals(consumer.getUsername()) && password.equals(consumer.getPassword()))
				{
					isSuccess = true;
					break;
				}
			}
			if(!isSuccess)
			{
				for(StaffModel staff : allstaff)
				{
					if(username.equals(staff.getUsername()) && password.equals(staff.getPassword()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			if(!isSuccess)
			{
				for(AdminModel admin : alladmin)
				{
					if(username.equals(admin.getUsername()) && password.equals(admin.getPassword()))
					{
						isSuccess = true;
						break;
					}
				}
			}
			out.println(isSuccess);
		}
	%>
</body>
</html>
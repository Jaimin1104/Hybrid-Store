<%@page import="hybridstore.model.AdminModel"%>
<%@page import="hybridstore.model.ConsumersModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html lang="en">

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:42 GMT -->

	<head>  
	    <%@ include file="admin-head.jsp" %>
	    <script>
	        $(document).ready(function() {
	            $("#admin-consumers").addClass("active");
	        });
	    </script>
	</head>

	<body>
	
	    <%@ include file="admin-aside-bar.jsp"%>
	
    	<main class="main-wrap">

			<header class="main-header navbar">
                <div class="col-search">
                    <form class="searchform">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search here..." id="searchInAdmin">
                            <button class="btn btn-light bg" type="button" id="searchBtn" onclick="searchAdmin()"> 
                                <i class="material-icons md-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-nav">
                    <button class="btn btn-icon btn-mobile me-auto" data-trigger="#offcanvas_aside">
                        <i class="md-28 material-icons md-menu"></i>
                    </button>
                    <ul class="nav">
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link btn-icon" onclick="darkmode(this)" title="Dark mode" href="#"> 
                                <i class="material-icons md-nights_stay"></i>
                            </a>
                        </li>
                        <li class="nav-item" style="margin-right: 7px;">
                            <a class="nav-link" href="admin-profile.jsp">
<%
	AdminModel admin = (AdminModel) (session.getAttribute("admin"));
	if(admin.getProfilepicture()==null || admin.getProfilepicture().equalsIgnoreCase("(null)"))
	{
%>
                            	<img class="img-xs rounded-circle" src="../images/default.png" alt="User">
<%
	}
	else
	{
%>
								<img class="img-xs rounded-circle" src="../<%= admin.getProfilepicture() %>" alt="User">
<%
	}
%>
                            </a>
                        </li>
                        <li class="w-25">
							<a href="../LoginController?action=logout" class="btn btn-outline-primary">Logout</a>
						</li>
                    </ul>
                </div>
            </header>

            <section class="content-main">
            	<div class="content-header">
                	<h2 class="content-title">Consumers</h2>
                    <div>
                        <a href="#" class="btn btn-outline-danger" style="display: none;" onclick="deleteConsumers()" id="deleteconsumers">&times; Discard</a>
                        <a href="admin-addconsumer.jsp" class="btn btn-primary">
                        	<i class="material-icons md-plus"></i> Add new
                        </a>
             		</div>
             	</div>
                <div class="card mb-4">
                <!--
                	<header class="card-header">
                		<div class="row align-items-center">
                			<div class="col col-check flex-grow-0">
								<div class="form-check ms-2">
									<input class="form-check-input" type="checkbox" value="">
								</div>
							</div>
                        	<div class="col-md-3 col-12 me-auto mb-md-0 mb-3">
                        		<select class="form-select">
									<option>All category</option>
									<option>Electronics</option>
									<option>Clothes</option>
									<option>Automobile</option>
								</select>
							</div>
                            <div class="col-md-2 col-6">
                            	<input type="date" class="form-control">
                            </div>
                            <div class="col-md-2 col-6">
                            	<select class="form-select">
									<option>Status</option>
									<option>Active</option>
									<option>Disabled</option>
									<option>Show all</option>
								</select>
							</div>
						</div>
					</header>
				-->
                    <!-- card-header end// -->

                    <div class="card-body">
                    	<article class="itemlist" style="position: sticky;">
                        	<div class="row align-items-center">
                                <div class="col col-check flex-grow-0">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="myCheck" onchange="selectAllCheckbox(this)">
                                    </div>
                                </div>
                                <div  class='col-lg-2 col-sm-2 col-2 flex-grow-1 col-name'>
                                    <span style="color: gray;">Profile</span>
                                </div>
                                <div class="col-lg-2 col-sm-2 col-4 col-price">
                                    <span style="color: gray;">Full Name</span>
                                </div>
                                <div class="col-lg-2 col-sm-2 col-4 col-status">
                                    <span style="color: gray;">Email</span>
                                </div>
                                <div class="col-lg-2 col-sm-2 col-4 col-date">
                                    <span style="color: gray;">Contact</span>
                                </div>
                                <div class="col-lg-1 col-sm-2 col-4 col-action">
                                    <div class="dropdown float-end">
                                        <span style="color: gray;">Action</span>
                                    </div>
                                    <!-- dropdown // -->
                                </div>
                            </div>
                            <!-- row .// -->
                        </article>
                        
                        <input type="hidden" id="numberOfConsumers" value="<%= new ConsumersModel().getTotalConsumers() %>">
						<span id="displayPageConsumers"></span>

						<nav class="float-end mt-4" aria-label="Page navigation">
                            <ul class="pagination">
                            </ul>
						</nav>
                   	</div>
                   <!-- card-body end// -->
               </div>
                <!-- card end// -->
                
                <div class="modal fade" id="confirmDeletes" tabindex="-1" aria-labelledby="exampleModalPromoLabel2" aria-hidden="true" data-tor-parent="show">
                   <div class="modal-dialog  modal-dialog-centered no-transform">
                       <div class="modal-content" data-tor="show(p):{scale.from(75) fade.in} quad">
                           <div class="modal-header">
                               <h5 class="modal-title" id="exampleModalPromoLabel2">Delete Consumer</h5>
                               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>
                           <div class="modal-body">
                               <p>Are you sure?</p>
                           </div>
                           <div class="modal-footer">
                               <form method="post" action="../ConsumersController">
                                   <span id="ConsumerIds"></span>
                                   <button type="submit" name="btn" value="delete Consumers" class="btn mb-2 btn-danger">Delete</button>
                                   <button type="submit" data-bs-dismiss="modal" class="btn mb-2 btn-primary">Close</button>
                               </form>
                           </div>
                       </div>
                   </div>
                </div>
            </section>
            <!-- content-main end// -->

        </main>
	
	    <script type="text/javascript">
	        const ids = [];
	        var numberOfRecords = document.getElementById("numberOfConsumers").value;
			var numberOfPagesRequired = Math.ceil(numberOfRecords/10);
			var maximumRecordsPerPage = 10;
			var currentPage = 1;
			var caller = 'consumers';
			
			window.onload = function() {
				console.log(caller);
				var pagination = document.getElementsByClassName("pagination");
				var previousElement = "<li id='previous' class='page-item'><a class='page-link' onclick='displayPreviousPage()' href='#'>Previous</a></li>";
				var nextElement = "<li id='next' class='page-item'><a class='page-link' onclick='displayNextPage()' href='#'>next</a></li>";
				pagination[0].innerHTML = previousElement;
				for(let i=1;i<=numberOfPagesRequired;i++)
				{
					var pageElement = "<li class='page-item'><a class='page-link' onclick='displayRecords(this)' href='#'>"+i+"</a></li>";
					pagination[0].innerHTML += pageElement;
				}
				pagination[0].innerHTML += nextElement;
				var allPages = document.getElementsByClassName("page-item");
				for(let i=0;i<allPages.length;i++)
				{
					var pages = parseInt(allPages[i].innerText);
					if(pages == currentPage)
					{
						allPages[i].className += " active";
					}
				}
				checkPreviousNextPage();
				console.log("currentPage : " + currentPage);
				fetchrecords(caller,currentPage);
			}
	
	        if (localStorage.getItem("darkmode")) {
	            var body_el = document.body;
	            body_el.className += "dark";
	        }
	        
	        var searchInAdmin = document.getElementById("searchInAdmin");
			// Execute a function when the user releases a key on the keyboard
			searchInAdmin.addEventListener("keypress", function(event) {
			  // Number 13 is the "Enter" key on the keyboard
			  if (event.keyCode === 13) {
			    // Cancel the default action, if needed
			    event.preventDefault();
			    // Trigger the button element with a click
			    document.getElementById("searchBtn").click();
			  }
			});
	
	        function deleteConsumer(consumerid) {
	            $("#confirmDeletes").modal('show');
	            var txt1 = "<input type=\"hidden\" id=\"consumerid\" name=\"consumerids\" value=\"" + consumerid + "\"></input>";
	            $("#ConsumerIds").append(txt1);
	        }
	
	        function removeConsumers(id) {
	            var deleteConsumers = document.getElementById("deleteconsumers");
	            var index = ids.indexOf(id);
	            if (index === -1) {
	                ids.push(id);
	            }
	            else {
	                var del = ids.splice(index, 1);
	            }
	            
	            if (ids.length > 0) {
	                deleteConsumers.style.display = "inline-block";
	            }
	            else {
	                deleteConsumers.style.display = "none";
	            }
	
	            var selectall = document.getElementById("myCheck");
	            var numberOfConsumers = document.getElementsByName("consumers");
	            if (ids.length == numberOfConsumers.length) {
	                selectall.checked = true;
	            }
	            else {
	                selectall.checked = false;
	            }
	        }
	
	        function deleteConsumers() {
	            $("#confirmDeletes").modal('show');
	            for (var i = 0; i < ids.length; i++) {
	                var txt1 = "<input type=\"hidden\" id=\"consumerid\" name=\"consumerids\" value=\"" + ids[i] + "\">";
	                $("#ConsumerIds").append(txt1);
	            }
	        }
	
	        function selectAllCheckbox(cb) {
	            var deleteConsumers = document.getElementById("deleteconsumers");
	            var allIds = document.getElementsByName('consumerid');
	            if (cb.checked) {
	                while (ids.length) {
	                    ids.pop();
	                }
	                for (var i = 0; i < allIds.length; i++) {
	                    var a = parseInt(allIds[i].value);
	                    ids.push(a);
	                }
	                deleteConsumers.style.display = "inline-block";
	            }
	            else {
	                while (ids.length) {
	                    ids.pop();
	                }
	                deleteConsumers.style.display = "none";
	            }
	            $('body input[type="checkbox"]').prop('checked', cb.checked);
	        }

	        function fetchrecords(caller, pagenumber) {
	            console.log("Caller : " + caller);
	            console.log("Pagenumber : " + pagenumber);
	        	var request = new XMLHttpRequest();
	        	var url="admin-pagination.jsp?caller=" + caller + "&pagenumber=" + pagenumber;  
	          	try
	          	{  
	        		request.onreadystatechange=function()
	        		{  
	        			if(request.readyState==4)
	        			{  
	        				var val=request.responseText;
	        				document.getElementById('displayPageConsumers').innerHTML=val;
	        			}  
	        		}  
	        		request.open("GET",url,true);  
	        		request.send();
	        	}
	          	catch(e)
	          	{
	          		alert("Unable to connect to server");
	          	}  
	        }
	        <%@ include file="js/pagination.js" %>
	    </script>
	
	    <script src="js/bootstrap.bundle.min.js"></script>
	    <script src="js/jquery-3.5.0.min.js"></script>
	    <!-- Custom JS -->
	    <script src="js/search.js"></script>
	    <script src="js/scriptc619.js?v=1.0"></script>
	</body>

<!-- Mirrored from www.ecommerce-admin.com/demo/page-products-list.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 16 Dec 2021 12:44:43 GMT -->

</html>
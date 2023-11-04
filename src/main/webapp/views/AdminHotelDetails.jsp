<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<jsp:include page="includes/header.jsp" />  
	
<jsp:include page="includes/adminNav.jsp" />  


    <!-- Page Content  -->
    <div>
        <div>
            <p>Welcome 
            <% if(session.getAttribute("Admin_gender").equals("male")){ %> 
                Mr.
            <% } else { %> 
                Miss.
            <% } %> 
            <span style="color:black;font-weight:bold">${Admin_firstname} ${Admin_lastname}</span></p>
        </div>
   

        <style>
            .form-control:focus {
              border-color: #ced4da; /* Reset the border color to the default */
              box-shadow: none; /* Remove the box shadow */
          }
          .text-center {
text-align: center;
display: flex;
justify-content: center;
align-items: center;

}

.search-container {
display: flex;
align-items: center;
}

.search-input {
flex: 1; /* Grow to fill available space */
margin-right: 10px; /* Add some spacing between input and button */
}

.search-button {
flex: 0; /* Don't grow, maintain its own size */
}



          </style>

<form  action="/adminhotelSearch"  method="post" autocomplete="off">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    <div class="text-center">
        <div class="search-container">
         
            <input class="form-control search-input" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${hotel_keyword}">
            <button class="btn btn-dark search-button" type="submit" name="search">Search</button>
        </div>
    </div>
</form>





 



     <!-- Add User modal -->
     <div class="modal fade" id="AddhotelModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Hotel</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/addhotelForm" modelAttribute="hotelForm"  method="POST" enctype= "multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="subadmin" value="not"/>
				<input type="hidden" name="superadmin" value="not"/>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Name:</label>
                        <input type="text" class="form-control" placeholder="Hotel Name" name="hotelName" id="hotelName" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Description</label>
						<textarea class="form-control" name="hotelDesc" placeholder="Hotel Description" id="hotelDesc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Image:</label>
                        <input type="file" class="form-control" name="hotelImg1" id="hotelImg1" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Price:</label>
						<input  class="form-control"  type="text" name="price"  placeholder="Hotel Price" id="price" required>
                    </div>
                   
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Hotel Location:</label>
						<textarea class="form-control" name="location" placeholder="Hotel Location" id="location"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
<button type="submit" class="btn btn-dark" name="addhotel" style="background-color: black; color: white;">Add Hotel</button>

                </div>
            </form>
            </div>
        </div>
        </div>

</div>

<br />
<br/>



        <div class="table-responsive">
            <table class="content-table table" id="table-id">
                <thead>
                    <tr>
                    <th>HOTEL NAME</th>
                    <th>HOTEL DESCRIPTION</th>
                    <th>HOTEL IMAGE</th>
                    <th>HOTEL PRICE</th>
                    <th>LOCATION</th>
                    <th>ACTION</th>
                </tr>
            </thead>
                <tbody>
                	 <c:forEach var="allhotel" items="${Hotellist}" >
			            <tr>
			            <td>${allhotel.hotelName}</td>
			            <td>${fn:substring(allhotel.hotelDesc, 0, 100)}...  </td>
			           <td ><img src="data:image/jpeg;base64,${allhotel.hotelImg1}" class="rounded-circle" width="100" height="100"/></td>
			            <td>${allhotel.price}</td>
			            <td>${allhotel.location}</td>
                        <td class="d-flex">
                            <a class="btn btn-dark edit" data-toggle="modal" name="edit_user" data-target="#EdithotelModal" data-whatever="@mdo" style="background-color: black; color: white; margin-right: 10px;">EDIT</a>
<input type="hidden" value="${allhotel.id}" id="edit_id">
<a href="/admindeletehotel/${allhotel.id}" class="btn btn-dark" onclick='return deleteHotel()' style="background-color: black; color: white;">DELETE</a>


                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
                    
                </table> 
            </div>
            
            <div style="display: flex; justify-content: space-between;">
                <div>
                    <label style="color: black;">Select No. of rows to display:</label>
                    <select class="form-control" name="state" id="maxRows" style="width: 250px;">
                        <option value="5000" style="color: black;">Show ALL Rows</option>
                        <option value="5" style="color: black;">5</option>
                        <option value="10" style="color: black;">10</option>
                        <option value="15" style="color: black;">15</option>
                        <option value="20" style="color: black;">20</option>
                        <option value="50" style="color: black;">50</option>
                        <option value="70" style="color: black;">70</option>
                        <option value="100" style="color: black;">100</option>
                    </select>
                </div>

                <form >
                    <button type="button" class="btn btn-dark" name="add_hotel" data-toggle="modal" data-target="#AddhotelModal" data-whatever="@mdo" style="background-color: black; color: white;">Add Hotel</button>
            
                </form>
            
              
    </div>
    
     <!-- Edit User modal -->
			 <div class="modal fade" id="EdithotelModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/EdithotelForm" modelAttribute="hotelEditForm" method="POST" enctype= "multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<input type="hidden" name="subadmin" value="not"/>
							<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="id" id="hotel_id">
						<div class="modal-body">
		
							<div class="modal-body">

								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel Name:</label>
									<input type="text" class="form-control" placeholder="Hotel name" name="hotelName" id="hotelName1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel Description:</label>
									<input type="text" class="form-control" placeholder="Hotel Desc" name="hotelDesc" id="hotelDesc1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Hotel price:</label>
									<input type="text" class="form-control"  placeholder="hotel price Id" name="price" id="price1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Address:</label>
									<textarea class="form-control" name="location" placeholder="Hotel location" id="location1"></textarea>
								</div>
								<div class="form-group">
                       			 <label for="message-text" class="col-form-label">Hotel Image:</label>
                     		   <input type="file" class="form-control" name="hotelImg1" id="hotelImg11" >
                  			  </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
<button type="submit" class="btn btn-dark" name="EditHotel" style="background-color: black; color: white;">Edit Hotel</button>

						</div>
					</form>
					</div>
				</div>
				</div>
				
				
	<script type="text/javascript">
        $(document).ready(function() {
            $('table .edit').click(function ()
            {
				var id=$(this).parent().find('#edit_id').val();

				console.log(id)
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/hotelfind/"+id, //this is my servlet
                    data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                    success: function(allhotel){ 
                    		$('#EdithotelModal #hotel_id').val(allhotel.id);
                            $('#EdithotelModal #hotelName1').val(allhotel.hotelName);
							$('#EdithotelModal #hotelDesc1').val(allhotel.hotelDesc);
							$('#EdithotelModal #location1').val(allhotel.location);
							$('#EdithotelModal #price1').val(allhotel.price);
							$('#EdithotelModal #hotelImg11').val(allhotel.hotelImg1);
							
                    }
                });
            });

        });
    </script>
<jsp:include page="includes/footer.jsp" />  
<%}%>

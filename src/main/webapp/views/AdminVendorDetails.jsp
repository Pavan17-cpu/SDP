<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

          </style>
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
         
    


    <form action="/adminvendorSearch"  method="post" autocomplete="off">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
		<div class="text-center">
			<div class="search-container">
				<input class="form-control" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${vendor_keyword}">
        <button class="btn btn-dark" type="submit" name="search" style="background-color: black; color: white;">Search</button>
			</div>
		</div>
	</form>




  
    
       
    
    
   


     <!-- Add User modal -->
     <div class="modal fade" id="AddvendorModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Vendor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/addvendorForm" modelAttribute="vendorForm"  method="POST" enctype= "multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="subadmin" value="not"/>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">vendor Name:</label>
                        <input type="text" class="form-control" placeholder="Vendor Name" name="vendorname" id="vendorname" required>
                    </div>
                    <div class="form-group">
						 <label for="message-text" class="col-form-label">vendor Description</label>
                        <select id="vendor_desc" name="vendor_desc"  class="form-control" required>
							<option value="">Choose the Description</option>
							<option value="Photographer">Photographer</option>
							<option value="DJ">Disc Jockey</option>
							<option value="Makeupartisit">Makeup Artisit</option>
							<option value="Decorator">Decorator</option>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">vendor Image:</label>
                        <input type="file" class="form-control" name="vendor_img" id="vendor_img" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">vendor Price:</label>
						<input  class="form-control"  type="text" name="vendor_price"  placeholder="Vendor Price" id="vendor_price" required>
                    </div>
                   
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">vendor Location:</label>
						<textarea class="form-control" name="vendor_location" placeholder="Vendor Location" id="vendor_location"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
                    <button type="submit" class="btn btn-dark" name="addvendor" style="background-color: black; color: white;">Add vendor</button>
                    
                </div>
            </form>
            </div>
        </div>
        </div>

</nav>
<br/><br/>


    


        <div class="table-responsive">
            <table class="content-table table" id="table-id">
                <thead>
                    <tr>
                    <th>VENDOR NAME</th>
                    <th>VENDOR DESCRIPTION</th>
                    <th>VENDOR IMG</th>
                    <th>VENDOR PRICE</th>
                    <th>LOCATION</th>
                    <th>ACTION</th>
                </tr>
            </thead>
                <tbody>
                	 <c:forEach var="allvendor" items="${vendorlist}" >
			            <tr>
			            <td>${allvendor.vendorname}</td>
			            <td>${allvendor.vendor_desc}</td>
			           <td ><img src="data:image/jpeg;base64,${allvendor.vendor_img}" class="rounded-circle" width="100" height="100"/></td>
			            <td>${allvendor.vendor_price}</td>
			            <td>${allvendor.vendor_location}</td>
                        <td class="d-flex">
                            <a class="btn btn-dark edit" data-toggle="modal" name="edit_vendor" data-target="#EditvendorModal" data-whatever="@mdo" style="background-color: black; color: white; margin-right: 10px;">EDIT</a>
<input type="hidden" value="${allvendor.id}" id="edit_id">
<a href="/admindeletevendor/${allvendor.id}" class="btn btn-dark" onclick='return deleteVendor()' style="background-color: black; color: white;">DELETE</a>


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
                    <button type="button" class="btn btn-dark" name="add_vendor" data-toggle="modal" data-target="#AddvendorModal" data-whatever="@mdo" style="background-color: black; color: white;">Add vendor</button>
                </form>
             
            </div>
        </div>
    </div>
     <!-- Edit User modal -->
			 <div class="modal fade" id="EditvendorModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/EditvendorForm" modelAttribute="vendorEditForm" method="POST" enctype= "multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="superadmin" value="not"/>
						<input type="hidden" name="subadmin" value="not"/>
						<input type="hidden" name="id" id="vendor_id">
						<div class="modal-body">
		
							<div class="modal-body">

								<div class="form-group">
									<label for="message-text" class="col-form-label">vendor Name:</label>
									<input type="text" class="form-control" placeholder="vendorName" name="vendorname" id="vendorName1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">vendor Description:</label>
									<select id="vendorDesc1" name="vendor_desc"  class="form-control" required>
										<option value="">Choose the Description</option>
										<option value="Photographer">Photographer</option>
										<option value="DJ">Disc Jockey</option>
										<option value="Makeupartisit">Makeup Artisit</option>
										<option value="Decorator">Decorator</option>
									</select>								
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">vendor price:</label>
									<input type="text" class="form-control"  placeholder="vendor price Id" name="vendor_price" id="price1" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Address:</label>
									<textarea class="form-control" name="vendor_location" placeholder="vendor location" id="location1"></textarea>
								</div>
								<div class="form-group">
                       			 <label for="message-text" class="col-form-label">vendor Image:</label>
                     		   <input type="file" class="form-control" name="vendor_img" id="vendorImg11" >
                  			  </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
<button type="submit" class="btn btn-dark" name="Editvendor" style="background-color: black; color: white;">Edit vendor</button>

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
                    url: "${pageContext.request.contextPath}/vendorfind/"+id, //this is my servlet
                    data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                    success: function(allvendor){ 
                    		$('#EditvendorModal #vendor_id').val(allvendor.id);
                            $('#EditvendorModal #vendorName1').val(allvendor.vendorname);
							$('#EditvendorModal #vendorDesc1').val(allvendor.vendor_desc);
							$('#EditvendorModal #location1').val(allvendor.vendor_location);
							$('#EditvendorModal #price1').val(allvendor.vendor_price);
							$('#EditvendorModal #vendorImg11').val(allvendor.vendor_img);
							
                    }
                });
            });

        });
    </script>
    
<jsp:include page="includes/footer.jsp" />  
<%}%>

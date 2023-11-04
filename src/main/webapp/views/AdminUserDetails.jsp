<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:include page="includes/header.jsp" />  
	
	<jsp:include page="includes/adminNav.jsp" />  


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
    

	<form action="/adminuserSearch" method="post" autocomplete="off">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
		<div class="text-center">
			<div class="search-container">
				<input class="form-control search-input" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${user_keyword}">
				<button class="btn btn-dark search-button" type="submit" name="search">Search</button>
			</div>
		</div>
	</form>
	
	

       
		
	
        <!-- Add User modal -->
        <div class="modal fade" id="AdduserModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/adduserForm" modelAttribute="registerForm" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
                <div class="modal-body">

                    <div class="form-group">
                        <label for="message-text" class="col-form-label">First Name:</label>
                        <input type="text" class="form-control" placeholder="FirstName" name="FirstName" id="f_name" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Last Name:</label>
                        <input type="text" class="form-control" placeholder="LastName" name="LastName" id="L_Name" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Email Id:</label>
                        <input type="text" class="form-control"  placeholder="Email Id" name="email" id="email_id" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Phone Number:</label>
						<input  class="form-control"  type="tel" name="contactno" pattern="[6789][0-9]{9}" placeholder="Phone Number" id="contact" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Address:</label>
						<textarea class="form-control" name="Address" placeholder="Address" id="add"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Gender:</label>
                        <select id="gen" name="gender"  class="form-control" required>
							<option value="">Choose the Gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Password:</label>
                        <input id="pass" type="password" name="password" placeholder="Password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Confirm Password:</label>
                        <input id="passwordConfirmation" type="password" name="ConfirmPassword" placeholder="Confirm Pass" class="form-control" required>
                    </div>
					<div class="form-group">
						<label for="message-text" class="col-form-label">Role</label>
						<select id="job" name="role" class="form-control" required>
							<option value="">Choose the role</option>
							<option value="User">User</option>
							
						</select>
					</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
<button type="submit" class="btn btn-dark" name="adduser">Add User</button>

                </div>
            </form>
            </div>
        </div>
        </div>


    </div>
<br/><br/>



	
		    <div class="table-responsive">
		        <table class="content-table table" id="table-id">
		            <thead>
		                <tr>
		                    
		                    <th>FIRST NAME</th>
		                    <th>LAST NAME</th>
		                    <th>EMAIL ID</th>
		                    <th>GENDER</th>
		                    <th>CONTACT NO</th>
		                    <th>ADDRESS</th>
		                    <th>ROLE</th>
		                    <th>ACTION</th>
		                </tr>
		            </thead>
		                <tbody>
		                	 <c:forEach var="user" items="${Userlist}" >
					            <tr>
					            <td>${user.firstName}</td>
					            <td>${user.lastName}</td>
					            <td>${user.email}</td>
					            <td>${user.gender}</td>
					            <td>${user.contactno}</td>
					            <td>${user.address}</td>
					            <td>${user.role}</td>
					            <td class="d-flex">
					            	
							
									<a class="btn btn-dark edit" data-toggle="modal" name="edit_user" data-target="#EdituserModal" data-whatever="@mdo" style="background-color: black; color: white; margin-right: 10px;">EDIT</a>
									<input type="hidden" value="${user.id}" id="edit_id">
									<a href="/admindeleteuser/${user.email}" class="btn btn-dark" onclick='return deleteEvent()' style="background-color: black; color: white;">DELETE</a>

									
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
							<button type="button" class="btn btn-dark" name="add_user" data-toggle="modal" data-target="#AdduserModal" data-whatever="@mdo">Add User</button>
						</form>
					</div>
					

	
			 <!-- Edit User modal -->
			 <div class="modal fade" id="EdituserModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/EdituserForm" modelAttribute="userEditForm" method="POST">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="id" id="User_id">
						<div class="modal-body">
		
							<div class="modal-body">

								<div class="form-group">
									<label for="message-text" class="col-form-label">First Name:</label>
									<input type="text" class="form-control" placeholder="FirstName" name="FirstName" id="FirstName" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Last Name:</label>
									<input type="text" class="form-control" placeholder="LastName" name="LastName" id="LastName" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Email Id:</label>
									<input type="text" class="form-control"  placeholder="Email Id" name="email" id="email" required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Phone Number:</label>
									<input  class="form-control"  type="tel" name="contactno" id="contactno" pattern="[6789][0-9]{9}" placeholder="Phone Number"  required>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Address:</label>
									<textarea class="form-control" name="Address" placeholder="Address" id="Address"></textarea>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Gender:</label>
									<select id="gender" name="gender"  class="form-control" required>
										<option value="">Choose the Gender</option>
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">Role</label>
									<select id="role" name="role" class="form-control" required>
										<option value="">Choose the role</option>
										<option value="User">User</option>
										<option value="Admin">Admin</option>
										
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
<button type="submit" class="btn btn-dark" name="adduser">Edit User</button>

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
                    url: "${pageContext.request.contextPath}/userfind/"+id, //this is my servlet
                    data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                    success: function(user){      
                            $('#EdituserModal #User_id').val(user.id);
							$('#EdituserModal #FirstName').val(user.firstName);
							$('#EdituserModal #LastName').val(user.lastName);
							$('#EdituserModal #email').val(user.email);
							$('#EdituserModal #contactno').val(user.contactno);
							$('#EdituserModal #Address').val(user.address);
							$('#EdituserModal #gender').val(user.gender);
							$('#EdituserModal #role').val(user.role);
                    }
                });
            });

        });
    </script>
    <jsp:include page="includes/footer.jsp" />  
    <%}%>
    
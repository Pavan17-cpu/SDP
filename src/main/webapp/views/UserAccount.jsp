<% if (session.getAttribute("User_email") == null) {
    response.sendRedirect("/signin");
} else {%>

    <jsp:include page="includes/header.jsp" />

    <jsp:include page="includes/userNav.jsp" />
    <style>
        .form-control:focus {
          border-color: #ced4da; /* Reset the border color to the default */
          box-shadow: none; /* Remove the box shadow */
      }
      </style>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        Edit Profile
                    </div>
                    <div class="card-body">
                        <form action="EdituserProfile" modelAttribute="EdituserProfile" method="POST" autocomplete="off">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="id" value="${User_id}" />
                            <input type="hidden" name="password" value="${User_password}" />
                            <input type="hidden" name="confirmPassword" value="${User_cpassword}" />
                            <input type="hidden" name="role" value="${User_role}" />
                            <div class="form-group">
                                <label for="f_name" class="col-form-label">First Name:</label>
                                <input type="text" class="form-control" value="${User_firstname}" placeholder="FirstName" name="FirstName" id="f_name" required>
                            </div>
                            <div class="form-group">
                                <label for="L_Name" class="col-form-label">Last Name:</label>
                                <input type="text" class="form-control" value="${User_lastname}" placeholder="LastName" name="LastName" id="L_Name" required>
                            </div>
                            <div class="form-group">
                                <label for="email_id" class="col-form-label">Email Id:</label>
                                <input type="text" class="form-control" value="${User_email}" placeholder="Email Id" name="email" id="email_id" required>
                            </div>
                            <div class="form-group">
                                <label for="contact" class="col-form-label">Phone Number:</label>
                                <input class="form-control" type="tel" name="contactno" value="${User_phone}" pattern="[6789][0-9]{9}" placeholder="Phone Number" id="contact" required>
                            </div>
                            <div class="form-group">
                                <label for="add" class="col-form-label">Address:</label>
                                <input type="text" class="form-control" value="${User_address}" name="Address" placeholder="Address" id="add" />
                            </div>
                            <div class="form-group">
                                <label for="gen" class="col-form-label">Gender:</label>
                                <input type="text" id="gen" name="gender" value="${User_gender}" class="form-control" required>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-dark" name="edituser">EDIT</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="includes/footer.jsp" />
<%}%>

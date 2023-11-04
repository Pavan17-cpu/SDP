<jsp:include page="includes/header.jsp" />
<style>
    .form-control:focus {
      border-color: #ced4da; /* Reset the border color to the default */
      box-shadow: none; /* Remove the box shadow */
  }
  </style>
<section class="mt-5">
    <div class="container">
        <div class="row align-items-center my-5 justify-content-center"> <!-- Center align the row -->
            <!-- Reset password Form -->
            <div class="col-lg-6 col-md-12 col-sm-12 mt-5">
                <div class="login-form">
                    <form action="/reset_password" method="post" style="max-width: 350px;">
                        <input type="hidden" name="token" value="${token}" />
                        <h2 class="text-center mb-4">Reset Your Password</h2>
                        
                        <div class="form-group mt-3">
                            <label for="email">Enter new password:</label>
                            <div class="input-group">
                                <input type="password" name="password" id="password" class="form-control" placeholder="Enter your new password" required autofocus />
                            </div>
                        </div>

                        <div class="form-group mt-3">
                            <label for="email">Confirm new password:</label>
                            <div class="input-group">
                                <input type="password" class="form-control" placeholder="Confirm your new password" required oninput="checkPasswordMatch(this);" />
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Change Password" class="btn btn-dark" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
function checkPasswordMatch(fieldConfirmPassword) {
    if (fieldConfirmPassword.value != $("#password").val()) {
        fieldConfirmPassword.setCustomValidity("Passwords do not match!");
    } else {
        fieldConfirmPassword.setCustomValidity("");
    }
}
</script>
<jsp:include page="includes/footer.jsp" />

<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/homeNav.jsp" /> 

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
    function validateForm() {
        var response = grecaptcha.getResponse();
        if (response.length === 0) {
            alert("Please complete the CAPTCHA.");
            return false;
        }
        // The CAPTCHA was completed; you can proceed with form submission.
        return true;
    }
</script>


<style>
    /* Add your custom CSS styles here */
    body {
        background-color: #f8f9fa;
    }

    .navbar {
        margin-bottom: 20px;
    }

    .login-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login-form h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 5px;
        margin-bottom: 15px;
    }

    .login-btn {
        background-color: #000;
        border: none;
    }

    .login-btn:hover {
        background-color: #333;
    }

    .text-muted a {
        color: #000;
        text-decoration: none;
        border-bottom: 1px dashed #000;
    }

    .text-muted a:hover {
        text-decoration: none;
    }
    
    /* Additional styles for specific elements */
    .text-muted a.black {
        color: #000;
        text-decoration: underline;
    }
    
    .text-primary.ml-2,
    .text-primary.ml-2.black {
        color: #000;
        text-decoration: underline;
    }
    
    /* Center the form and card */
    .center-form {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
</style>


<style>
    /* Remove focus styles from form control */
    .form-control:focus {
        border-color: #ced4da; /* Reset the border color to the default */
        box-shadow: none; /* Remove the box shadow */
    }
</style>
<style>
    /* Remove focus styles from form control */
    .form-:focus {
        border-color: #ced4da; /* Reset the border color to the default */
        box-shadow: none; /* Remove the box shadow */
    }
</style>






<section class="mt-5">
    <div class="container">
        <div class="row align-items-center my-5 center-form">
            <!-- Registration Form -->
            <div class="col-lg-6 col-md-12 col-sm-12">
                <div class="login-form">
                    <form action="/login-validation" modelAttribute="loginForm" method="POST" onsubmit="return validateForm();">
                        <!-- Your form fields -->
                        <h2 class="text-center mb-4">Login</h2>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Email" required="required">
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Captcha:</label>
                            <center> <div class="g-recaptcha" data-sitekey="6Ld3P5MoAAAAACH0VWXU2HvZZ2KFtDoJWB6iIDMd"></div></center>
                        </div>
                      


                         <button type="submit" name="user_login" class="btn btn-dark login-btn btn-block">Login</button>
                       
                        

                        <div class="text-center w-100">
                            <p class="text-muted font-weight-bold">Forgot Password <a href="/forgot_password" ><span class="black">Click here!</span></a></p>
                        </div>

                        <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                            <div class="border-bottom w-100 ml-5"></div>
                            <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                            <div class="border-bottom w-100 mr-5"></div>
                        </div>
                    </form>

                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Don't have an account? <a href="signup" ><span class="black"></span>Sign up here!</span></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />

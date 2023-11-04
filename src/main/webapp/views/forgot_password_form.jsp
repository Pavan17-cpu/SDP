<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <!-- Include your CSS and JavaScript libraries here -->
    <style>
        /* Remove focus styling from the input field */
        .form-control:focus {
            border-color: #ced4da !important; /* Reset the border color to the default */
            box-shadow: none !important; /* Remove the box shadow */
        }

        /* Remove focus styling from the button */
        .btn:focus {
            outline: none !important; /* Remove the focus outline */
        }
        /* Remove focus styling from the button */
.btn:focus {
    outline: none !important;
    box-shadow: none !important;
}

    </style>
</head>
<body>
    <jsp:include page="includes/header.jsp" />

    <jsp:include page="includes/homeNav.jsp" /> 


    <section class="mt-5">
        <div class="container">
            <div class="row align-items-center my-5 justify-content-center">
                <div class="col-lg-6 col-md-12 col-sm-12 mt-5">
                    <div class="login-form">
                        <form action="/forgot_password" method="post" style="max-width: 420px; margin: 0 auto;">
                            <h2 class="text-center mb-4">Forgot Password</h2>
                            <c:if test="${error != null}">
                                <div class="text-center">
                                    <p class="text-danger">${error}</p>
                                </div>
                            </c:if>
                            <c:if test="${msg != null}">
                                <div class="text-center">
                                    <p class="text-warning">${msg}</p>
                                </div>
                            </c:if>

                            <div class="form-group mt-3">
                                <label for="email">Enter your email:</label>
                                <div class="input-group">
                                    <input type="email" name="email" class="form-control" id="email" placeholder="Enter your e-mail" required autofocus/>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="submit" value="Send" class="btn btn-block" style="background-color: black; border-color: black; color: white;" />
                            </div>

                            <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                                <div class="border-bottom w-100 ml-5"></div>
                                <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                                <div class="border-bottom w-100 mr-5"></div>
                            </div>
                        </form>

                        <div class="text-center w-100">
                            <p class="text-muted font-weight-bold"><a href="signup" class="black">Don't have an account? <span style="color: black;">Sign up here!</span></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="includes/footer.jsp" />
    <!-- Include your JavaScript libraries here -->
</body>
</html>

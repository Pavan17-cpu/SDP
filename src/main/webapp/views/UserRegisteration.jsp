<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/homeNav.jsp" /> 


<style>
  /* Add margin between form and navbar */
  .navbar {
    margin-bottom: 20px;
  }

  /* Style for buttons */
  .btn-primary {
    background-color: black;
    color: white;
    width: 100%;
    padding: 10px;
  }

  /* Style for making text black */
  .black-text {
    color: black;
    text-decoration: none;
  }

  /* Remove the blue outline on button focus and input focus */
  .btn-dark:focus,
  .form-control:focus {
    outline: none;
    box-shadow: none;
  }

  /* Hover effect (optional) */
  .black-text:hover {
    text-decoration: underline;
  }

  /* Style for textboxes */
  .form-control {
    border: 1px solid #ccc;
    width: 100%;
    padding: 10px;
  }

  /* Center the form on the page */
  .center-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: calc(100vh - 60px); /* Adjust as needed to account for navbar height */
    padding: 20px;
  }

  /* Style for the heading */
  .register-heading {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }

  /* Style for the eye icon button and square */
  .eye-icon, .input-group-text {
    cursor: pointer;
    color: black; /* Set eye button color to black */
  }

  /* Style for the white card */
  .card {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    width: 100%; /* Set card width to 100% */
    max-width: 600px; /* Limit card width */
    text-align: center;
  }

  /* Style for the "Already Registered?" text */
  .already-registered {
    color: black; /* Set text color to black */
  }

  /* Style for error messages */
  .error-msg {
    color: red;
    display: none;
  }
</style>
<style>
  .form-control:focus {
    border-color: #ced4da; /* Reset the border color to the default */
    box-shadow: none; /* Remove the box shadow */
}
</style>



<div class="center-form">
  <div class="card">
    <h2 class="register-heading">Register</h2>
    <form action="/registerForm" modelAttribute="registerForm" method="POST" onsubmit="return validateForm()">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <input type="hidden" name="role" value="User">

      <div class="mb-4">
        <label for="firstName" class="form-label">First Name:</label>
        <input id="firstName" type="text" name="FirstName" placeholder="First Name" class="form-control" required>
        <span class="error-msg" id="firstName-error">Enter your first name</span>
      </div>

      <div class="mb-4">
        <label for="lastName" class="form-label">Last Name:</label>
        <input id="lastName" type="text" name="LastName" placeholder="Last Name" class="form-control" required>
        <span class="error-msg" id="lastName-error">Enter your last name</span>
      </div>

      <div class="mb-4">
        <label for="email" class="form-label">Email:</label>
        <input id="email" type="email" name="email" placeholder="Email Address" class="form-control" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
        <span class="error-msg" id="email-error">Enter a valid email address</span>
      </div>

      <div class="mb-4">
        <label for="phoneNumber" class="form-label">Phone Number:</label>
        <input id="phoneNumber" type="tel" name="contactno" pattern="[6789][0-9]{9}" placeholder="Phone Number" class="form-control" required>
        <span class="error-msg" id="phoneNumber-error">Enter a valid phone number</span>
      </div>

      <div class="mb-4">
        <label for="floatingTextarea" class="form-label">Address:</label>
        <textarea class="form-control" name="Address" placeholder="Address" id="floatingTextarea" rows="4"></textarea>
      </div>

      <div class="mb-4">
        <label for="gender" class="form-label">Gender:</label>
        <select id="gender" name="gender" class="form-control" required>
          <option value="" disabled selected hidden>Choose your Gender</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>
        <span class="error-msg" id="gender-error">Select your gender</span>
      </div>

      <div class="mb-4">
        <label for="password" class="form-label">Password:</label>
        <div class="input-group">
          <input id="password" type="password" name="password" oninput="checkInputs();" placeholder="Password" class="form-control" required>
          <button type="button" class="btn btn-secondary eye-icon" onclick="togglePasswordVisibility('password')">
            <i class="fas fa-eye"></i>
          </button>
        </div>
        <span class="error-msg" id="password-error">Password must be at least 6 characters and include a capital letter and a symbol</span>
      </div>

      <div class="mb-4">
        <label for="confirm_password" class="form-label">Confirm Password:</label>
        <div class="input-group">
          <input id="confirm_password" type="password" oninput="checkInputs();" name="ConfirmPassword" placeholder="Confirm Password" class="form-control" required>
          <button type="button" class="btn btn-secondary eye-icon" onclick="togglePasswordVisibility('confirm_password')">
            <i class="fas fa-eye"></i>
          </button>
        </div>
        <span class="error-msg" id="confirm_password-error">Passwords don't match</span>
      </div>

      <div class="mb-4">
        <button type="submit" class="btn btn-dark btn-block py-2" name="adduser">
          <span class="font-weight-bold">Create your account</span>
        </button>
      </div>

      <div class="d-flex align-items-center my-4">
        <div class="border-bottom w-100"></div>
        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
        <div class="border-bottom w-100"></div>
      </div>

      

      <div class="text-center w-100">
        <p class="font-weight-bold"><span class="black"> Already Registered? <a href="signin" class="black-text">Login</span></p>
    </div>
    


    </form>
  </div>
</div>

<script>
  var password = document.getElementById("password"), confirm_password = document.getElementById("confirm_password");

  function checkInputs() {
    if (password.value != confirm_password.value) {
      confirm_password.setCustomValidity("Passwords Don't Match");
      document.getElementById("confirm_password-error").style.display = "block";
    } else {
      confirm_password.setCustomValidity('');
      document.getElementById("confirm_password-error").style.display = "none";
    }
  }

  password.onchange = validatePassword;
  confirm_password.onkeyup = validatePassword;

  function validatePassword() {
    const passwordValue = password.value;
    const capitalRegex = /[A-Z]/;
    const symbolRegex = /[$@!%*?&#]/;

    if (passwordValue.length < 6 || !capitalRegex.test(passwordValue) || !symbolRegex.test(passwordValue)) {
      password.setCustomValidity("Password must be at least 6 characters and include a capital letter and a symbol");
      document.getElementById("password-error").style.display = "block";
    } else {
      password.setCustomValidity("");
      document.getElementById("password-error").style.display = "none";
    }
  }

  function togglePasswordVisibility(inputId) {
    const input = document.getElementById(inputId);
    const icon = input.parentElement.querySelector('.eye-icon');

    if (input.type === "password") {
      input.type = "text";
      icon.innerHTML = '<i class="fas fa-eye-slash"></i>';
    } else {
      input.type = "password";
      icon.innerHTML = '<i class="fas fa-eye"></i>';
    }
  }

  function validateForm() {
    // Implement form-level validation here
    // Return false to prevent form submission if validation fails
    // You can use the individual input validation functions above and add more validation logic as needed

    // Example: Validate email
    const emailInput = document.getElementById("email");
    const emailError = document.getElementById("email-error");
    const isValidEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailInput.value);

    if (!isValidEmail) {
      emailInput.setCustomValidity("Enter a valid email address");
      emailError.style.display = "block";
      return false; // Prevent form submission
    }

    // Add more validation logic for other fields as needed

    return true; // Form is valid, allow submission
  }
</script>

<jsp:include page="includes/footer.jsp" />

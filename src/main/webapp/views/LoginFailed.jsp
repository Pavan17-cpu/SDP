<style>
  /* Style for the error message container */
  .error-message {
      text-align: center;
      margin-top: 50px;
  }

  /* Style for the "Entered Email or Password Is Invalid" message */
  #welcome {
      font-size: 24px;
      font-weight: bold;
      color: #FF5733; /* Red color for warning */
      margin-bottom: 10px;
  }

  /* Style for the "LOGIN FAILED" message */
  .login-failed {
      font-size: 36px;
      font-weight: bold;
      color: #FF3333; /* A darker shade of red */
  }
</style>

<!-- Error message container -->
<div class="error-message">
  <!-- "Entered Email or Password Is Invalid" message -->
  <h3 id="welcome">Entered Email or Password Is Invalid</h3>
  <!-- "LOGIN FAILED" message -->
  <h1 class="mt-2 login-failed">LOGIN FAILED</h1>
</div>

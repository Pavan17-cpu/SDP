<%if (session.getAttribute("User_email") == null) {response.sendRedirect("/signin"); } else {%> 
  <jsp:include page="includes/header.jsp" />  
  
  <nav class="navbar navbar-expand-md navbar-dark bg-black">
    <div class="container-fluid">
      <a class="navbar-brand" href="/userbookingdetails"><i class="fas fa-backward"></i> Back</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>
  
  <style>
    /* Custom styling for the "Payment Failed" message */
    .payment-failed-container {
        text-align: center;
        margin-top: 50px;
    }
  
    .payment-failed-icon {
        font-size: 48px;
        color: red;
    }
  
    .payment-failed-heading {
        font-size: 24px;
        font-weight: bold;
        color: red;
        margin-top: 10px;
    }
  </style>
  
  <div class="container mt-5">
      <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
              <div class="payment-failed-container">
                  <i class="fas fa-exclamation-circle payment-failed-icon"></i>
                  <h1 class="payment-failed-heading">Payment Failed</h1>
              </div>
          </div>
          <div class="col-md-3"></div>
      </div>
  </div>
  
  <jsp:include page="includes/footer.jsp" />  
  <%}%>
  
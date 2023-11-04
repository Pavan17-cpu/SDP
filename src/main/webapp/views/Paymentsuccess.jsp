<%if (session.getAttribute("User_email") == null) {response.sendRedirect("/signin"); } else {%> 
  <jsp:include page="includes/header.jsp" />  
  
  <jsp:include page="includes/userNav.jsp" />
  
  <style>
    /* Custom styling for the "Payment Success" message */
    .payment-success-container {
        text-align: center;
        margin-top: 50px;
    }
  
    .payment-success-icon {
        font-size: 48px;
        color: green;
    }
  
    .payment-success-heading {
        font-size: 24px;
        font-weight: bold;
        color: green;
        margin-top: 10px;
    }
  </style>
  
  <div class="container mt-5">
      <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
              <div class="payment-success-container">
                  <i class="fas fa-check-circle payment-success-icon"></i>
                  <h1 class="payment-success-heading">Payment Success</h1>
              </div>
          </div>
          <div class="col-md-3"></div>
      </div>
  </div>
  
  <jsp:include page="includes/footer.jsp" />  
  <%}%>
  
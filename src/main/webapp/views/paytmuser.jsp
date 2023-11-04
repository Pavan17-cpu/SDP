<% if (session.getAttribute("User_email") == null) {
    response.sendRedirect("/signin");
} else {%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/header.jsp" />

<jsp:include page="includes/userNav.jsp" />
<style>
    .form-control:focus {
        border-color: #ced4da;
        box-shadow: none;
    }
</style>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    Payment Details
                </div>
                <div class="card-body">
                    <form action="/pgredirect" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <div class="form-group">
                            <label for="ORDER_ID">Transaction Id</label>
                            <input id="ORDER_ID" tabindex="1" maxlength="20" size="20" value="" name="ORDER_ID"
                                autocomplete="off" class="form-control" placeholder="orderID" readonly>
                        </div>
                        <div class="form-group">
                            <label for="CUST_ID">Customer Id</label>
                            <input type="text" class="form-control" placeholder="Customer ID" value="${user_id}"
                                name="CUST_ID" readonly />
                        </div>
                        <div class="form-group">
                            <label for="INDUSTRY_TYPE_ID">Industry Type</label>
                            <input type="text" class="form-control" placeholder="INDUSTRY_TYPE_ID" value="Retail"
                                name="INDUSTRY_TYPE_ID" readonly />
                        </div>
                        <div class="form-group">
                            <label for="CHANNEL_ID">Channel ID</label>
                            <input type="text" class="form-control" placeholder="Channel" value="WEB" name="CHANNEL_ID"
                                readonly />
                        </div>
                        <div class="form-group">
                            <label for="TXN_AMOUNT">Total Amount</label>
                            <input type="text" class="form-control" placeholder="Amount" value="${amt}" name="TXN_AMOUNT"
                                readonly />
                        </div>
                        <button type="submit" class="btn btn-dark btn-block" name="adduser">
                            <span class="font-weight-bold">Pay</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
<%}%>

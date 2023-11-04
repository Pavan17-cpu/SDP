<jsp:include page="includes/header.jsp" />  

<jsp:include page="includes/homeNav.jsp"/>




<style>
  .carousel-item {
  height: 100vh;
  min-height: 300px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
</style>
<style>
  .form-control:focus {
    border-color: #ced4da; /* Reset the border color to the default */
    box-shadow: none; /* Remove the box shadow */
}
</style>

<!-- <section id="Carousel-Section " style="margin-top: -40px;">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="../assets/images/hotels/1.jpeg"  alt="First slide">
    	<div class="carousel-caption d-none d-md-block">
		    <h5>...</h5>
		    <p>...</p>
	  	</div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"  src="../assets/images/hotels/2.jpeg"  alt="Second slide">
	   	 <div class="carousel-caption d-none d-md-block">
		    <h5>...</h5>
		    <p>...</p>
	  	</div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100"src="../assets/images/hotels/3.jpeg" alt="Third slide">
    	<div class="carousel-caption d-none d-md-block">
		    <h5>...</h5>
		    <p>...</p>
	  	</div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../assets/images/catering/1.jpeg" alt="Third slide">
    	<div class="carousel-caption d-none d-md-block">
		    <h5>...</h5>
		    <p>...</p>
	  	</div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../assets/images/catering/2.jpeg" alt="Third slide">
    	<div class="carousel-caption d-none d-md-block">
		    <h5>...</h5>
		    <p>...</p>
	  	</div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
</section> -->


<header style="margin-top: -40px;">
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Set the background image for this slide in the line below -->
      <div class="carousel-item active" style="background-image: url('../assets/images/hotels/3.jpeg')">
        <div class="carousel-caption d-none d-md-block">
          
        </div>
      </div>
      <!-- Slide Two - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image:  url('../assets/images/index.jpg')">
       
        <div class="carousel-caption d-none d-md-block">
          
        </div>
      </div>
      <!-- Slide Three - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('../assets/images/hotels/2.jpeg')">
        <div class="carousel-caption d-none d-md-block">
          
        </div>
      </div>
       <!-- Slide four - Set the background image for this slide in the line below -->
       <div class="carousel-item" style="background-image: url('../assets/images/index2.jpg')">
        <div class="carousel-caption d-none d-md-block">
          
        </div>
      </div>
       <!-- Slide five - Set the background image for this slide in the line below -->
       <div class="carousel-item" style="background-image: url('../assets/images/hotels/3.jpeg')">
        <div class="carousel-caption d-none d-md-block">
         
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</header>
<style>
  .footer-section {
      background-color: black;
  }
  .footer_title{
font-size: 2rem;
margin-bottom: 2rem;
}
.footer_social{
margin-bottom: 2rem;
}
.footer_icon{
font-size: 1.5rem;
color: #fff;
margin: 0 1rem;
}
.footer_icon:hover{
  color:#048dfe;
}
</style>


<section class="footer-section">
  <footer class="footer">
    <div style="text-align: center;">
      <p class="footer_title">Follow us</p>
      <div class="footer_social">
        <a href="https://www.facebook.com/faisalaman99/" class="footer_icon"><i class="fab fa-facebook-f"></i></a>
        <a href="https://www.instagram.com/faisalaman99/" class="footer_icon"><i class="fab fa-instagram"></i></a>
        <a href="https://t.me/FaisalAman18" class="footer_icon"><i class="fab fa-telegram"></i></a>
      </div>
      <p>&#169; KLU</p>
    </div>
  </footer>
</section>




<jsp:include page="includes/footer.jsp" />  
<?xml version="1.0" encoding="ISO-8859-1"?>
            
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
  
  	<!--Meta Data -->
  	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  	<meta name="description" content="Cineplex for COM 155 Assignment 2 by group B6b, created using XML and XSLT." />  
	<meta name="author" content="Alastair Coleman, Conor McCann, Deane McCullough" /> 
  
  	<title>Group B6b Cineplex | Assignment 2 | Alastair Coleman, Conor McCann, Deane McCullough</title>
  
  	<!-- CSS -->
	<link rel="stylesheet" href="css/html5reset-1.6.1.css" />
	<link rel="stylesheet" href="css/cineplex.css" />
	<link rel="stylesheet" href="css/jquery-ui-1.8.18.custom.css" />
	<link rel="stylesheet" href="css/jquery.fancybox.css" />
	
	<!-- Favicon -->
	<link rel="icon" href="favicon.png" type="image/png"/>
  
  	<!-- Scripts -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="js/myscripts.js"></script>
	
	<!--[if lt IE 9]>  
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]--> 

	<script type="text/javascript" src="http://use.typekit.com/kxy2ylp.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
  
  </head>
  <body>
  	
  	<!-- Header -->
	<header></header>
  
  	<!-- Main Body -->
	<div id="container">
	
	<!-- Left Hand Side Bar with Filters -->
	<aside>
	
	<h3>FILTER BY:</h3>
	
		
           <h4>Certificate</h4>
		   
		<div id="cert">
			<label for = "all" id="alllbl" class="chkactive">All</label>
			<input type = "checkbox" id = "all" value = "all" onClick="checkedAll(frm1)" checked="true" />
             
    <!-- Form to filter by Certificate -->
	<form id="frm1">
	
			<label for = "u" style="margin-left: 6px;" class="chkactive">U</label>
             <input type = "checkbox" id = "u" value = "certu" onClick="displayrightlistings()" checked="true" />
			 
			 <label for = "pg" class="chkactive">PG</label>
			 <input type = "checkbox" id = "pg" value = "certpg" onClick="displayrightlistings()" checked="true" />
			 
			 <label for = "12a" class="chkactive">12A</label>
             <input type = "checkbox" id = "12a" value = "cert12a" onClick="displayrightlistings()" checked="true" />
			 
			 <label for = "15" class="chkactive">15</label>
			 <input type = "checkbox" id = "15" value = "cert15" onClick="displayrightlistings()" checked="true" />
			 
			 <label for = "18" class="chkactive">18</label>
			 <input type = "checkbox" id = "18" value = "cert18" onClick="displayrightlistings()" checked="true" />
	</form>
		
		</div>
		
		<h4>Genre</h4>
	
		<!-- Drop bo selection for Genres -->
		<select class="custom" id="genre_select" onChange="displayrightlistings()" >
			<option value="all">Any</option>
			<option value="Action">Action</option>
			<option value="Adventure">Adventure</option>
			<option value="Animation">Animation</option>
			<option value="Biography">Biography</option>
			<option value="Comedy">Comedy</option>
			<option value="Crime">Crime</option>
			<option value="Documentary">Documentary</option>
			<option value="Drama">Drama</option>
			<option value="Family">Family</option>
			<option value="Fantasy">Fantasy</option>
			<option value="Film-Noir">Film-Noir</option>
			<option value="History">History</option>
			<option value="Horror">Horror</option>
			<option value="Musical">Musical</option>
			<option value="Mystery">Mystery</option>
			<option value="Romance">Romance</option>
			<option value="Sci-Fi">Sci-Fi</option>
			<option value="Sport">Sport</option>
			<option value="Thriller">Thriller</option>
			<option value="War">War</option>
			<option value="Western">Western</option>
		</select>
	
	</aside>
	<!-- End of Left hand sidebar -->
  
  	<!-- Main right hand content -->
	<section>
	
	<!-- Navigation to select day. -->
	<nav>
		<ul class="mainnav">
			<li class="active">fri</li>
			<li>sat</li>
			<li>sun</li>
			<li>mon</li>
			<li>tue</li>
			<li>wed</li>
			<li>thur</li>
		</ul>
	</nav>
	
	<!-- Link to switch between list and block views -->
	<div class="switchview">
		View: <span class="switchviewimage"><img src="images/block_view.png" alt="Block View" class="block"/></span>
	</div>
	
	<!-- XSL to select all movies within the cinema node and apply template -->
	<div id="filmlisting">
	<xsl:for-each select="cinema">
      	   <xsl:apply-templates select="movie">
      	   		<xsl:sort order="ascending" select="movie_title"/>
      	   </xsl:apply-templates>
	</xsl:for-each>
	</div>
	
	</section>
	<!-- End of main right hand content -->
	
	</div>
	<!-- End of Main body -->
	
	
	<!-- Footer -->
	<footer>
		<p>Designed by Alastair Coleman, Conor McCann &amp; Deane McCullough</p>
		<p><![CDATA[ © Copyright 2012. ]]></p>
	</footer>
	
	<!-- Script for Movie Trailer lightbox -->
	<script type="text/javascript">
	<![CDATA[
$(document).ready(function() {
	$(".various").fancybox({
		type		: 'iframe',
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});
});
]]>
</script>
	
  </body>
  </html>
  
</xsl:template>




<!-- Template to display movies -->
<xsl:template match="movie">

	<!-- Article wrapper for each movie -->
	<article>
		<!-- XSL to apply classes to be called by jQuery for filters -->
		<xsl:attribute name="class">all <xsl:for-each select="genre"><xsl:value-of select="."/><xsl:text> </xsl:text></xsl:for-each><xsl:for-each select="showtimes/date"><xsl:value-of select="day"/><xsl:text> </xsl:text></xsl:for-each>cert<xsl:value-of select="movie_title/@certificate"/></xsl:attribute>
		
		<!-- Movie poster which on click will play movie trailer from youtube -->
		<a class="various" href="ISJR4rVO0TQ">
			<xsl:attribute name="href">http://www.youtube.com/embed/<xsl:value-of select="trailer"/><![CDATA[?autoplay=1&iv_load_policy=3]]></xsl:attribute>
	
			<img class="poster">
				<xsl:attribute name="src">images/<xsl:value-of select="poster_img"/>.jpg</xsl:attribute>
				<xsl:attribute name="alt"><xsl:value-of select="movie_title"/> Poster</xsl:attribute>
			</img>
	
			<img src="images/play.png" alt="play Trailer" class="playbutton"/>
	
		</a>
	
		<!-- Movie Details for each movie -->
		<div class="movieinstance">
			<!-- Displays movie title -->
			<h2><xsl:value-of select="movie_title"/></h2>
			
			<!-- Loops through and displays each genre (CSS3 used to apply comma seperators) -->
			<p class="genres">
				<xsl:for-each select="genre">
      	  			<span><xsl:value-of select="."/></span>
				</xsl:for-each>
			</p>
	
			<!-- Detailed movie info -->
			<div class="info">
				<!-- Displays certificate based on the current movies certificate attribute -->
				<img class="certificate">
					<xsl:attribute name="src">images/<xsl:value-of select="movie_title/@certificate"/>.png</xsl:attribute>
					<xsl:attribute name="alt">Certificate <xsl:value-of select="movie_title/@certificate"/></xsl:attribute>
				</img>
				
				<!-- Displays untime node -->
				<span class="runtime"><xsl:value-of select="runtime"/> min</span>
				
				<!-- Displays star rating image based on rating node -->
				<img class="rating" >
					<xsl:attribute name="src">images/<xsl:value-of select="rating"/>star.png</xsl:attribute>
					<xsl:attribute name="alt"><xsl:value-of select="rating"/> Star Rating</xsl:attribute>
				</img>
			</div>
			
			<!-- Displays directors looping through each node (again seperated by comma using CSS3) -->
			<p class="director"><strong>Director: </strong>
				<xsl:for-each select="director">
      	  			<span><xsl:value-of select="."/></span>
				</xsl:for-each>
			</p>
		
			<!-- Displays cast looping through each node (again seperated by comma using CSS3) -->
			<p class="cast"><strong>Cast: </strong>
				<xsl:for-each select="cast">
      	 			<span><xsl:value-of select="."/></span>
				</xsl:for-each>
			</p>
			
			<!-- Displays storyline node -->
			<p class="storyline"><xsl:value-of select="storyline"/></p>
			
			<!-- Displays synopsis node -->
			<p class="synopsis"><xsl:value-of select="synopsis"/></p>
	
			<!-- Call for template to loop through and display each of the days showtimes -->
			<xsl:for-each select="showtimes">
      	 		<xsl:apply-templates select="date" />
			</xsl:for-each>
		</div>
	</article>

</xsl:template>
<!-- End of movie template -->

<!-- Template to show movie times by day -->
<xsl:template match="date">

	<ul>
		<!-- Adds classes to ul including the day node for jQuery navigation -->
		<xsl:attribute name="class">showtimes tk-league-gothic <xsl:value-of select="day"/></xsl:attribute>
		
		<!-- Loops though all the times for the chosen day and displays them (seperated by comma using CSS3) -->
		<xsl:for-each select="time">
			<li><xsl:value-of select="."/></li>
		</xsl:for-each>
	</ul>

</xsl:template>
<!-- End of showtimes by date template -->

</xsl:stylesheet>
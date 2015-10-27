var checked=true;
	var frm1 = "";
	function checkedAll (frm1) {
		var aa= document.getElementById("frm1");
		if ($('input#all').is(':checked')) {
			checked = true;
			$("#cert label").addClass("chkactive");
	    }
		else {
			checked = false;
			$("#cert label").removeClass("chkactive");
		}
		for (var i =0; i < aa.elements.length; i++) 
		{
			aa.elements[i].checked = checked;
		}
		displayrightlistings();
	}
	

	function displayrightlistings() {

		var selectVal = $("#genre_select :selected").val();
		var day = $("nav ul li.active").text(); 
		var checked = [];
		$('#frm1 :checkbox:checked').each(function(i){
		      checked[i] = $(this).val();
		});
		
		if (!$('#frm1 input[type=checkbox]:not(:checked)').length) {
			$("#alllbl").addClass("chkactive");
			$("input#all").attr('checked', true);
		}
		
		if ($('#frm1 input[type=checkbox]:not(:checked)').length) {
			$("#alllbl").removeClass("chkactive");
			$("input#all").attr('checked', false);
		}
		
		
		var finalstring = ".";
		if (selectVal !== undefined) {
			finalstring += selectVal;
		}
		if (day !== undefined) {
			finalstring += "."+day;
		}
		if (checked !== undefined) {
			var origstring = finalstring;
			finalstring ="";
			$(checked).each(function(i){
		 	    var addstring = origstring+"."+checked[i];
		 	    if (i ==0) { finalstring += addstring; }
		 	    else {
		      		finalstring += ", "+addstring;
				}
			});
		}
		
		$('#filmlisting').slideUp('slow', function() {
			$("article").addClass("hide");
		
			$("ul.showtimes").addClass("hide");
			$("ul.showtimes."+day).removeClass("hide");
		
			$(finalstring).removeClass("hide");
		});
		$('#filmlisting').fadeIn('slow');
	}
	
	$(document).ready(function(){
		$("article").addClass("hide");
		displayrightlistings();
		var blockview = true;
		$('.synopsis').addClass("hide");
		$('.director').addClass("hide");
		$('.cast').addClass("hide");
		$(".switchviewimage img").click(function(){
			if (blockview == true) {
			$(this).attr("src", "images/list_view.png");
			$('#filmlisting').slideUp('slow', function() {
				$("article").css('width','100%');
				$('.synopsis').removeClass("hide");
				$('.director').removeClass("hide");
				$('.cast').removeClass("hide");
				$('.storyline').addClass("hide");
				$("article").addClass("underline");
				blockview = false;
			});
			$('#filmlisting').fadeIn('slow');
			}
			else {
			$(this).attr("src", "images/block_view.png");
			$('#filmlisting').slideUp('slow', function() {
				$("article").css('width','50%');
				$('.synopsis').addClass("hide");
				$('.director').addClass("hide");
				$('.cast').addClass("hide");
				$('.storyline').removeClass("hide");
				$("article").removeClass("underline");
				blockview = true;
			});
				$('#filmlisting').fadeIn('slow');
			}
			
		});
	$("nav ul li").click(function(){
		$("nav ul li").removeClass("active");
		$(this).addClass("active");
		displayrightlistings();
	});
	
	$("#frm1 label").click(function(){
		if ($(this).hasClass("chkactive") == true) {
			$(this).removeClass("chkactive");
			$("#alllbl").removeClass("chkactive");
		}
		else if ($(this).hasClass("chkactive") == false) {
			$(this).addClass("chkactive");
		}
	});
	
	});

			$.ajaxSetup({
				headers: {
					'Authorization': $.cookie("token")
				},
				xhrFields: {
					withCredentials: true
				},
				crossDomain: true
			});

	$(function(){
	　　if($.cookie("token") == null || $.cookie("token") == ""){
		window.location.href = "/admin/login.html"
	}
	});
$.ajaxSetup({
	xhrFields: {
		withCredentials: true
	},
	crossDomain: true
});
$(function() {
	$("#sub").addClass("disable");
	$("#Modal").modal({
		keyboard: true
	});
	setTimeout("$('#Modal').modal('hide')", 60000);
	time(document.getElementById("btn"))
});
var wait = 20;
function time(a) {
	if (wait == 0) {
		a.removeAttribute("disabled");
		a.value = "关闭"
	} else {
		a.setAttribute("disabled", true);
		a.value = "关闭(" + wait + ")";
		wait--;
		setTimeout(function() {
			time(a)
		},
		1000)
	}
}
$("#Modal").modal({
	backdrop: 'static',
	keyboard: false
});
$("#submit").click(function() {
	var b = $("#check").is(":checked");
	var d = $("#detail").val();
	var a = $("#phone").val();
	var e = $("#userName").val();
	if (!b) {
		alert("请先同意体验协议");
		return
	}
	if (a == null) {
		alert("手机号不能为空");
		return
	} else {
		var f = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!f.test(a)) {
			alert("手机号不合法，请重新输入");
			return false
		}
	}
	if (d.length < 10) {
		alert("申请内容需要大于10字");
		return
	}
	if (e == null || e.length < 2) {
		alert("请输入您的姓名");
		return
	}
	$.ajax({
		type: "GET",
		url: "https://test.wslhome.top/login/getExperience/v1",
		data: {
			check: b,
			detail: d,
			phone: a,
			userName: e
		},
		dataType: "json",
		success: function(g) {
			if (g.code == 0) {
				alert("申请成功，账号密码将通过短信发送至您的手机，请注意查收");
				window.location.href = "/admin/login.html"
			} else {
				alert(g.userMsg)
			}
		},
		error: function(g) {
			alert(g.userMsg)
		}
	})
});
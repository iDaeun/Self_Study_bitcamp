<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	h5{
	border: 3px solid gray;
	}
	h1{
	text-align: center;
	}
</style>
</head>
<body>
	
	<h1>방명록</h1>
	<div style="text-align: center; font-size: 25px;"><a href="writeForm">글쓰기</a></div>
	<br>
	
	<article id="list">
	
	</article>
	<div id="paging">
	
	</div>
	
	<script>
	$(function(){
		
		page(1);
		
	});
	
	function page(num){
		
		alert(num);
		
		$.ajax({
			url : 'guest/listJson',
			type : 'get',
			data : {page:num},
			success : function(data){
				alert(data);
				console.log(data);
				alert(data.messageTotalCount);
				alert(JSON.stringify(data));

				var output = '';
				
				var list = data.messageList;
				for(var i=0; i<list.length; i++){
					console.log(list[i]);
					var id = list[i].id;
					var guestName = list[i].guestName;
					var message = list[i].message;
					
					output += '<div>\n';
					output += '<br>';
					output += '메세지 번호' + id + '<br>\n' 
					output += '손님 이름' + guestName + '<br>\n'  
					output += '메세지' + message + '<br>\n'  
					output += '</div>\n';
				}
				
				var paging = '';
				for(var j=1; j<=data.pageTotalCount; j++){
					paging += '<span class="paging"><a href="#" onclick="page('+j+')">'+j+'</a></span> ';
				}
				
				alert(output);
				
				$('#list').html(output);
				$('#paging').html(paging);
			}
		});
	}
	</script>
		
</body>
</html>
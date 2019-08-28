<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
/* #idCheck {
 display: none;
 }

 #pwCheck {
 display: none;
 }*/
</style>
</head>

<body>
	<h1>회원가입</h1>
	<form id="form">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><input type="email" id="id" name="id" required></td>
				<td><input type="button" onclick="checkId()" value="아이디 중복체크">
					<span id="checkIdSpan"></span><input type="checkbox" id="idCheck">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" name="pw" required></td>
			</tr>
			<tr>
				<td>비밀번호 다시 입력</td>
				<td><input type="password" id="pw2" name="pw2" required><br>
					<span id="pwSpan"></span> <span id="pwSpan2"></span> <input
					type="checkbox" id="pwCheck"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" required>
					<span id="nameSpan"></span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address" required></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" id="pic" name="pic"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="JOIN US!"></td>
			</tr>
		</table>
	</form>

	<script>
		$(document).ready(function() {

			// 비밀번호 재입력 시 일치하는지 확인
			$('#pw2, #pw').focusout(function() {
				if ($('#pw').val() == $('#pw2').val()) {
					$('#pwSpan').html('비밀번호 일치');
					$('#pwSpan').css('color', 'green');
					$('#pwCheck').prop('checked', true);
				} else {
					$('#pwSpan').html('비밀번호 불일치');
					$('#pwSpan').css('color', 'red');
					$('#pwSpan').focus();
					$('#pwCheck').prop('checked', false);
				}
			});

			$('#form').submit(function() {

				if (!$('#idCheck').prop('checked')) {
					alert('아이디 중복 체크를 해주세요!');
					return false;
				}
				if (!$('#pwCheck').prop('checked')) {
					alert('[비말번호 불일치] 다시 확인해주세요!');
					return false;
				}

				var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함
				var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능

				// 비밀번호 유효성 검사
				if (!checkPw.test($('#pw').val())) {
					$('#pwSpan2').html(
							'[비밀번호] 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함');
					$('#pwSpan2').css('color', 'red');
					$('#pw2').focus();
					return false;
				}

				// 이름 유효성 검사
				if (!checkName.test($('#name').val())) {
					$('#nameSpan').html('[이름] 한글,영문만 가능');
					$('#nameSpan').css('color', 'red');
					$('#name').focus();
					return false;
				}

				var formData = new FormData(); // 파일 전송 -> FormData()활용

				formData.append('id', $('#id').val());
				formData.append('pw', $('#pw').val());
				formData.append('name', $('#name').val());
				formData.append('address', $('#address').val());
				
				if ($('#pic').val()) {
					formData.append('pic', $('#pic')[0].files[0]);
				}

				$.ajax({
					url : 'http://localhost:9090/ps/members/reg',
					type : 'POST',
					data : formData,
					processData : false, //파일 전송 시 필수
					contentType : false, //파일 전송 시 필수
					success : function(data) {
						alert(data);
					}
				});
				return false;
			});
		});

		// 중복 아이디 체크
		function checkId() {

			var id = $('#id').val();
			alert(id + '여기');
			if (id.length < 1) {
				alert('아이디를 입력해주세요!');
			} else {
				$.ajax({
					url : 'http://localhost:9090/ps/members/reg',
					type : 'GET',
					data : {
						id : id
					},
					success : function(data) {
						alert(data);
						if (data == 'Y') {
							$('#checkIdSpan').html("사용 가능한 아이디");
							$('#checkIdSpan').css('color', 'green');
							$('#idCheck').prop('checked', true);
						} else {
							$('#checkIdSpan').html("사용 불가능한 아이디");
							$('#checkIdSpan').css('color', 'red');
							$('#idCheck').prop('checked', false);
						}
					}
				});
			}

		}
	</script>
</body>
</html>

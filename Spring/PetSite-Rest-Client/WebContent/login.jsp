<%@page import="domain.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!--알림창용-->
    <!--<script src="sweetalert2/sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2/sweetalert2.min.css">-->

</head>

<body>
    <h1>로그인</h1>
    <form id="form">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="email" id="id" name="id" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="pw" name="pw" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="LOGIN!"></td>
            </tr>
        </table>
    </form>
    <span id="span"></span>

    <script>
        $(document).ready(function() {
            $('#form').submit(function() {

                var id = $('#id').val();

                $.ajax({
                    url: 'http://localhost:9090/ps/members/login',
                    type: 'POST',
                    data: $('#form').serialize(),
                    success: function(data) {
                        alert(data.view);
                        alert(data.id);
                        if (data.view == 'success') {
                            //인증처리됨 -> 메인화면으로
                            alert('인증되었습니다!');
                            
                            $.ajax({
                            	url: "http://localhost:9090/psClient/loginProcess.jsp",
                            	data: {
                            		id: data.id
                            	},
                            	type: 'GET'
                            });
                           	
                            /* Swal.fire('인증되었습니다!')*/
                            location.href = "http://localhost:9090/psClient/index.jsp";
                            //location.href = "main.html";
                        }
                        if (data.view == 'undefined') {
                            //미인증 회원 -> 이메일 다시 보내기
                            var chk = confirm('미인증 상태입니다, 인증키를 다시 보내시겠습니까?');
                            if (chk) {
                                $.ajax({
                                    url: 'http://localhost:9090/ps/members/verify/resend',
                                    data: {
                                        id: id
                                    },
                                    type: 'GET',
                                    success: function(data) {
                                        if (data == 'success') {
                                            $('#span').html("인증키 재전송 완료, 이메일을 통해 인증해주세요!");
                                            $('#span').css('color', 'green');
                                        } else {
                                            $('#span').html("인증키 재전송 실패ㅠㅜ");
                                            $('#span').css('color', 'red');
                                        }
                                    }
                                });
                            }
                        }
                        if (data.view == 'loginfail') {
                            //로그인 실패
                            alert('로그인 실패, 다시 로그인해주세요!');
                            location.replace("http://localhost:9090/psClient/login.jsp");
                            //location.replace("login.html");
                        }
                    }
                });
                return false;
            });
        });
    </script>
</body></html>

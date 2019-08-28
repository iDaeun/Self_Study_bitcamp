<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<body>
    <h1>마이페이지</h1>
    <div id="myInfo"></div>


    <script>
        $(document).ready(function() {
            myInfo();
        });

        function myInfo() {
        	
        	var id = '${id}';

            $.ajax({
                url: 'http://localhost:9090/ps/members/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                    alert(JSON.stringify(data));

                    var html = '';
                    html += '<table> <tr>';
                    html += '<td>아이디</td>';
                    html += '<td>' + data.id + '</td> </tr>';
                    html += '<tr><td>비밀번호</td>';
                    html += '<td>' + data.pw + '</td></tr>';
                    html += '<tr><td>이름</td>';
                    html += '<td>' + data.name + '</td></tr>';
                    html += '<tr><td>주소</td>';
                    html += '<td>' + data.address + '</td></tr>';
                    html += '<tr><td>사진</td>';
                    html += '<td><img src="http://localhost:9090/ps/file/' + data.pic_name + '"></td></tr>';
                    html += '<tr><td>가입날짜</td>';
                    html += '<td>' + data.regDate + '</td></tr></table>';
                    html += '<button onclick="edit(\'' + data.id + '\')">회원수정</button>';
                    html += '<button onclick="deleteMem(\'' + data.id + '\')">회원탈퇴</button>';
                    html += '<button onclick="logout(\'' + data.id + '\')">로그아웃</button>';

                    $('#myInfo').html(html);
                }

            });
        }
        
        function logout(id){
        	
        	$.ajax({
            	url: "http://localhost:9090/psClient/logout.jsp",
            	data: {
            		id: id
            	},
            	type: 'GET',
            	success: function(data){
                	alert(data);
                	location.href = "http://localhost:9090/psClient/index.jsp";
                }
            });
        	
        }
        
        function deleteMem(id){
        	
        	$.ajax({
        		url: 'http://localhost:9090/ps/members/mypage',
                type: 'DELETE',
                data: JSON.stringify({
                	id: id
                }),
                contentType: 'application/json; charset=utf-8',
                success: function(data){
                	alert(data);
                }
        	});
        }

        function edit(id) {

            $.ajax({
                url: 'http://localhost:9090/ps/members/mypage/id',
                type: 'GET',
                data: {
                    id: id
                },
                success: function(data) {
                    alert(JSON.stringify(data));

                    var html = '';

                    /*사진*/
                    html += '<form id="form1"><table><tr><td>사진</td>';
                    html += '<td><img src="http://localhost:9090/ps/file/' + data.pic_name + '"></td></tr>';
                    html += '<tr><td>사진수정</td>';
                    html += '<td><input type="file" id="pic"></td>';
                    html += '<td><input type="submit" value="사진 업로드"></td></tr></table></form><hr>';

                    /*아이디,비밀번호,이름,주소*/
                    html += '<form id="form2"><table><tr>';
                    html += '<td>아이디</td>';
                    html += '<td> <input type="text" value="' + data.id + '" id="id" readonly>' + '</td> </tr>';
                    html += '<tr><td>비밀번호</td>';
                    html += '<td> <input type="password" id="pw" onfocusout="checkPw()">' + '</td> </tr>';
                    html += '<tr><td>비밀번호 다시 입력</td>';
                    html += '<td> <input type="password" id="pw2"><span id="pwSpan"></span><span id="pwSpan2"></span><input type="checkbox" id="pwCheck"></td></tr>';
                    html += '<tr><td>이름</td>';
                    html += '<td> <input type="text" value="' + data.name + '" id="name" readonly>' + '</td></tr>';
                    html += '<tr><td>주소</td>';
                    html += '<td> <input type="text" value="' + data.address + '" id="address">' + '</td></tr>'
                    html += '<tr><td colspan="2"><input type="submit" value="수정완료"></td></tr></table></form>';

                    html += '<button onclick="cancel()">취소</button>';

                    $('#myInfo').html(html);

                    /*사진 업로드*/
                    $('#form1').submit(function() {

                        var formData = new FormData(); // 파일 전송 -> FormData()활용

                        formData.append('id', $('#id').val());
                        if ($('#pic').val()) {
                            formData.append('pic', $('#pic')[0].files[0]);
                        } else {
                            alert('사진을 업로드 해주세요!');
                            return false;
                        }

                        $.ajax({
                            url: 'http://localhost:9090/ps/members/mypage',
                            type: 'POST',
                            data: formData,
                            processData: false, //파일 전송 시 필수
                            contentType: false, //파일 전송 시 필수
                            success: function(data) {
                                alert(data);
                            }
                        });
                        return false;
                    });

                    /*그 외 업로드*/
                    $('#form2').submit(function() {

                        if (!$('#pwCheck').prop('checked')) {
                            alert('[비말번호 불일치] 다시 확인해주세요!');
                            return false;
                        }

                        var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,10}$/); // 비밀번호: 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함

                        // 비밀번호 유효성 검사
                        if (!checkPw.test($('#pw').val())) {
                            $('#pwSpan2').html('[비밀번호] 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함');
                            $('#pwSpan2').css('color', 'red');
                            $('#pw2').focus();
                            return false;
                        }

                        $.ajax({
                            url: 'http://localhost:9090/ps/members/mypage',
                            type: 'PUT',
                            data: JSON.stringify({
                                id: $('#id').val(),
                                pw: $('#pw').val(),
                                address: $('#address').val()
                            }),
                            contentType: 'application/json; charset=utf-8',
                            success: function(data) {
                                alert(data);
                            }
                        });
                        return false;
                    });
                }

            });

        }
        
        function cancel(){
        	location.href = "http://localhost:9090/psClient/membersC/mypage.jsp";
        }

        function checkPw() {
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
        }
    </script>
</body></html>

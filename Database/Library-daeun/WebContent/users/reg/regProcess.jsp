<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="users.service.RegService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- usebean - memberInfo.java에 데이터 저장 -->
<jsp:useBean id="member" class="users.model.MemberInfo"/>
<jsp:setProperty property="*" name="member" />

<%
	// 사진파일 저장
	String user_id = "";
	String user_pw = "";
	String user_name = "";
	String user_photo = "";
    long fileSize = 0;
    String user_photo_name = "";
	
	// upload할 경로
	String uploadPath = "/user_photo_upload";
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);
	System.out.println(dir);
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> itr = items.iterator();
	
	while(itr.hasNext()){
		FileItem item = itr.next();
		
		// type 구별해주기
		if(item.isFormField()){
			// type != file
			if(item.getFieldName().equals("user_id")){
				user_id = item.getString("utf-8");
			}
			
			if(item.getFieldName().equals("user_pw")){
				user_pw = item.getString("utf-8");
			}
			
			if(item.getFieldName().equals("user_name")){
				user_name = item.getString("utf-8");
			}
			
		} else {
			// type == file
			if(item.getFieldName().equals("user_photo")){
				user_photo = item.getName(); // 파일이름
				fileSize = item.getSize(); // 파일 사이즈
				
				// 중복되지 않도록 이름 처리
				user_photo_name = System.nanoTime()+"_"+user_photo;
				
				// 파일 업로드
				item.write(new File(dir, user_photo_name));
			}
		}
	}
	
%>

<%
	RegService service = RegService.getInstance();
	int rCnt = service.regInsert(member);
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->

<link rel="stylesheet" href="/lib/css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="/lib/cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/lib/js/bootstrap.js"></script>

</head>
<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				<%
					if (rCnt > 0) {
				%>
				<h1>
					회원가입 완료!<%=rCnt%>개 데이터 추가함
				</h1>
				<a href="<%=request.getContextPath()%>">메인페이지로 돌아가기</a>
				<%
					} else {
				%>
				<h1>회원가입 실패</h1>
				<a href="<%=request.getContextPath()%>">메인페이지로 돌아가기</a>
				<%
					}
				%>

			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

</body>
</html>
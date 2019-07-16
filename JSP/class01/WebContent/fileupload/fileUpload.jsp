<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String name = "";
    String sNum = "";
    String fileName = ""; 
    String saveFileName = "";
    long fileSize = 0;
    
    // upload할 경로
    String uploadPath = "/upload";
    String dir = request.getSession().getServletContext().getRealPath(uploadPath);
    
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
    DiskFileItemFactory factory = new DiskFileItemFactory();
    
    ServletFileUpload upload = new ServletFileUpload(factory);
    
    // FileItem <- 사용자가 폼 페이지에서 전송한 데이터들을 객체로 가져옴, uName/sNumber/report
    List<FileItem> items = upload.parseRequest(request);
    Iterator<FileItem> itr = items.iterator();
    while(itr.hasNext()){
    	FileItem item = itr.next();
    	if(item.isFormField()){
    		//type="file"이 아닌경우
    				
    		// iterator로 가져오면 uName/sNumber/report 어떤 것이 오는지 모름
    		// 구별해주기:
    		if(item.getFieldName().equals("uName")){
    			name = item.getString("utf-8");
    		}
    		
    		if(item.getFieldName().equals("sNumber")){
    			sNum = item.getString("utf-8");
    		}
    		
    	} else {
    		//type="file"인경우
    		if(item.getFieldName().equals("report")){
    			// 파일이름 구하기
    			fileName = item.getName();
    			fileSize = item.getSize();
    			
    			// 중복되지 않도록 이름 처리
    			//saveFileName = System.currentTimeMillis()+"_"+fileName;
    			saveFileName = System.nanoTime()+"_"+fileName;
    			
    			// 파일 업로드
    			item.write(new File(dir, saveFileName));
    		}
    	}
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>

	<h1>
		이름 : <%=name %> <br>
		학번 : <%=sNum %> <br>
		리포트파일 : <%=fileName %>(<%=fileSize %>)
		저장파일 이름: <%=saveFileName %>
		저장 폴더 : <%=dir %>
	</h1>

</body>
</html>
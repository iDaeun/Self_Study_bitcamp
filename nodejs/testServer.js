// 1. 모듈 등록
var http = require('http'); // 웹 서버 생성 모듈
// 2. 필요한 객체 생성 
http.createServer(function(request, response){
    response.writeHead(200, {'Content-Type':'text/html'}); // 선택코드, 헤더 객체
    response.end('<h1>test server index page</h1>'); // html 작성
}).listen(3000); // localhost:3000
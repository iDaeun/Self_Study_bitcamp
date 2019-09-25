// 1. 모듈을 로드
// http 모듈
var http = require('http');
// fs 모듈
var fs = require('fs');

// server 생성
var server = http.createServer(function (request, response) {

    var url = request.url;
    console.log(url);

    if (url == '/forkey.jpg') { //http://localhost:3000/forkey.jpg 

        response.writeHeader(200, { 'Content-Type': 'image/jpg' });

        var filepath = __dirname + '/forkey.jpg';

        fs.access(filepath, fs.F_OK, function (err) {
            // 파일 데이터를 로드해서 응답처리
            if (err) {
                response.statusCode = 404;
                response.statusMessage = 'file not found';
                response.end();
                return;
            }
            fs.readFile(filepath, function (err, data) {
                //if(err){}
                response.write(data);
                response.end();
            });
        });
    } else if (url == '/test') { //http://localhost:3000/test 

        response.writeHeader(200, { 'Content-Type': 'text/html; charset=utf-8' });

        var htmlStr = __dirname + '/test.html';

        fs.access(htmlStr, fs.F_OK, function (err) {

            if (err) {
                response.statusCode = 404;
                response.statusMessage = 'file not found';
                response.end();
                return;
            }
            fs.createReadStream(htmlStr).pipe(response);
        });
    }

});

// port 설정
server.listen(3000);
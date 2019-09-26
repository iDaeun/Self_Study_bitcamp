//모듈 로드
//Http.Server
var http = require('http');
var querystring = require('querystring');
var fs = require('fs');
var formidable = require('formidable');
var pathUtil = require('path');

//데이터
var movieList = [
    {title : '스타워즈' , director : '조지루카스', image:'images/forkey.jpg'}
];

// images경로
var imgDirPath = __dirname + '/images';


var Server = http.createServer(function(req,res){

    // === image 
    var url = req.url;
    var method = req.method.toLocaleLowerCase();

    if(url == '/' && method == 'get'){

        list(req,res);

    } else if(url.indexOf('/images/' == 0 && method == 'get')){
        
        // uri 의 첫번째가 /images/로 들어올때 처리
        // var urlPath = req.url; // /images/starwars.jpg
        var urlPath = __dirname + req.url; // 디렉토리 이름(물리적) 앞에 추가
        
        res.writeHead(200, {'Content-Type':'image/jpg'}); // text/html타입에서 image로 바꿈
        fs.createReadStream(urlPath).pipe(res);
        
    } else if(url == '/' && method == 'post'){

        addMovie(req, res);
        //addNewMovie(req,res);

    } else if(url == '/v1/movies' && method == 'get'){

        responseJson(req,res);
    }

    // === text
    //GET / POST 구분
    // var method = req.method.toLocaleLowerCase();
    // console.log('requset Method : '+ method);

    // if(method == 'post'){
    //     console.log('POST 요청일 때 처리');
    //     addMovie(req,res);
    // }else{
    //     console.log('GET 요청일 때 처리');
    //     list(req,res);
    // }
});

//포트 설정
Server.listen(3000);

function responseJson(req,res){
     //Json형식으로 응답
    res.writeHeader(200, {'Content-Type' : 'application/json'});
    res.end(JSON.stringify(movieList));

}

function addNewMovie(req,res){

    var form = formidable.IncomingForm(); // form객체 가져오기
     //form.uploadDir = imgDirPath; // form에 property추가

    form.parse(req, function(err,fields,files){
        var title = fields.title;
        var director = fields.director;
        var posterImg = files.poster;
        
        var date = new Date();
        var newFileName = 'poster_'+date.getHours()+date.getMinutes()+date.getSeconds(); // 새로운 이름 생성

        var ext = pathUtil.parse(posterImg.name).ext; // 확장자

        var newPath = __dirname + pathUtil.sep + 'images' + pathUtil.sep + newFileName + ext; // 새로운 경로

        fs.renameSync(posterImg.path, newPath);

        var newPosterImgUrl = 'images/' + newFileName + ext; // 외부에서 보여지는 경로

        // DB로 바뀌는 부분
        var mInfo = {
            title : title,
            director : director,
            image : newPosterImgUrl
        };

        movieList.push(mInfo);

        // F5눌렀을때 get으로 보내게끔 (post막음) -- PRG패턴**
        res.statusCode = 302; // 상태코드
        res.setHeader('Location','.'); // 헤더 필드 ('.'으로 설정해서 다른 페이지로 이동 막음)
        res.end('success');

    });

}

// --- POST
function addMovie(req, res){
    //res 의 'data' / 'end' 이벤트를 이용해서 body의 내용을 읽어 처리한다.

    var body = '';

    req.on('data',function(chunk){ // *요청 데이터 얻기

        body += chunk;
        console.log('body : ' + body);
    });

    req.on('end',function(){ // *전송 끝 -> querystring모듈로 분석 

        var parsedData = querystring.parse(body);

        console.log('parsed : ' , parsedData);

        movieList.push({title : parsedData.title, director : parsedData.director});

        //list(req,res);

        
        res.statusCode = 302; // 상태코드
        res.setHeader('Location','.'); // 헤더 필드 ('.'으로 설정해서 다른 페이지로 이동 막음)
        res.end('success');
    });
}

// -- GET 
function list(req, res){
    //movieList 데이터를 출력해서 보여주는 html

    res.writeHeader(200, {'Content-Type':'text/html; charset=UTF-8'});

    //body 설정
    res.write('<html>');
    res.write('<meta charset="UTF-8">');
    res.write('<body>');
    res.write('<h3>Favorite Movie</h3>');
    res.write('<div><ul>');

    movieList.forEach(function (item) {
        res.write('<li><img src="'+ item.image +'" height="50px">' + item.title + '(' + item.director + ')</li>');
        }, this);
    res.write('</ul></div>');

    res.write(
        '<form method="post" enctype="multipart/form-data"><h4>새 영화 입력</h4>' + //enctype="multipart/form-data" 추가!!
        '<div><input type="text" name="title" placeholder="영화제목"></div>' +
        '<div><input type="text" name="director" placeholder="감독"></div>' +
        '<div><input type="file" name="poster"></div>' +
        '<input type="submit" value="upload">' +
        '</form>'
        );
        res.write('</body>');
        res.write('</html>');

    //응답실행
    res.end();
}
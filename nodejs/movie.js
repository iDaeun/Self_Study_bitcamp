// 생성자 함수 정의 : 클래스 정의
function Movie(title,director){

    // 변수 정의
    this.title = title;
    this.director = director;

    // 메소드 정의
    this.showData = function(){
        console.log(this.title + ':' + this.director);
    };

    this.makeObj = function(){
        return {
            title : this.title,
            director : this.director
        }
    };
}

// 모듈 객체 등록
module.exports.Movie = Movie;
module.exports = Movie; // 여기서는 module 생략 XXX
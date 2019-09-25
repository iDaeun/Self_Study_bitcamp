// 자바 스크립트 객체 생성
var obj = {};
obj.name = "kang";
obj.hello = function(){
    console.log(this.name);
};

//obj.hello();

// ----------------------------------------------

var Person = function(){}

// 공용 메소드 정의
Person.prototype.sayHello = function(){
    console.log('say hello');
}

class Member {}

//var person = new Person();
var member = new Member();

//person.sayHello();

// ----------------------------------------------

// 상속 처리를 위한 util모듈 로드
var util = require('util');
// 이벤트 등록을 위핸 EventEmitter 생성
var EventEmitter = require('events').EventEmitter;

// 상속 Person에 EventEmitter 상속
util.inherits(Person,EventEmitter);

// Person객체 생성
var person = new Person();
// 이벤트 등록
person.on('hi', function(){
    console.log('안녕하세요, 이벤트 onononon');
}); 
// 이벤트 발생
person.emit('hi');

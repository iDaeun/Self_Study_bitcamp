
// 필요한 모듈 로드
var greeting = require('./greeting.js');
var Movie = require('./movie');

// 모듈 함수 호출
greeting.hi();
greeting.bye();

var movie = new Movie('mini','pixar');

movie.showData();
console.log('data',movie.makeObj());
// var button = document.querySelector('button');

function button1() {
  var name = prompt('what is your name?');
  alert('hello' + name + ', nice to see you');
}

var myName = 'Front' + 234;
console.log(typeof myName);

var myDate = '2022' + '09';
console.log(typeof myDate);

// 백틱과 ${}을 이용하면 변수를 담을 수 있다

let myNumber = 3;

function getTwice(x) {
  return x * 2;
}
console.log(`${myNumber}의 두배는 ${getTwice(myNumber)}입니다`);

console.log(`${myNumber}의 두배는 ${getTwice(myNumber)}입니다`);

function sal(name, time, wage) {
  let total = time * wage;
  console.log(`${name}의 근무시간은 총 ${time}이며 최종 급여는 ${total}원입니다`);
}

sal('지수', 208, 11340);

/*
불대수
참(true) 거짓(false)
+,-,*,/
and, or, not

울산은 광역시이다 --- 참
9는 5보다 작다 --- 거짓
대한민국의 수도는 어디인가요? ---- 명제가아님
짜장면보다 짬뽕이 맛있다 --- 명제가아님(주관적)

or(||), and(&&), not(!)
or(||) 인수중 하나라도 참이면 참을반환 아니면 거짓을 반환
and(&&) 두 피연산자가 모두가 참일때 참을반환 그외의 경우 거짓을반환
*/

console.log(typeof 101);
console.log(typeof 'love');
console.log(typeof true);

console.log(typeof 1);
console.log(typeof 1.0);
console.log(typeof '1');
console.log(typeof '1');

console.log(typeof 'hello' + 'love');
/*
typeof연산자
1, 1.0 number
우선순위를 높여주면된다
*/
console.log(typeof (6 * 2 === 11 || (13 - 7 < 7 && !true)));
console.log(typeof (false || (true && false)));
// and가 or보다 우선순위가 한단계높다

/* 
형변환
String은 문자로 바꿔준다
Number는 숫자로 바꿔준다
*/
console.log(String(10) + String(9));

let x = '문자';
console.log(x);
console.log(Number(x));
console.log(typeof x);
console.log(typeof Number(x));

let y = '문자';
console.log(y);
console.log(Boolean(y));
console.log(typeof y);
console.log(typeof Number(y));

console.log(Boolean('false'));
console.log(Boolean(6 % 2));
console.log(Boolean(typeof false));

console.log(x === true);

console.log(typeof 4 - 1);

// 문자 + 열
// [요소 (엘리먼트)]
// let courseRanking = [
//     '1st': '자바스크립트 프로그래밍 기초'
//     '2ed': 'HTML/CSS 동적관리'
// ]
var text1 = ['h', 'e', 'l', 'l', 'o'];
console.log(text1.length);

// mutable vs immutable
// mutable 배열은 바꿀수있다
// immutable 문자열은 바꿀수없다
var text2 = 'hello';
text2[0] = 'p';
console.log(text2); // 불가능 바뀌지않음

var brands = ['애플', '삼성', '샤오미'];
var products = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];
console.log(brands);
console.log(products);
console.log(products[0][2]);

/* 
객제안에 있는 항목을 프로퍼티라고 한다
name과 value의 쌍으로 이루어져있다
*/

var person = {
  name: '아이유',
  age: 30,
  nationality: 'korea',
};
console.log(typeof person);

console.log(person['nationality']);

/*
함수
*/

function logTack(tack) {
  console.log(tack + ': 완료');
  console.log('-');
}

logTack('보고서 작성');
logTack('재고 확인');
logTack('담당자 파견');
logTack('영수증 발행');

console.log('Rm(이)가 대화에 참여했습니다');
console.log('슈(이)가 대화에 참여했습니다');
console.log('진(이)가 대화에 참여했습니다');
console.log('재이홉(이)가 대화에 참여했습니다');
console.log('지민(이)가 대화에 참여했습니다');
console.log('뷔(이)가 대화에 참여했습니다');

function logTack2(tack) {
  console.log(tack + '(이)가 대화에 참여했습니다');
}

logTack2('Rm');
logTack2('슈');
logTack2('진');
logTack2('재이홉');
logTack2('지민');
logTack2('뷔');

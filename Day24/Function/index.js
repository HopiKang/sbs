//함수

// 기명함수 표현식
// const sayHi = function () {
//   console.log('Hi');
// };
// console.log(sayHi.name);

// const sayHi = function printHiInconsole() {
//   console.log('Hi');
// };
// printHiInconsole(); 함수안에서만 사용가능한 함수이다
// console.log(sayHi.name);

// 제귀함수 : 자기자신을 호출하는 함수
// let countdown = function (n) {
//   console.log(n);

//   if (n == 0) {
//     console.log('End!');
//   } else {
//     countdown(n - 1);
//   }
// };

// let myFunction = countdown;
// countdown = null;

// countdown(5);

// let countdown = function printCountdown(n) {
//   console.log(n);

//   if (n == 0) {
//     console.log('End!');
//   } else {
//     printCountdown(n - 1);
//   }
// };

// let myFunction = countdown;
// countdown = null;

// countdown(5);

//-------------------------------------------------------------------------

//즉시 실행 함수 (IIFE)
// (function sayHi() {
//   console.log('Hi');
// })();
// // 함수를 ()로 묶고 ();로 실행하면 즉시실행하게된다

// //예
// (function (x, y) {
//   console.log(x + y);
// })(3, 5);

// //즉시 실행함수는 이름을 지어주더라고 외부에서 사용이 불가능하다
// sayHi();

// (function countdown(n) {
//   console.log(n);
//   if (n === 0) {
//     console.log('End');
//   } else {
//     countdown(n - 1);
//   }
// })(5);
// //프로그램 초기화기능에 많이 사용된다

// //예
// const firstName = '아';
// const lastName = '이유';

// const greetingMassage = (function () {
//   const fullName = `${firstName} ${lastName}`;
//   return `Hi! My name if ${fullName}`;
// })();
// console.log(greetingMassage);

// var printJS = function () {
//   console.log('자바스크립트');
// };

// console.log(typeof printJS);
// //function이라고 출력되지만 구체적인 정보는 객체이다
// console.dir(0);
// console.dir('hello');
// console.dir(true);
// console.dir(null);
// console.dir(undefined);
// console.dir({});
// console.dir([]);
// console.dir(printJS);

// var printJS = function () {
//   console.log('자바스크립트');
// };
// printJS();

// const myObject = {
//   name: '아이유',
//   birthDay: '1993',
//   isVeryNice: 'true',
//   sayHi: function (name) {
//     console.log(`hello ${name}`);
//   },
// };
// //배열도 가능하다
// myObject.sayHi('가수왕');

// const myBtn = document.querySelector('#myBtn');
// myBtn.addEventListener('click', function () {
//   console.log('버튼이 클릭되었습니다');
// });
// //파라미터로도 전달가능하다

// //콜백함수 (callback Function)
// function makeQuiz(quiz, answer, success, fail) {
//   if (prompt(quiz) === answer) {
//     console.log(getSuccess());
//   } else {
//     console.log(getFail());
//   }
// }

// function getSuccess() {
//   return '정답입니다';
// }

// function getFail() {
//   return '틀렸습니다';
// }

// const question = '5 + 3 = ?';

// makeQuiz(question, '8', getSuccess(), getFail());

// //고차함수
// function getHello() {
//   return function () {
//     console.log('Hello');
//   };
// }

// getHello()();
// //이렇게도 사용가능하다

// const sayHello = getHello();
// sayHello();

// arguments함수
// function argumentsPrint(a, b, c) {
//   //(a,b,c)를 파라미터라 한다
//   console.log(a);
//   console.log(b);
//   console.log(c);
//   console.log(arguments);
//   //유사배열로 표시된다
//   console.log(arguments[0]);
//   //인덱스값으로 표시가능
//   console.log(arguments.length);
//   //개수확인가능
//   console.log('-----------------------');
// }

function argumentsPrint(a, b, c) {
  for (const arg of arguments) {
    //for of 문은 반복할수있는 객체를 순회할수있도록 해주는 반복문이다
    //한마디로 arguments객체의 프로퍼티의 개수만큼 반복적으로 실행하는것이다
    console.log(arg);
  }
  console.log('---------------------');
}
//이렇게도 적으면 칸이 부족하거나 빈칸이 생겨도 딱맞게 작성가능하다

argumentsPrint('아이유', '제니', '손예진');
argumentsPrint('아이유');
argumentsPrint('아이유', '제니');
//값이 빈곳은 undefined값이된다
argumentsPrint('아이유', '제니', '손예진', '제이홉');
//값이 넘치면 무시된다

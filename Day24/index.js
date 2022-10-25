// function printArguments() {
//   for (const arg of arguments) {
//     console.log(arg);
//   }
//   console.log('-----------------------');
// }

// printArguments('RM', '진', '슈가');
// printArguments('제이홉');
// printArguments('지민', '뷔');
// printArguments('지수', '제니', '로제', '리사');
// //arguments는 유사배열이기때문에 배열문법을 사용할수없다

// // REST 파라미터
// function printArguments(...args) {
//   // ...args가 rest파라미터 문법이다
//   // function printArguments(st1, st2, ...args) {
//   // REST파라미터와 arguments를 함께 사용할수있다
//   // 마지막 args가 남은 모든걸 묶고 가지고있기때문에 가장 마지막에 사용해야한다
//   for (const arg of args) {
//     console.log(arg);
//   }
//   console.log(args.splice);
//   // 배열이기때문에 배열문법을 자유롭게 사용할수있다
//   console.log(arguments.splice);
//   console.log('-----------------------');
// }

// printArguments('RM', '진', '슈가');
// printArguments('제이홉');
// printArguments('지민', '뷔');
// printArguments('지수', '제니', '로제', '리사');

// //Arrow Function
// //기존함수 선언방식을 줄여서 쓰는방식이다
// //이름이 없는 익명 함수이다

// const double = (number) => {
//   //function을 지우고 괄호옆 => 을 넣는다
//   return number * 2;
// };
// console.log(double(5));
// const myBtn = document.querySelector('#myBtn');
// myBtn.addEventListener('click', () => {
//   console.log('button is 출력');
// });

//이렇게 줄일수도있다
// const double = (number) => number * 2;
// console.log(double(6))

// const double = number => {
//   return number * 2;
// }
// console.log(double(6))
// 변수가 하나들어갈경우 소과호를 생략가능하지만
// 두개이상일경우 소괄호를 작성해주어야한다
// 파라미터가 없는경우도 소괄호를 작성해주어야한다
// 왠만하면 소괄호를 적어주는게 편하다
// 그리고 Arrow 함수는 arguments객체가 없다

// function expressMultiplication(x, y) {
//   console.log(x + '*' + y + '=' + x * y);
// }
// expressMultiplication(3, 4);

// function expressMultiplication(x, y) {
//   console.log(`${x}` * `${y} = ${x * y}`);
// }
// expressMultiplication(3, 4);

// function wellcome() {
//   console.log('hello');
// }
// console.log('함수 호출 전');
// wellcome();
// console.log('함수 호출 후');

// function square(x) {
//   return x * x;
// }
// console.log('함수 호출 전');
// console.log(square(3));
// console.log('함수 호출 후');

// function sayhello(name) {
//   console.log(`안녕하세요 ${name}님!`);
// }
// sayhello('아이유');
// sayhello('제니');
// sayhello('지수');

// let x;
// console.log(x);
// // 값이 들어가있지않으면 디파인이 나온다
// console.log(sayhello('손예진'));

// function introduce(name, age, narionality) {
//   console.log(`제 이름은 ${name}입니다`);
//   console.log(`나이는 ${age}살 입니다`);
//   console.log(`국적은 ${narionality}입니다`);
// }
// introduce('아이유', 30, '대한민국');
// console.log('');
// //칸띄우기
// introduce('아이유', 30);
// //빈칸은 언디파인값으로 나온다

// function subway(x, y) {
//   console.log(`샌드위치 : ${x} 음료 : ${y}`);
// }
// subway('서브웨이 클럽', '콜라');
// subway('이탈리안 비엠티');

/*
변수의 Scope(범위, 영역)
*/
// let x = 3; 글로벌 변수 or 전역변수
// function myFunction() {
//   let x = 3;
//   console.log(x); // 블록문 안에 선언된 변수는 로컬(지역)변수라고 한다.
// }
// myFunction();

// function myFunction() {
//   let x = '청와대';
//   x = "종로구";
// }
// myFunction();
// console.log();

// let x = 150;
// function myFunction() {
//   let y = 40;
//   console.log(x + y);
// }
// myFunction();
// console.log(x);

// let x = 150;
// function myFunction() {
//   let x = 40 * 5; // 함수안에만 적용됨
//   console.log(x);
// }
// myFunction();
// console.log(x);

// const X = 1500;
// let x = 1000;
// console.log(x);
// console.log(X);

/*
return : 돌려주다
*/
// function inchToCentimeter(inch) {
//   var centimeter = inch * 2.54;
//   return centimeter;
// }
// var result1 = inchToCentimeter(2);
// var result2 = inchToCentimeter(2);
// console.log(result1);
// console.log(result1);
// console.log(inchToCentimeter(1) + inchToCentimeter(5));

// function square(x) {
//   console.log('return 전');
//   return x * x;
//   //return 뒤에 나오는 코드는 죽은자리이다 (실행되지않음, 오류가 나올수도있음)
// }
// console.log('함수 호출 전');
// console.log(square(3));
// console.log('함수 호출 후');

// function printSquare(x) {
//   console.log(x * x);
// }
// function getSquare(x) {
//   return x * x;
// }
// printSquare(3);
// getSquare(3);
// console.log(printSquare(3));

/*
넓이계산

*/
// function calculateRectangleArea(width, height) {
//   return width * height;
// }
// var area1 = calculateRectangleArea(3, 4);
// var area2 = calculateRectangleArea(5, 8);
// var area3 = calculateRectangleArea(7, 2);
// console.log(area1);
// console.log(area2);
// console.log(area3);

/*
String() : 숫자를 문자열로 변환해주는 함수
Number() : 문자열을 숫자로 변환해주는 함수
parseInt() : 문자열 안에서 정수를 뽑아주는 함수
parseFloat() : 문자열 안에서 숫자(소수포함)을 뽑아주는 함수
alert() : 사용자에게 메세지를 띄우고, 문자열을 입력 받은 함수
confirm() : 사용자에게 메세지를 띄우고, 확인과 취소 중 하나를 누르게 하는 함수
 */

/*
if(조건부분){
  동작부분
}
*/

// var inputNumber = window.prompt('한 자리 숫자를 입력해 주세요');
// console.log(inputNumber);
// console.log(typeof inputNumber);

// var inputNumber = window.prompt('한 자리 숫자를 입력해 주세요');
// if (inputNumber === '7') {
//   alert('Lucky');
// } else if (inputNumber === '0') {
//   alert('Zero');
// } else if (inputNumber === '1') {
//   alert('one');
// } else {
//   alert('UnLucky');
// }

// var num = 3;
// if (num % 2 === 0 && num % 3 === 0) {
//   console.log(num + '는 6의 배수입니다');
// } else {
//   console.log(num + '는 6의 배수가 아닙니다');
// }

// function checkHeight() {
//   const LIMIT = 140;
//   let passMassage = '탑승이 가능합니다';
//   let failMassage = '탑승이 불가능합니다';

//   if (height >= 140) {
//     console.log(passMassage);
//   } else {
//     console.log(failMassage);
//   }
// }
// checkHeight(140);
// checkHeight(135);
// checkHeight(170);

// function printGrade(midtermScore, finalScore) {
//   var Score = midtermScore + finalScore;

//   if (Score > 90) {
//     console.log('A');
//   } else if (Score > 80) {
//     console.log('B');
//   } else if (Score > 70) {
//     console.log('C');
//   } else if (Score > 60) {
//     console.log('D');
//   } else {
//     console.log('F');
//   }
// }

// printGrade(25, 35);
// printGrade(50, 45);
// printGrade(29, 24);

function whatShould(myAge, myGender, yourAge, yourGender) {
  if (myGender === 'male') {
    if (myAge === yourAge) {
      return '친구';
    } else if (myAge < yourAge && yourGender === 'male') {
      return '형';
    } else if (myAge < yourAge && yourGender === 'female') {
      return '누나';
    } else if (myAge > yourAge && yourGender === 'male') {
      return '남동생';
    } else if (myAge > yourAge && yourGender === 'female') {
      return '여동생';
    }
  } else if (myGender === 'female') {
    if (myAge === yourAge) {
      return '친구';
    } else if (myAge < yourAge && yourGender === 'male') {
      return '오빠';
    } else if (myAge < yourAge && yourGender === 'female') {
      return '언니';
    } else if (myAge > yourAge && yourGender === 'male') {
      return '남동생';
    } else if (myAge > yourAge && yourGender === 'female') {
      return '여동생';
    }
  }
}

var result1 = whatShould(23, 'male', 25, female);
var result2 = whatShould(21, 'male', 21, female);
var result3 = whatShould(25, 'female', 22, male);

console.log(result1);
console.log(result2);
console.log(result3);

/**
switch 
*/

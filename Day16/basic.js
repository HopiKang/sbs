/*
switch
*/
// var course = 'A';

// switch (course) {
//   case 'A':
//     alert('짜장면, 짬뽕');
//     break;
//   case 'B':
//     alert('유산슬, 짜장면');
//     break;
//   case 'C':
//     alert('게살스프, 칠리새우');
//     break;
// }

// switch (course) {
//   case 'A':
//     console.log("게살스프, 칠리새우");
//   case 'B':
//     console.log("유산슬, 짜장면);
//   case 'c':
//     console.log("유산슬, 짜장면);
//     break;
// }

/*
아이유는 공연 티켓 판매 프로그램을 개발하고 있습니다
다른 부분은 어느 정도 정리가 되었고, 좌석등급에 따라서
가격을 알려주는 부분을 해결하지 못했습니다. 힘들어하는
아이유를 위해  switch문을 사용하여 각 등급이 선택 되었을때
등급에 따라 가격을 표시해주는 checkPrice함수를 만들어 보세요
*/
let VIPPrice = 15;
let Rprice = 13;
let Sprice = 10;
let Aprice = 8;

function checkPrice(x) {
  switch (x) {
    case 'VIP':
      console.log(`${x}석은 ${VIPPrice}만원 입니다.`);
      break;
    case 'R':
      console.log(`${x}석은 ${Rprice}만원 입니다.`);
      break;
    case 'S':
      console.log(`${x}석은 ${Sprice}만원 입니다.`);
      break;
    case 'A':
      console.log(`${x}석은 ${Aprice}만원 입니다.`);
      break;
  }
}
checkPrice('VIP');
checkPrice('R');
checkPrice('S');
checkPrice('A');

/*
for(초기값; 조건부분; 추가동작부분){
  동작부분 수행
}
*/

for (let i = 1; i < 10; i++) {
  console.log(`${i} 웹개발 수강생 화이팅`);
}

/*
높이에 맞게 별표로 삼각형을 그려주는 함수
TrianglePrint를 출력하는 프로그램을 만드세요 출력결과는
아래와 같습니다
높이 5
*
**
***
****
*****
높이 3
*
**
***
*/
function TrianglePrint(x) {
  star = '';
  for (let i = 1; i <= x; i++) {
    star = star + '*';
    console.log(star);
  }
}
TrianglePrint(3);
TrianglePrint(5);

/*
파라미터로 배열 arr을 받고, arr에서 두번째로 큰 숫자를
리턴시켜주는 함수 secondBigNumber(arr){

}
실행코드
console.log(secondBigNumber([4,7,2,1,9,3,6,5]))
*/
function secondBigNumber(arr) {
  let max = arr[0];
  let max2 = arr[1];
  for (let i = 1; i < length.arr; i++) {
    if (arr[i] > max) {
      max2 = max;
      max = arr[i];
    } else if (arr[i] > max2) {
      max2 = arr[i];
    }
  }
  return max2;
}
console.log(secondBigNumber([4, 7, 2, 1, 9, 3, 6, 5]));

var brands = ['hyundai', 'apple', 'samsung'];

for (let i = 0; i < 3; i++) {
  console.log(brands[i]);
}

for (value of brands) {
  console.log(value);
}

var arr = ['ameriano', 'latte', 'tea'];
for (var v of arr) {
  console.log(v);
}

for (var k in arr) {
  console.log(k);
}

/*
while (조건부분){
  동작부분
}
*/
let i = 1;
while (i <= 10) {
  console.log(`${i} 웹개발 수강생 여러분 화이팅`);
  i++;
}

/*
1이상 100이하의 홀수를 모두 출력해 보세요
*/
let j = 1;
while (j <= 100) {
  if (j % 2 == 1) {
    console.log(i);
  }
  i++;
}

/*
break
반복문의 수행부분을 중단시키고 바로 조건 부분을 확인 하고 싶을때 사용한다
*/
var k = 100;
while (true) {
  if (i % 23 == 0) {
    break;
  }
  k = k + 1;
}
console.log(k);

for (let i = 1; i <= 10; i++) {
  console.log(i);
  if (i === 7) {
    break;
  }
}

/*
continue
수행 부분을 중단 시키고 바로 조건 부분을 확인 하고 싶을때
*/
var l = 1;
while (l <= 20) {
  if (l === 5) {
    break;
  }
  console.log(l);
  l++;
}

for (let i = 1; i < 60; i++) {
  if (1 % 2 != 0) {
    continue;
  }
  console.log(i);
  i++;
}

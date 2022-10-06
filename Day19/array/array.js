let dataType = ['number', 'boolean', 'string', 'null', 'undefined', 'object'];

console.log(dataType);
for (let i = 0; i < 6; i++) {
  console.log(dataType[i]);
}

let artist = ['정국', 'RM', '진', '제이홉', '지민', '뷔'];
console.log(typeof artist);

console.log(artist.length);
console.log(artist['length']);
console.log(artist.length - 1);

/*
배열의 요소를 추가, 수정, 삭제가 가능하다
*/
artist[7] = '아이유';
console.log(artist);
//  빈칸은 empty로 나온다, 하지만 한칸추가된걸로나온다
console.log(artist.length);

delete artist[5];
console.log(artist);
// 5번째값도 empty로 나온다 즉 완벽하게 삭제된것이 아니다

//  화씨 : fahrenheit
//  섭씨 : celsius
// F = ((C * 9) / 5) * 32;
let temperature = [27, 30, 22, 28, 21, 5];
let fahrenheit = [];
for (let i = 0; i < temperature.length; i++) {
  console.log(temperature[i]);
  fahrenheit[i] = ((temperature * 9) / 5) * 32;
}

let i = 0;
while (i < temperature.length) {
  fahrenheit[i] = ((temperature[i] * 9) / 5) * 32;
  i++;
}

// splice(1) 안의 숫자에 속하는 배열을 제외한 다른객체를 삭제한다
let members = ['정국', 'RM', '진', '제이홉', '지민', '뷔'];
// console.log(members);
// delete members[5];
// console.log(members);

// members.splice(1);
// console.log(members);

console.log(members);
members.splice(1, 2, '이유', '아이');
// splice(삭제할 인덱스, 삭제할 개수, 추가할 요소, 추가할 요소)
console.log(members);

let fruits = ['사과', '토마토', '딸기', '바나나'];
let age = [28, 24, 25, 29, 30, 33];
let number = [];
/*
토마토를 삭제 사과 청포도 추가
fruits 배열의 첫 요소를 삭제
age 마지막 요소 삭제
age 2, 3 인덱스를 26 28로 변경
number 1,2,3,4,8,9 순서대로 추가
반복문을 활용해서 number 배열의 요소들 중에 홀수를 모두 삭제
*/
fruits.splice(0, 1, '사과', '청포도');
console.log(fruits);
age.splice(age.length - 1, 1);
console.log(age);
age.splice(2, 2, 26, 28);
console.log(age);
number.splice(0, 0, 1, 2, 3, 4, 8, 9);
console.log(number);
for (let i = 0; i < 6; i++) {
  if (number[i] % 2 == 1) {
    number.splice(i, 1);
    i--;
    // 자리가 삭제되서 한칸씩 당겨지는걸 신경써야한다
  }
}
console.log(number);

let number1 = [1, 2, 3, 4, 5];
console.log(number1);
number1.pop();
// 마지막요소 제거, 안에 작성하면 마지막에 추가
console.log(number1);
number.shift();
// 첫번째 요소 제거 후 제거된 요소 리턴
console.log(number1);
number.unshift(3);
// 배열의 첫번째 요소 제거, 제거된 요소 리턴
console.log(number1);
number1.push();
console.log(number1);

/*
indexof
lastindexof
array.indexof(item)
포함되어있다면 item이 있는 인덱스를 리턴
포함되어있지않다면 -1이 리턴
여러번 포함되어 있다면 처음 발견된 인덱스가 리턴
array.lastIndexOf(item)
마지막 인덱스를 리턴
 */
let brands = ['samsung', 'kakao', 'naver', 'kakao'];
console.log(brands.indexOf('kakao'));
console.log(brands.indexOf('nate'));
console.log(brands.lastIndexOf('kakao'));

/*
array.includes(item)
배열에 item이 있을경우 불린값을 반환
있으면 true 없으면 false반환
 */
console.log(brands.includes('kakao'));
console.log(brands.includes('nate'));

//reverse
//array.reverse 배열을 거꾸로 뒤집어준다
brands.reverse();
console.log(brands);

/*
for (let ele of members){
  members안에 ele 인덱스값
  console.log.(ele)
}
for (let ele in members){
  console.log.(members[ele])
}
for in문은 배열에 사용하지않는것이 좋다0
 */

//다차원배열
let twoDiens = [
  [1, 2],
  [3, 4],
];
console.log(twoDiens[0][1]);

let myrefrigerator = [
  ['참외', '오이', '사과', '양파'],
  ['김치', '가지볶음', '멸치', '장조림'],
  ['사이다', '콜라', '물', '탄산수'],
  ['메로나', '수박바', '보석바', '월드콘'],
];
let myBoxs = {
  two: ['22', '25', '28', '27'],
  four: ['45', '42', '43', '44'],
  eight: ['81', '88', '83', '85'],
  three: ['31', '33', '38', '39'],
};

let teams = [];
for (let i = 0; i < myBoxs.length; i++) {
  for (let j = 0; j < myBoxs[0].length; j++) {
    teams[j][i] = myBoxs[i][j];
  }
}
console.log(teams[0]);
console.log(teams[1]);
console.log(teams[2]);
console.log(teams[3]);

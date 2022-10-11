// 1. 지수표기
let millionaire = 1000000000;
let myNumber = 1e9;

console.log(millionaire);
console.log(myNumber);
console.log(millionaire === myNumber);
// 1e9는 지수표기법이다
// 10의 9제곱

console.log(-6.1e8 === -610000000);
console.log(3.5e-3 === 0.0035);

// 2. 진수 표기
// 16진수 표기법
let hex1 = 0xff;
// 255
let hex2 = 0xff;
// 255

// 8진법
let octal = 0o377;
// 255

// 2진법
let binary = 0b11111111;
//255

// 3. 소숫점 표기방법
let myNumber1 = 0.3591;
console.log(myNumber1.toFixed(3));
// 안의 숫자를 적어주면 소수점아래 자릿수를 고정해준다
// 0.359
console.log(typeof myNumber1.toFixed(3));
// 문자열로 나타내진다
// 숫자로 나타내려면 형변환을 시켜줘야한다 Number()
console.log(typeof +myNumber1.toFixed(3));
// 함수앞에 +를 넣으면 Number()안에 넣은것과 같은역할을 한다

// 4. 숫자 메서드 사용법
let myNumber2 = 255;

console.log(myNumber2.toString(2));
console.log(myNumber2.toString(8));
console.log(myNumber2.toString(16));
// toString은 숫자를 진법으로 나타내준다
console.log((255).toString(2));
// 숫자를 메서드에 사용할수있지만 255..나 (255).으로 사용해야한다

// 5. Math
// 절댓값
console.log(Math.abs(-10));
console.log(Math.abs(10));

// 최댓값
console.log(Math.max(2, -2, 4, 5, -8));

// 최솟값
console.log(Math.min(2, -2, 4, 5, -8));

// 제곱 2의 3재곱
console.log(Math.pow(2, 3));

// 제곱근
console.log(Math.sqrt(25));

// 반올림
console.log(Math.round(2.3));
console.log(Math.round(2.4));
console.log(Math.round(2.49));
console.log(Math.round(2.5));
console.log(Math.round(2.6));

// 버림
console.log(Math.floor(2.4));
console.log(Math.floor(2.49));
console.log(Math.floor(2.8));

// 올림
console.log(Math.ceil(2.4));
console.log(Math.ceil(2.49));
console.log(Math.ceil(2.8));

// 랜덤 0이상 1미만의 값이 랜덤으로 생성됨
console.log(Math.random());

// 6. 소숫점 계산
let sum = 0.1 + 0.2;

//소숫점 계산에는 오차가 생길수있기때문에 소숫점 자리를 정해줘야한다
console.log(sum);
console.log(Number(sum.toFixed(1)));
console.log(+sum.toFixed(1));
// 반올림
console.log(Math.round(sum * 10) / 10);

// 7. 객체의 타입
let x = 3;
let y = x;

console.log(x);
console.log(y);
y = 5;
console.log(x);
console.log(y);

let a = { name: 'hello' };
let b = a;

console.log(a);
console.log(b);
b.birth = 2022;
console.log(a);
console.log(b);
// a와 b가 연결되서 서로 같은 값을 공유하게되는것이다

let c = [1, 2, 3];
let d = c;

console.log(c);
console.log(d);
d[2] = 4;
console.log(c);
console.log(d);

// 8. 참조
let number3 = [1, 2, 3];
let number4 = number3;
// let number4 = number3.slice(); //로 해결가능하다

number3.push(4);

console.log(number3);
console.log(number4);

// 9. 객체
let course1 = {
  title: '자바스크립트 왕되기',
  language: 'Javascript',
};

let course2 = course1;
// let course2 = Object.assign({}, course1); // 로 해결가능하다

course2.title = '알고리즘 부시기';

console.log(course1);
console.log(course2);

let course3 = {};
for (let key in course1) {
  course3[key] = course1[key];
}

course3.title = '알고리즘 부시기';

console.log(course1);
console.log(course3);

/*
DOM(Document Object Model) 문서 객체 모델
웹페이지에 나타나는 html에 나타나는 객체?
윈도우 다음 도큐먼트 객체가 있다
*/

// const title = document.querySelector('#title');

// const str = 'Hello';
// const num = 123;
// const bool = true;
// const arr = {
//   name: 'Hello',
//   email: 'hello@hello.com',
// };

// function func() {
//   console.log('I love hello');
// }

// console.log('--- str ---');
// console.log(str);
// console.dir(str);
// console.log('--- num ---');
// console.log(num);
// console.dir(num);
// console.log('--- bool ---');
// console.log(bool);
// console.dir(bool);
// console.log('--- arr ---');
// console.log(arr);
// console.dir(arr);
// console.log('--- func ---');
// console.log(func);
// console.dir(func);

// console.log(str, num, bool, arr, func);
// console.dir(str, num, bool, arr, func);

/*
dir은 객체속성을 좀더 자세하게 출력해준다
여러값을 전달하더라도 첫번째 값만 출력해준다
*/

//dir과 log의 차이점
// const myDOM = document.body;
// console.log(myDOM);
// console.dir(myDOM);

// ------

const myTag = document.querySelector('#content');

console.log(myTag);

console.log(myTag.children);
console.log(myTag.firstChild);
console.log(myTag.lastChild);
console.log(myTag.parentElement);
console.log(myTag.previousSibling);
console.log(myTag.nextElementSibling);

//프로퍼티
// Node.children 자식노드 node의 자식 노드 모음
// Node.firstChild 자식노드 node의 첫번째 자식 노드 하나
// Node.lastChild 자식노드 node의 마지막 자식 노드 하나
// Node.parentElement 부모노드 node의 부모 요소 하나
// Node.previousSibling 형제 노드 node의 이전 혹은 좌측에 있는 노드
// Node.nextElementSibling 형제 노드 node의 다음 혹은 우측에 있는 노드

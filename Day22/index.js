// const tomorrow = document.querySelector('#tomorrow');
// const item = tomorrow.firstElementChild;
// const link = item.firstElementChild;

// console.log(tomorrow.getAttribute('href'));
// console.log(item.getAttribute('class'));
// // 비표준 속성을 나타내는법

// // Element.setAttribute('속성','값')
// //속성을 추가 수정
// tomorrow.setAttribute('class', 'list');
// link.setAttribute('href', 'http://www.daum.net');

// // Element.removeAttribute('속성');
// //속성 삭제
// tomorrow.removeAttribute('href');
// tomorrow.removeAttribute('class');

// //id
// console.log(tomorrow);
// console.log(tomorrow.id);

// //class
// console.log(item);
// console.log(item.className);

// //href
// console.log(link);
// console.log(link.href);
// console.log(tomorrow.href); // 비표준 속성

//-----------------------------------------------------------

const today = document.querySelector('#today');
const tomorrow = document.querySelector('#tomorrow');

// today.children[0].style.textDecoration = 'line-through';
// today.children[0].style.backgroundColor = '#DDDDDD';

// today.children[1].className = 'classStyle';
// Element.classList : add, remove, toggle

// console.log(today.classList);
// console.log(today.children[1].classList);

const item = tomorrow.children[1];
item.classList.add('classStyle');
// item.classList.add('classStyle', 'other');
//여러개 추가
item.classList.remove('classStyle');
//제거
item.classList.toggle('classStyle');
//있다면 제거 없다면 추가
item.classList.toggle('classStyle', 'false');
//remove 기능만 사용

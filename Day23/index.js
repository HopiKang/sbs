//비표준속성
// const fields = document.querySelectorAll('[field]');
// console.log(fields);

// const task = {
//   title: '노래 부르기',
//   manager: '아이유',
//   status: '',
// };

// for (let tag of fields) {
//   const field = tag.getAttribute('field');
//   tag.textContent = task[field];
// }

// const btns = document.querySelectorAll('.btn');
// for (let btn of btns) {
//   const status = btn.getAttribute('status');
//   btn.onclick = function () {
//     fields[2].textContent = status;
//     fields[2].setAttribute('status', status);
//   };
// }
// 비표준속성은 시간이 지나서 표준으로 등록되면 문제가 발생될수있다
// html은 계속 수정되고 있으므로 부작용이 생길수있다

// data -*
// data - status
// Element.dataset.status

//----------------------------------------------------------

//이벤트핸들러
// let btn = document.querySelector('#myBtn');
// btn.onclick = function () {
//   console.log('안녕하세요 여러분');
// };

// const myContent = document.querySelector('#content');
// myContent.innerHTML = '<div>hello</div>';
// myContent.className = 'button';

// let btn = document.querySelector('#myBtn');
// btn.onclick = function () {
//   console.log('안녕하세요 여러분');
// };
// btn.onclick = function () {
//   console.log('덮어써져요');
// };
//여러핸들러를 사용할수없다

// btn.onclick() = function () {
//     event1();
//     event2();
//     event3();
// }

// Element.addEventListener(event, handler)
// 여러 핸들러를 등록할수있음(가장권장)

// let btn = document.querySelector('#myBtn');

// function event1() {
//   console.log('hi');
// }

// function event2() {
//   console.log('hi');
// }

// btn.addEventListener('click', event1);
// btn.addEventListener('click', event2);

// btn.removeEventListener('click', event2);
// //두번째 이벤트 삭제

// btn.addEventListener('click', function () {
//   console.log('event3');
// });

// btn.removeEventListener('click', function () {
//   console.log('event3');
// });
////remove를 사용했지만 추가만되고 삭제되지않기때문에 함수밖에 remove를 꺼내서 사용해줘야한다(함수안에 사용햇을때)

//--------------------------------------------------------------------------

//이벤트 버블링
// const content = document.querySelector('#content');
// const title = document.querySelector('#title');
// const list = document.querySelector('#list');
// const items = document.querySelector('.item');

// content.addEventListener('click', function (e) {
//   console.log('content Event');
//   console.log(e.currentTarget);
// });

// title.addEventListener('click', function (e) {
//   console.log('title Event');
//   console.log(e.currentTarget);
// });

// list.addEventListener('click', function (e) {
//   console.log('list Event');
//   console.log(e.currentTarget);
// });

// for (let item of items) {
//   item.addEventListener('click', function (e) {
//     console.log('item Event');
//     console.log(e.currentTarget);
//     //e.stopPropagation()
//   });
// }
//한요소에 이벤트가 발생하게되면 같은 이벤트타입의 부모요소의 이벤트가 동작하게된다
//target 정상작용하지않음
//currentTarget 해당 태그의 클래스네임 아이디네임을 정상적으로 가져올수있다
//왠만하면 currentTarget 를 사용하는것이 좋다
//e.stopPropagation()은 버블링이 일어나지않게 되어있다 한마디로 item을 눌렀을때 item만 호출함
/*
1. 이벤트 캡처링 단계
-이벤트가 하위 요소로 전파되는 단계
2. 타깃 단계
-이벤트가 실제 타깃 요소로 전달되는 단계
3. 이벤트 버블링 단계
-이벤트가 상위 요소로 전파되는 단계
 */

//-------------------------------------------------------------

//테이블 정렬

grid.onclick = function (e) {
  if (e.target.tagName != 'TH') return;

  let th = e.target;
  sortGrid(th.cellIndex, th.dataset.type);
};

function sortGrid(colNum, type) {
  let tbody = grid.querySelector('tbody');

  let rowsArray = Array.from(tbody.rows);

  let compare;

  switch (type) {
    case 'number':
      compare = function (rowA, rowB) {
        return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
      };
      break;
    case 'string':
      compare = function (rowA, rowB) {
        return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
      };
      break;
  }

  rowsArray.sort(compare);
  tbody.append(...rowsArray);
}

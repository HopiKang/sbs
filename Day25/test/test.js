const link = document.querySelector('#link');
const checkbox = document.querySelector('#checkbox');
const input = document.querySelector('#input');
const text = document.querySelector('#text');

// link.addEventListener('click', function (e) {
//   e.preventDefault();
//     alert('지금은 이동할 수 없습니다.');
//     //팝업창
// });

input.addEventListener('keydown', function (e) {
  //인풋(텍스트 박스에)에 키보드 다운이 발생하면
  if (!checkbox.checked) {
    e.preventDefault();
    alert('체크박스를 먼저 체크해주세요');
  }
});

document.addEventListener('click', function (e) {
  //문서전체에 막을때는 document에 접속해야한다
  //마우스를 통제할때도  document를 사용
  e.preventDefault();
  alert('클릭할 수 없습니다');
});

//contextmenu
//마우스 오른쪽클릭

// preventDefault
// 수행될작업을 막는다
// 작업을 막을때는 한번더 생각하고 가능하면 막지않는게 좋다
// 이벤트 버블링을 회손시키기때문

// MouseEvent.button
// 0 마우스 왼쪽 버튼
// 1 마우스 휠
// 2 마우스 오른쪽 버튼

// type 안에 프로퍼티
// click 마우스왼쪽 버튼
// contextmenu 마우스 오른쪽 버튼
// dbclick 동일한 위치에 빠르게
// mousedown 누른순간
// mouseup 눌렀다 땐 순간
// 누른다면 다운 > 업 > 클릭
// 더블클릭한다면 다운 > 업 > 클릭 > 다운 > 업 > 클릭 > 더블클릭 순서로 발생

// mousemove 마우스 포인터가 이동할때 발생
// mouseover 요소 밖에서 안으로 이동
// mouseout 안에서 밖으로 이동할

//client, page, offset
// Mouseevent.clientX, clientY 화면에 표시되는 창 기준 마우스 포인터 위치
// MouseEvent.pageX, pagey 웹 문서 전체 기준 마우스 포인터 위치
// MouseEvent.offsetX, offsetY 이벤트가 발생한요소 기준 마우스 포인터 위치

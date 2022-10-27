// mousemove 마우스 포인터가 이동할때 발생
// mouseover 요소 밖에서 안으로 이동
// mouseout 안에서 밖으로 이동할

//client, page, offset
// Mouseevent.clientX, clientY 화면에 표시되는 창 기준 마우스 포인터 위치
// MouseEvent.pageX, pagey 웹 문서 전체 기준 마우스 포인터 위치
// MouseEvent.offsetX, offsetY 이벤트가 발생한요소 기준 마우스 포인터 위치

const box1 = document.querySelector('#box1');
function onMouseMove(e) {
  console.log(`client:(${e.clientX}, ${e.clientY})`);
  console.log(`page: (${(e, pageX)}, ${e.pageY})`);
  console.log(`offset: (${e.offsetX}, ${e.offset})`);
  console.log('--------------------------------------------');
}
box1.addEventListener('mousemove', onMouseMove);

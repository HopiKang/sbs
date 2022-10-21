$('#testDiv1').fadeOut();
$(document).ready(function () {
  $('#btn').click(function () {
    $('#testDiv1').fadeIn(); //기본 fadeIn 메소드
  });
});
//예시
$('#popup-trigger').on('click', popupFadeIn);
function popupFadeIn() {
  $('#popup').fadeOut(500);
}
$('#popup-trigger').on('click', popupFadeOut);
function popupFadeOut() {
  $('#popup').fadeOut(500);
}
//키보드
$(document).on('keydown', pushEscKey);
function pushEscKey(event) {
  console.log(event);
  if (event.which == '27') {
    $('#popup').fadeOut(500);
  }
}

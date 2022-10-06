$('#home').on('click', ClickHome);
$('#Seoul').on('click', ClickSeoul);
$('#Tokyo').on('click', ClickTokyo);
$('#Paris').on('click', ClickParis);

$('#photo').on('mouseenter'.mouseEnterPhoto);
$('#photo').on('mouseleave'.mouseLeavePhoto);

$(document).on('keydown', processKeyEvent);

function mouseEnterPhoto() {
  console.log('동작');
  $('photo').css('box-shadow', '5px 10px');
}

function mouseLeavePhoto() {
  console.log('동작');
  $('photo').css('box-shadow', 'none');
}

function processKeyEvent(event) {
  //event는 e로도 사용한다
  console.log('event');
  if (event['key'] === '1') {
    ClickHome();
  } else if (event['key'] === '2') {
    ClickSeoul();
  } else if (event['key'] === '3') {
    ClickParis();
  } else if (event['key'] === '4') {
    ClickTokyo();
  }
}

// function ClickHome() {
//   $('#photo').attr('src', 'images/Air.jpg');
//   $('#Home').css('fontWeight', 'bold');
//   $('#Seoul').css('fontWeight', 'normal');
//   $('#Tokyo').css('fontWeight', 'normal');
//   $('#Paris').css('fontWeight', 'normal');
// jquery를 사용하여 코드를 줄일수있다
// attr은 속성변화이다
// }

function ClickHome() {
  document.getElementById('photo').src = 'images/Home.jpg';
  document.getElementById('Home').style.fontWeight = 'bold';
  document.getElementById('Seoul').style.fontWeight = 'normal';
  document.getElementById('Tokyo').style.fontWeight = 'normal';
  document.getElementById('Paris').style.fontWeight = 'normal';
}

function ClickSeoul() {
  document.getElementById('photo').src = 'images/Seoul.jpg';
  document.getElementById('Seoul').style.fontWeight = 'bold';
  document.getElementById('home').style.fontWeight = 'normal';
  document.getElementById('Tokyo').style.fontWeight = 'normal';
  document.getElementById('Paris').style.fontWeight = 'normal';
}
function ClickTokyo() {
  document.getElementById('photo').src = 'images/Tokyo.jpg';
  document.getElementById('Tokyo').style.fontWeight = 'bold';
  document.getElementById('home').style.fontWeight = 'normal';
  document.getElementById('Paris').style.fontWeight = 'normal';
  document.getElementById('Seoul').style.fontWeight = 'normal';
}
function ClickParis() {
  document.getElementById('photo').src = 'images/Paris.jpg';
  document.getElementById('Paris').style.fontWeight = 'bold';
  document.getElementById('Tokyo').style.fontWeight = 'normal';
  document.getElementById('home').style.fontWeight = 'normal';
  document.getElementById('Seoul').style.fontWeight = 'normal';
}

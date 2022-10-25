$(window).on('scroll', function () {
  //   console.log($(window).scrollTop());
  $('.top').css('opacity', 1 - $(window.scrollTop() / $('.top').height()));
  // 1 - 0 / 300 = 1 - 0 = 1 스크롤바가 제일 위에 있을경우
  // scroll이 100일경우 1 -100 / 200 = 1 - 0.5 = 0.5 반정도 투명
});

$('.go-to-top').on('click', function () {
  //   $(window).scrollTop(0);
  //스크롤 0위치로 바로이동
  $('html,body').animate({ scrollTop: 0 }, 500);
  //스크롤 0위치까지 0.5초
});

//jquery - each메서드 사용하기

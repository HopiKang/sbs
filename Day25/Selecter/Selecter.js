$('.btn-1').on('click', function () {
  $('.card').removeClass('selected');
  $('.card').each(function () {
    console.log($(this).text());
    if (Number($(this).text()) % 2 == 0) {
      $(this).addClass('selected');
    }
  });
});

$('.btn-2').on('click', function () {
  $('.card').removeClass('selected');
  $('.card').each(function () {
    console.log($(this).text());
    if (Number($(this).text()) % 2 == 1) {
      $(this).addClass('selected');
    }
  });
});

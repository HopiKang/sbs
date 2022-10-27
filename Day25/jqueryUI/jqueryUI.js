$(document).ready(function () {
  $('button').on('click', function () {
    $('div').animate({ left: '250px' });
  });
});

$(document).ready(function () {
  $('button').on('click', function () {
    $('div').animate({ left: '250px', opacity: 0.5 });
  });
});

$(document).ready(function () {
  $('button').on('click', function () {
    $('div').animate({ left: '+=250px', opacity: 0.5 });
  });
});

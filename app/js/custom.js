$('._popup').hide();
$('.main').show();

$(function () {
  //  popup
  $('.popup-close').click(function () {
    $(this).closest('._popup').fadeOut();
  });

  $('.test-start').click(function () {
    $('.authorization').fadeIn();
  });
  //  auth
  $('.social._auth').click(function () {
    $(this).closest('._popup').fadeOut();
    $('section').removeClass('active');
    $('.test').addClass('active').find('.nomination').first().fadeIn();;
  });
  //test
  $('.vote').click(function () {
    $(this).closest('.nomination').hide().next('.nomination').fadeIn();
    if ($(this).closest('.nomination').hasClass('auto')){
      $('.test').fadeOut();
    }
  })

});
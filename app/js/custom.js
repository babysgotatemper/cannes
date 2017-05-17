$('._popup').hide();
$('.main').show();

$(function () {
  //  popup
  $('.popup._send').hide();
  $('.popup-close').click(function () {
    $(this).closest('.popup').fadeOut();

  });

  $('.test-start').click(function () {
    $('.authorization').fadeIn();
  });
  //test
  $('.vote').click(function () {
    $(this).closest('.nomination').hide().next('.nomination').fadeIn();
    if ($(this).closest('.nomination').hasClass('auto')) {
      $('.popup._send').fadeIn();
    }
  });

  //nomination
  $('.nomination__btn._left').click(function () {
    $(this).closest('.nomination').hide().prev('.nomination').fadeIn();
  });

  $('.nomination__btn._right').click(function () {
    $(this).closest('.nomination').hide().next('.nomination').fadeIn();
  })

  //popup
  $('.nomination-popup__close').click(function () {
    $(this).closest('.nomination-popup').fadeOut();
    //    var video = $(this).closest('.nomination-popup').find('iframe');
    //    video.stopVideo();
    jQuery("iframe").each(function () {
      jQuery(this)[0].contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*')
    });

  })
  $('.read-more').click(function () {
    var attr = $(this).attr('data-btn');
    $('[data-popup=' + attr + ']').fadeIn();
  })

});
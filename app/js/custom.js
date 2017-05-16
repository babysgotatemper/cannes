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
//		$(this).closest('.nomination-popup').find('iframe')
//		$('iframe').each(function(index) {
//        $(this).attr('src', $(this).attr('src'));
//        return false;
//      });
	})
	$('.read-more').click(function () {
		var attr = $(this).attr('data-btn');
		$('[data-popup=' + attr + ']').fadeIn();
	})

});
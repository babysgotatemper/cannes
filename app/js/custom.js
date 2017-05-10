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
	});
	//test
	$('.vote').click(function () {
		$(this).closest('.nomination').hide().next('.nomination').fadeIn();
		if ($(this).closest('.nomination').hasClass('auto')) {
			$('.authorization').fadeIn();
		}
	})
	
//		$(".nomination__item")
//		.mouseenter(function () {
//			$(this).closest('.nomination').find('.nomination__item').css("color", "red");
//		})
//		.mouseleave(function () {
//			$(this).closest('.nomination').find('.nomination__item').css("width", "20vh");
//		});

});
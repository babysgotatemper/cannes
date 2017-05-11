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
	})
	
//		$(".nomination__item")
//		.mouseenter(function () {
//			$(this).closest('.nomination').find('.nomination__item').css("color", "red");
//		})
//		.mouseleave(function () {
//			$(this).closest('.nomination').find('.nomination__item').css("width", "20vh");
//		});

});
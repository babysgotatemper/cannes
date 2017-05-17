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
	$(function () {
		//Snag the URL of the iframe so we can use it later
		var url = $('.video-container iframe').attr('src');
		$('p.video-button a').click(function () {
			$('.video-container').show();
			//Below we remove the URL to stop the video from playing, here we add it back in
			$('.video-container iframe').attr('src', url);
		});
		$('p.close-video a').click(function () {
			$('.video-container').hide();
			//Assign the iframe's src to null, which kills the video
			$('.video-container iframe').attr('src', '');
		});
	});

	var url;
	$('.read-more').click(function () {
		var attr = $(this).attr('data-btn');
		$('[data-popup=' + attr + ']').fadeIn();
		url = $('[data-popup=' + attr + ']').find('iframe').attr('src');
		console.log(url);
	})
	$('.nomination-popup__close').click(function () {
		$(this).closest('.nomination-popup').fadeOut();
		$(this).closest('.nomination-popup').find('iframe').attr('src', '')
		$(this).closest('.nomination-popup').find('iframe').attr('src', url)
	})

});
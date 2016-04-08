$window = $(window)
$root = $('.b-page')
$header = $('.js-header')
$menu = $('.js-menu')

$('#fullpage').fullpage({
	'verticalCentered': false,
	navigation: true,
	css3: true, 
	afterLoad: (anchorLink, index) ->
		if(index == 3)
			$header.addClass('b-header--inverse')
		else
			$header.removeClass('b-header--inverse')

		console.log(index)

	afterResize: () ->
		console.log("afterResize");
});


$('.js-image-toggle').on('click', () ->
	$('.js-image-toggle').removeClass('active')
	$(this).addClass('active')

	$('.js-image').removeClass('active')
	$($(this).attr('href')).addClass('active')

	return false;
)

$('.js-move-section-down').on('click', (e) ->
	e.preventDefault();
	$.fn.fullpage.moveSectionDown();
);
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
			$('.b-sidebar__link').addClass('b-sidebar__link--white')

		else
			$header.removeClass('b-header--inverse')
			$('.b-sidebar__link').removeClass('b-sidebar__link--white')


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

$('.js-menu-toggle').on('click', (e) ->
	e.preventDefault();
	$('.b-sidebar__menu').addClass('b-sidebar__menu--open')
	$('.b-sidebar').addClass('b-sidebar--opened')
	$(this).addClass('b-toggle--close')

	e.stopPropagation();
	return false
)

$('.b-page').on('click', (e) ->
	e.preventDefault();
	$('.b-sidebar__menu').removeClass('b-sidebar__menu--open')
	$('.b-sidebar').removeClass('b-sidebar--opened')
	$('.b-toggle').removeClass('b-toggle--close')
)

$('.b-sidebar').on('click', (e) ->
	e.preventDefault();
	e.stopPropagation();
	
)

$('.b-menu__item').on('click', (e) ->
	$.fn.fullpage.moveTo($(this).data('section'));
	return false
)

owl = $('.js-slider');

owl.owlCarousel({
	loop: true,
	autoPlay: true,
	nav:false,
	dots:false,
	margin: 10,
	items:1,
	autoHeight:true
})

$('.b-nav--next').on('click', (e) ->
	owl.trigger('next.owl.carousel');
)

$('.b-nav--prev').on('click', (e) ->
	owl.trigger('prev.owl.carousel');
)
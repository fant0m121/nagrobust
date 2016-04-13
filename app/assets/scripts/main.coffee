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

		if(index == 1 || index == 4 || index == 3)
			$('.b-sidebar__link').addClass('b-sidebar__link--white')
			$('.b-sidebar__copy').addClass('b-sidebar__copy--white')

		else
			$('.b-sidebar__link').removeClass('b-sidebar__link--white')
			$('.b-sidebar__copy').removeClass('b-sidebar__copy--white')


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
	$('.b-sidebar__menu').removeClass('b-sidebar__menu--open')
	$('.b-sidebar').removeClass('b-sidebar--opened')
	$('.b-toggle').removeClass('b-toggle--close')
)

$('.b-sidebar').on('click', (e) ->
	e.stopPropagation();
	
)
$('.b-calc__input').on('change', (e) ->
	$('.js-price').text(($('input[name="distance"]').val() / 100)*$('input[name="consumption"]').val()*$('input[name="price"]').val())
)

$('.js-move-to').on('click', (e) ->
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

$('.js-show-modal').on('click', (e) ->
	event.preventDefault();

	$.magnificPopup.open({
		items: {
			src: $(this).attr('href')
		},
		type: 'inline'
	});
)

$('.js-show-image').on('click', (e) ->
	event.preventDefault();

	$.magnificPopup.open({
		items: {
			src: $(this).attr('href')
		},
		type: 'image'
	});
)

$('.js-form-callback').on('submit', (e) ->

	formData = $(this).serializeObject();
	sendData =
		potential_customer: formData,
	

	$.ajax({
		type: 'POST'
		url: '/ajax/form-callback/'
		data: JSON.stringify(sendData)
		contentType: "application/json"
		dataType: 'json'
		success: () ->
			$('.js-form-callback').find('.b-form__fieldset').hide()
			$('.js-success-callback').show()

		error: (e) ->
			console.log(e)
			$('.js-form-callback').find('.b-form__fieldset').hide()
			$('.js-success-callback').show()
			
	});

	e.preventDefault();
)
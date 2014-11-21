class Samepage.Landing extends Backbone.View

	className:  'landing'

	template: JST['templates/landing']

	initialize: (options) ->
		@app = options.app
		@page_animation()
		@render()
		@position()
		@set_background()
		@text_slider()
		@icon_slider()
		@wow_js()
		@waypoints_section_2()
		@waypoints_section_3()
		@waypoints_section_4()
		@waypoints_section_5()
		@waypoints_section_6()
		@move_envelope()

	events: 
		'click .down-arrow' : 'scroll_down'


	scroll_down: ->
		scrollElement =  $('.title').offset().top
		$('body').animate({scrollTop: scrollElement}, 2000)

	waypoints_section_2: ->
		@$('.text-slider').waypoint( (direction)->
		 if direction is "down"
				$('.title h1').show().addClass('animated fadeInRight')
				$('.image').addClass('roll-in')
				window.setTimeout (->
				  $('.title p').show().addClass('animated fadeInRight')
				  # return
				), 500
		 else 
		    $('.title h1').removeClass('fadeInRight').hide()
		    $('.image').removeClass('roll-in')
		    $('.title p').removeClass('fadeInRight').hide()
		    )

	waypoints_section_3: ->
		@$('.section-2').waypoint( (direction) ->
		 if direction is "down"
		 		$('.title-3').css('opacity', '1')
		 		$('.title-3 h1').show().addClass('animated fadeInLeft')
		 		$('.image-3').addClass('roll-in')
		 		window.setTimeout (->
		 			$('.title-3 p').show().addClass('animated fadeInLeft')
		 			), 500
		 else
		 	$('.title-3 h1').removeClass('fadeInLeft').hide()
		 	$('.image-3').removeClass('roll-in')
		 	$('.title-3 p').removeClass('fadeInLeft').hide()		
			)

	waypoints_section_4: ->
		@$('.section-3').waypoint( (direction)->
		 if direction is "down"
				$('.title-4 h1').show().addClass('animated fadeInRight')
				$('.image-4').addClass('roll-in')
				window.setTimeout (->
				  $('.title-4 p').show().addClass('animated fadeInRight')
				  # return
				), 500
		 else 
		    $('.title-4 h1').removeClass('fadeInRight').hide()
		    $('.image-4').removeClass('roll-in')
		    $('.title-4 p').removeClass('fadeInRight').hide()
		    )

	waypoints_section_5: ->
		@$('.section-4').waypoint( (direction) ->
		 if direction is "down"
		 		$('.title-5').css('opacity', '1')
		 		$('.title-5 h1').show().addClass('animated fadeInLeft')
		 		$('.image-5').addClass('roll-in')
		 		window.setTimeout (->
		 			$('.title-5 p').show().addClass('animated fadeInLeft')
		 			), 500
		 else
		 	$('.title-5 h1').removeClass('fadeInLeft').hide()
		 	$('.image-5').removeClass('roll-in')
		 	$('.title-5 p').removeClass('fadeInLeft').hide()		
			)

	waypoints_section_6: ->
		@$('.section-5').waypoint( (direction) ->
			if direction is "down"
				$('.section-6-content h1').show().addClass('animated fadeInUp')
				window.setTimeout (->
					$('.one').show().addClass('animated fadeInUp')
					), 500
				window.setTimeout (->
					$('.two').show().addClass('animated fadeInUp')
					), 700
				window.setTimeout (->
					$('.three').show().addClass('animated fadeInUp')
					), 900
				window.setTimeout (->
					$('.four').show().addClass('animated fadeInUp')
					), 1100
			else
			  $('.section-6-content h1').removeClass('fadeInUp').hide()
			  $('.section-6-content p').removeClass('fadeInUp').hide()
			)

	move_envelope: ->
		counters = ['800px', '0px']
		counter = 0
		# window.setInterval(->
		# 	if counter is 1
		# 		counter = 0
		# 		$('.moving-envelope').animate({left: counters[counter]}, 10000)
		# 	else
		# 		$('.moving-envelope').animate({left: counters[counter]}, 10000)
		# 		counter++

		# ), 10000

		window.setInterval (->
		  if counter is 2
		  	counter = 0
		  	$('.moving-envelope').animate({left: counters[counter]}, 10000)
		  else
		  	$('.moving-envelope').animate({left: counters[counter]}, 10000)
		  	counter++
		), 10000

	rotate:  ->
		console.log 'added'
		@$('.icon').addClass('roll-in')

	text_slider: ->
		text = ["<p class='animated fadeInUp'>We are <span>SamePage</span></p>", "<p class='animated fadeInUp'>Patient <span>Engagement</span></p>", "<p class='animated fadeInUp'>Behavior <span>Change</span></p>", "<p class='animated fadeInUp'>Collaborative <span>Care</span></p>"]
		counter = 0
		window.setInterval (->
			if counter is 3
				counter = 0
			else
				counter++
			
			@$('.text').html(text[counter])
		  # return
		), 2000

	icon_slider: ->
		counter = 0
		icons = ["<i class='fa fa-users' style='font-size:9em; margin-top: 30px;'></i>","<i class='fa fa-desktop' style='font-size:8em; margin-top: 45px;'></i>", "<i class='fa fa-user-md'></i>", "<i class='fa fa-medkit' style='font-size: 9em; margin-top: 25px;'></i>"]
		window.setInterval (->
			if counter is 3
				counter = 0
			else
				counter++
			
			@$('.icon').html(icons[counter])
			@$(".icon").toggleClass('roll-in')

		), 2000

	wow_js: ->
		new WOW().init()

	set_background: ->
		height = $(window).height()
		$('.background').css('height',"#{height}px")

	page_animation: ->
		$('body').css('display', 'none')
		$('body').fadeIn(2000)

	render: ->
		@$el.html @template()

	position: ->
		$('body').html @$el


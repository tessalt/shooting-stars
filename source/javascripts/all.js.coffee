#= require_tree .

w = document.documentElement.clientWidth
h = document.documentElement.clientHeight

canvas = new Raphael(0,0,w, h)

colours = ["#9BB0FF", "#AABFFF", "#CAD7FF", "#F8F7FF", "#F8F7FF", "#FFD2A1", "#FFCCDF"]

stars = []

class Star
	
	constructor: (posX, posY) -> 
		startX	= posX or Math.random() * w
		startY 	= posY or Math.random() * h
		fill 		= Math.floor(Math.random() * colours.length)
		@opacity = Math.random()
		@radius 	= Math.random() * 2.5
		@circle  = canvas.circle startX, startY, @radius
		@circle.attr "fill", colours[fill]
		@circle.attr "opacity", @opacity
	
	twinkle: ->		
		pulseOut = () => 
			@circle.animate
				r: @radius + 1,
				opacity: 1
			, 500, pulseIn
		pulseIn = () =>
			@circle.animate
				r: @radius,
				opacity: @opacity
			, 500		
		pulseOut()		
	
	shoot: ->
		finalX 	= Math.random() * w
		finalY = (if Math.random() > 0.5 then 0 else h)
		anim = Raphael.animation(
		  cx: finalX
		  cy: finalY
		, 300, "linear", ->
		  @remove()
		)
		@circle.animate(anim)

createStars = (count) ->
	for [1..count]		
		star = new Star() 
		stars.push star

createShootingStar = () ->
	shootingStar = new Star(w/2, h/2)
	shootingStar.shoot()

twinkleStars = () ->
	star = Math.floor(Math.random() * stars.length)
	stars[star].twinkle()

createStars(600)

setInterval createShootingStar, 500

setInterval twinkleStars, 1000
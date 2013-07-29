#= require_tree .

w = document.documentElement.clientWidth
h = document.documentElement.clientHeight
canvas = new Raphael(0,0,w, h)

class Star
	constructor: (posX, posY) -> 
		startX	= posX or Math.random() * w
		startY 	= posY or Math.random() * h
		radius 	= Math.random() * 2.5
		@circle  = canvas.circle startX, startY, radius
		@circle.attr "fill", "white"
		@circle.attr "opacity", Math.random()
	animate: ->
		finalX 	= Math.random() * w
		finalY = (if Math.random() > 0.5 then 0 else h)
		anim = Raphael.animation(
		  cx: finalX
		  cy: finalY
		, 500, "linear", ->
		  @remove()
		)
		@circle.animate(anim)

createStars = (count) ->
	star = new Star() for [1..count]		

createShootingStar = () ->
	shootingStar = new Star(w/2, h/2)
	shootingStar.animate()

createStars(300)

setInterval createShootingStar, 500
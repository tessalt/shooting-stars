#= require_tree .

w = document.documentElement.clientWidth
h = document.documentElement.clientHeight

canvas = new Raphael(0,0,w, h)

colours = ["#9BB0FF", "#AABFFF", "#CAD7FF", "#F8F7FF", "#F8F7FF", "#FFD2A1", "#FFCCDF"]

class Star
	constructor: (posX, posY) -> 
		startX	= posX or Math.random() * w
		startY 	= posY or Math.random() * h
		radius 	= Math.random() * 2.5
		fill 		= Math.floor(Math.random() * colours.length)
		@circle  = canvas.circle startX, startY, radius
		@circle.attr "fill", colours[fill]
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

createStars(600)

setInterval createShootingStar, 500
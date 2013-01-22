# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(".section").hide()
	$(".menu_items h2").toggle (->
		$(this).next(".section").slideDown(500)
	), -> 
		$(this).next(".section").slideUp(500)

	$(".menu_accordian").toggle (->
		$(this).next().show()
	), -> 
		$(this).next().hide()


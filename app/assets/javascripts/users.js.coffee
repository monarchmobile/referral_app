# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
	$('form').on 'click', '.remove_fields', (event) ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('li').hide()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
	    time = new Date().getTime()
	    regexp = new RegExp($(this).data('id'), 'g')
	    $(this).before($(this).data('fields').replace(regexp, time))
	    event.preventDefault()

	$('.best_in_place').best_in_place()

	# $('li.project').hover (->
	# 	$(this).parent().parent().next(".referral_slip").show()
	# ), ->
	# 	$(this).parent().parent().next(".referral_slip").hide()

	$('li.project').toggle (->
		$(this).parent().parent().next(".referral_slip").show()
	), ->
	 	$(this).parent().parent().next(".referral_slip").hide()

	$('li.show_more').hover (->
		$(".contact_info").hide()
		$(this).parent().parent().next(".contact_info").show()
	), ->
		$(this).parent().parent().next(".contact_info").hide()

	# not working 
	$(".close.btn").click ->
		$(".new_note_form").hide()

	$(".view_notes").toggle (->
		# $(this).parent().parent().parent().parent().parent().next().next().show()
		$(this).closest(".dash_instance").children().last().show()
	), ->
		$(this).closest(".dash_instance").children().last().hide()




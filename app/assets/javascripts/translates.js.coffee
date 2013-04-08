# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ = jQuery

$(document).ready ->
  $("#translate_submit").click ->
    box = $("#translate_box").val()
    $.ajax "/translate",
      type: "POST",
      data: "phrase=" + box,
      statusCode: {
        200: (data, textStatus, jqXHR) ->
          console.log(data)
          $("#results").html(data.responseText)
      }

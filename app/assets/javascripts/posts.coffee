$(document).on "page:change", ->
  $('#comment-link').click  (event) ->
    event.preventDefault()
    $('#comments-section').fadeToggle()
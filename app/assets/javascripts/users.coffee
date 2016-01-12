$(document).ready ->
  setTimeout (-> $('#notice').slideUp("slow")), 3000

  # This is for checking if a username has been taken
  typingTimer = null
  $("#user_nickname").keyup ->
    clearTimeout(typingTimer)
    if $("#user_nickname").val
      typingTimer = setTimeout doneTyping, 2500

  doneTyping = ->
    clearTimeout(typingTimer)
    username = $("#user_nickname").val().replace /^\s+|\s+$/g, ""
    $.ajax
      type: "POST"
      url: "/user/name/taken/#{username}"
      data: username
      success: checkUsernameResponse
      dataType: "json"

  checkUsernameResponse = (data)->
    if data.taken
      $("#hidden-taken-nickname").show()
    else
      $("#hidden-taken-nickname").hide()

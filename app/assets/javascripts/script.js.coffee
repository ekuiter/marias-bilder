func = ->
  $("header a").hover (->
    $("header").css "background-position", "top"
  ), ->
    $("header").css "background-position", "bottom"
$(document).ready func
$(document).on "page:load", func
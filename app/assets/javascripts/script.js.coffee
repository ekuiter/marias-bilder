func = ->
  $("header a#title").hover (->
    $("header").css "background-position", "top"
  ), ->
    $("header").css "background-position", "bottom"
  $('.zoom').jqzoom {  
    title: false,
    zoomWidth: 300,  
    zoomHeight: 250
  }
$(document).ready func
$(document).on "page:load", func
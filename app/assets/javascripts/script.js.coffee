$(document).ready ->
  $("header a").hover (->
    $("header").css "background-position", "top"
  ), ->
    $("header").css "background-position", "bottom"
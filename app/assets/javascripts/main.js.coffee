$ ->
  animateFlashMessages()
  
animateFlashMessages = ->
  flash = $(".flash")
  # Nothing to show? Get out...
  return if not flash.html()
  
  setTimeout(
    () -> flash.fadeOut(
      800
      () -> flash.hide()
    )
    3000
  )

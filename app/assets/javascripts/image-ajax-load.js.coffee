$ ->
  window.image_source = $('img.ajax-load').attr('src')
  $('img.ajax-load').attr('src', 'assets/ajax_loader.gif')

  setImageSource()

checkForImage = ->
  $.get(image_source).success(setImageSource).error(setCheckForImageTimeout)

setCheckForImageTimeout = ->
  window.checkImageTimeout = setTimeout(checkForImage, 500)

setImageSource = ->
  $('img.ajax-load').attr('src', image_source)
  clearTimeout(checkImageTimeout) if checkImageTimeout?
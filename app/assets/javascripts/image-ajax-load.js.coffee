$ ->
  $('#current-opic').append('<div class="progress progress-striped active"><div class="bar" style="width: 100%"></div></div>')
  window.image_source = $('img.ajax-load').attr('src')
  $('img.ajax-load').attr('src', 'assets/p400_brutus_buckeye.png')
  checkForImage()

checkForImage = ->
  $.get(image_source).success(showImage).error(checkForImageLater)

checkForImageLater = ->
  window.checkImageTimeout = setTimeout(checkForImage, 500)

showImage = ->
  $('img.ajax-load').attr('src', image_source)
  $('#current-opic .progress').remove()
  clearTimeout(checkImageTimeout) if checkImageTimeout?
jQuery ->
  $('.search-query').autocomplete
    source: "/autocompletes/vendors"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('.search-query').val ui.item.value
        $('.hidden #user_id').val ui.item.id
  
  $('#money').maskMoney();
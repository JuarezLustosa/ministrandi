jQuery ->
  $('#autocomplete_feedstock').autocomplete
    minLength: 2
    source: "/autocompletes/feedstocks"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#feedstock_id').val ui.item.id
        
jQuery ->
  $('#autocomplete_feedstock').focus()
  
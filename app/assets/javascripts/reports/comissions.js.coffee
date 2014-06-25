jQuery ->
  $('#autocomplete_vendor').autocomplete
    source: "/autocompletes/vendors"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#vendor_id').val ui.item.value
        $('#vendor_id').val ui.item.id

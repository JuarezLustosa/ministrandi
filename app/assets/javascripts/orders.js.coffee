jQuery ->
  $('#order_vendor').autocomplete
    source: "/autocompletes/vendors"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#order_vendor').val ui.item.value
        $('#order_user_id').val ui.item.id

jQuery ->
  $('#order_client').autocomplete
    source: "/autocompletes/clients"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#order_client').val ui.item.value
        $('#order_client_id').val ui.item.id

jQuery ->
  $('#order_client').focus();  
  $("#order_date").mask("99/99/9999");
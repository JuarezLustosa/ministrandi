jQuery ->
  $('#search_cep').autocomplete
    source: "/autocompletes/search_postal_codes"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#stock_product').val ui.item.value
        $('#stock_product_id').val ui.item.id
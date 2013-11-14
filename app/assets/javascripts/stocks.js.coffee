jQuery ->
  $('.search-query').autocomplete
    source: "/search_suggestions"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#stock_product').val ui.item.value
        $('#stock_product_id').val ui.item.id

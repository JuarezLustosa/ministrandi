jQuery ->
  $('#product').autocomplete
    source: "/autocompletes/stock_stores"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.id
        $('#unit_price').val ui.item.retail_price
        $('.simple_form').submit()
        

jQuery ->
  $('#autocomplete_product').autocomplete
    minLength: 2
    source: "/autocompletes/stock_industries"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#product_id').val ui.item.id
        $('#unit_price').val ui.item.wholesale
        
jQuery ->
  $('#autocomplete_exchange_product').autocomplete
    minLength: 2
    source: "/autocompletes/stock_industries"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#exchange_product_id').val ui.item.id

jQuery ->
  $('#button_exchange').click ->
    $('#exchangeitems').show "fold", 1000 
  
  
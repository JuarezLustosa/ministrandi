jQuery ->
  $('#autocomplete_product').autocomplete
    minLength: 2
    source: "/autocompletes/stock_industries"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#product_id').val ui.item.id
        $('#unit_price').val ui.item.wholesale
        $('#quantity').focus()
        
jQuery ->
  $('#autocomplete_exchange_product').autocomplete
    minLength: 2
    source: "/autocompletes/stock_industries"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#exchange_product_id').val ui.item.id
        $('#exchange_quantity').focus()

jQuery ->
  $('#button_exchange').click ->
    $('#exchangeitems').show "fold", 1000
    $('#descount_form').hide()
    $('#autocomplete_exchange_product').focus()

  $('#button_descount').click ->
    $('#descount_form').show "fold", 1000 
    $('#exchangeitems').hide()
    $('#descount_total').focus()
  
  $('#descount_total').maskMoney()
  $('#unit_price').maskMoney()
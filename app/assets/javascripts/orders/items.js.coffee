jQuery ->
  $('#autocomplete_product').autocomplete
    minLength: 2
    source: "/autocompletes/products"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#product_id').val ui.item.id
        console.log(ui.item.wholesale)
        $('#unit_price').val ui.item.wholesale
jQuery ->
  $('#bill_supplier').autocomplete
    minLength: 3
    source: "/autocompletes/suppliers"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#bill_supplier_id').val ui.item.id

    $('#price_unit').maskMoney();
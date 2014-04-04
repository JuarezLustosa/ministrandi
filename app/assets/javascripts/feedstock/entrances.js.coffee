jQuery ->
  $('#feedstock_entrance_supplier').autocomplete
    minLength: 3
    source: "/autocompletes/suppliers"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#feedstock_entrance_supplier_id').val ui.item.id

  $("#feedstock_entrance_date").mask("99/99/9999");
  $("#feedstock_entrance_freight_price").maskMoney();
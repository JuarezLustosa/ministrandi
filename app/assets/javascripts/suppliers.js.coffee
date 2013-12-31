jQuery ->
  $('#supplier_address_attributes_cep').autocomplete
    minLength: 7 
    source: "/autocompletes/search_postal_codes"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.cep
        $('#supplier_address_attributes_cep').val ui.item.label
        $('#supplier_address_attributes_street').val ui.item.street
        $('#supplier_address_attributes_street_type').val ui.item.street_type
        $('#supplier_address_attributes_neighborhood').val ui.item.neighborhood
        $('#supplier_address_attributes_city').val ui.item.city
        $('#supplier_address_attributes_state').val ui.item.state
        $('#supplier_address_attributes_number').focus()

  $('#supplier_address_attributes_city').autocomplete
    minLength: 3
    source: "/autocompletes/search_cities"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#supplier_address_attributes_city_id').val ui.item.id
  
  $("#supplier_cnpj").mask("99.999.999/9999-99");
  $("#supplier_address_attributes_cep").mask("99999-999");
    
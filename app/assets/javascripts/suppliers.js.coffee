jQuery ->
  $('#supplier_address_attributes_cep').autocomplete
    minLength: 7 
    source: "/autocompletes/search_postal_codes"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#supplier_address_attributes_street').val ui.item.street
        $('#supplier_address_attributes_cep').val ui.item.cep
        $('#supplier_address_attributes_street_type').val ui.item.street_type
        $('#supplier_address_attributes_neighborhood').val ui.item.neighborhood
        $('#supplier_address_attributes_city').val ui.item.city
        $('#supplier_address_attributes_state').val ui.item.state

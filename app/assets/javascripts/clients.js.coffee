jQuery ->
  $('#client_person').change ->
    if this.checked  
      $('#person').show()
      $('#company').hide()
    else
      $('#person').hide()
      $('#company').show()
      
jQuery ->      
  $('#client_address_attributes_cep').autocomplete
    minLength: 7 
    source: "/autocompletes/search_postal_codes"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.cep
        $('#client_address_attributes_cep').val ui.item.label
        $('#client_address_attributes_street').val ui.item.street
        $('#client_address_attributes_street_type').val ui.item.street_type
        $('#client_address_attributes_neighborhood').val ui.item.neighborhood
        $('#client_address_attributes_city').val ui.item.city
        $('#client_address_attributes_state').val ui.item.state
        $('#client_address_attributes_number').focus()
        
jQuery -> 
  $('#client_address_attributes_city').autocomplete
    minLength: 3
    source: "/autocompletes/search_cities"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#client_address_attributes_city_id').val ui.item.id
        
jQuery -> 
  $("#client_cnpj").mask("99.999.999/9999-99");
  $("#client_phone1").mask("(99) 9999-9999");
  $("#client_address_attributes_cep").mask("99999-999");

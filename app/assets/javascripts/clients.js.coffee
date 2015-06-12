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
  $("#client_cpf").mask("999.999.999-99");
  $("#client_phone1").mask("(99) 9999-9999");
  $("#client_address_attributes_cep").mask("99999-999");
  
  
jQuery ->
  $('#clients_table').dataTable oLanguage:
    sEmptyTable: "Nenhum registro encontrado na tabela"
    sInfo: "Mostrar _START_ até _END_ do _TOTAL_ registros"
    sInfoEmpty: "Mostrar 0 até 0 de 0 Registros"
    sInfoFiltered: "(Filtrar de _MAX_ total registros)"
    sInfoPostFix: ""
    sInfoThousands: "."
    sLengthMenu: "Mostrar _MENU_ registros por pagina"
    sLoadingRecords: "Carregando..."
    sProcessing: "Processando..."
    sZeroRecords: "Nenhum registro encontrado"
    sSearch: "Pesquisar"
    oPaginate:
      sNext: "Proximo"
      sPrevious: "Anterior"
      sFirst: "Primeiro"
      sLast: "Ultimo"

    oAria:
      sSortAscending: ": Ordenar colunas de forma ascendente"
      sSortDescending: ": Ordenar colunas de forma descendente"

jQuery ->
  $('#client_vendor').autocomplete
    source: "/autocompletes/vendors"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#client_vendor').val ui.item.value
        $('#client_user_id').val ui.item.id


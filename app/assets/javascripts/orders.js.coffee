jQuery ->
  $('#order_vendor').autocomplete
    source: "/autocompletes/vendors"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#order_vendor').val ui.item.value
        $('#order_user_id').val ui.item.id

jQuery ->
  $('#order_client').autocomplete
    source: "/autocompletes/clients"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#order_client').val ui.item.value
        $('#order_client_id').val ui.item.id

jQuery ->
  $('#order_client').focus();  
  $("#order_date").mask("99/99/9999");
  
jQuery ->
  $('#orders_table').dataTable oLanguage:
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
    
    
jQuery ->
  $('#stock_product').autocomplete
    source: "/search_suggestions"
    select: (event, ui) ->
        event.preventDefault()
        $(this).val ui.item.label
        $('#stock_product').val ui.item.value
        $('#stock_product_id').val ui.item.id

jQuery ->
  $('#stocks_table').dataTable oLanguage:
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


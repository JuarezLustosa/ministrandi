jQuery ->
  $('#product_name').focus();
  $('#product_retail_price').maskMoney();
  $('#product_wholesale').maskMoney();
  $('#product_wholesale_term').maskMoney();
  $('#product_cost_price').maskMoney();
 

jQuery ->
  $('#products_table').dataTable oLanguage:
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


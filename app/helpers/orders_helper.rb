module OrdersHelper
  
  def today_or_order_date(order)
    date_translation(order.date || Date.today)
  end

  def link_to_edit(order)
  	link_to('Editar', edit_order_path(order), 
  		class: "fa fa-edit btn btn-sm btn-primary").html_safe unless can_edit?(order)
  end

  def link_to_delete(order)
  	link_to( 'Apagar', order, 
  		method: :delete, 
  		data: {confirm: 'Tem certeza que deseja excluir?'}, 
  		class: 'fa fa-trash-o btn btn-sm btn-danger').html_safe unless can_edit?(order)	
  end

  def link_to_print_production(order)
  	link_to(' Imprimir Ficha de Produção', print_order_path(order), 
  		class: 'fa fa-print btn btn-default btn-sm').html_safe unless can_print_production?(order)
  end

  def link_to_print_done(order)
  	link_to(' Imprimir pedido pronto', print_done_order_path(order),
  		class: 'fa fa-print btn btn-default btn-sm').html_safe if can_print_done?(order)
  end

  def can_edit?(order)
 		order.cancel? or order.delivered?
  end

  def can_print_production?(order)
  	order.cancel? or order.delivered? or order.ready? or order.incomplete?
  end

  def can_print_done?(order)
  	order.ready? or order.delivered?
  end
end

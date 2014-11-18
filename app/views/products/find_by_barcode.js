<% if @product %>
	$('#product_id').val('<%= @product.try :id %>');
	$('#autocomplete_product_in_store').val('<%= @product.try :name %>');
	$('#unit_price').val('<%= @product.try :retail_price %>');
	$('#cashier_sales_item_form').submit();
	$('#quantity').val('<%= 1 %>');
	$('#barcode').val('').focus();
<% else %>
	$.flash('Produto não encontrado.', true);
	$('#barcode').val("")
	$('#product_id').val('');
	$('#autocomplete_product_in_store').val('');
	$('#unit_price').val('');
	$('#quantity').val('');
	$('#barcode').focus();
<% end %>	

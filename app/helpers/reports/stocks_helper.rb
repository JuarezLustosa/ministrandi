module Reports::StocksHelper
  def sum_quantity_sale_by_product_in(month, product_id)
    Order::Item.sum_quantity_by_order_date_in_a_determinated_product(month, product_id)
  end
  
  def sum_quantity_changed_by_product_in(month, product_id)
    Order::ExchangeItem.sum_quantity_changed_by_date(month, product_id)
  end
end
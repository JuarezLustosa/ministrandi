module Reports::StocksHelper
  def sum_quantity_sale_by_product_in(month, year, product_id)
    Order::Item.sum_quantity_by_order_date_in_a_determinated_product(month, year, product_id)
  end
  
  def sum_quantity_changed_by_product_in(month, year, product_id)
    Order::ExchangeItem.sum_quantity_changed_by_date(month, year, product_id)
  end
  
  def sum_quantity_sale_in_store_by_product(month, year, product_id)
    Cashier::Sale::Item.sum_quantity_by_date_in_a_determinated_product(month, year, product_id)
  end
end
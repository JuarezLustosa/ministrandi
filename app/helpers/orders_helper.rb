module OrdersHelper
  
  def today_or_order_date(order)
    date_translation(order.date || Date.today)
  end
end

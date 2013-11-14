class ChangeStock
  def initialize(stock, entrance, out)
    @stock = stock
    @entrance = entrance.to_i 
    @out =  out.to_i
  end
  
  def change
    add if @entrance.present?
    deduct if @out.present?
  end
  
  def add
    quantity_changed = @stock.quantity + @entrance
    update_stock(quantity_changed)
  end
  
  def deduct
    quantity_changed = @stock.quantity - @out
    update_stock(quantity_changed)
  end
  
  private
  
  def update_stock(quantity)
    @stock.update_attribute(:quantity, quantity)
  end
end
class ChangeStock
  def initialize(item, item_changer)
    @item = item
    @item_changer = item_changer
  end
    
  def add!
    @quantity = @item.quantity + @item_changer
    call_active_record
  end
  
  def deduct!
    @quantity = @item.quantity - @item_changer
    call_active_record
  end
  
  def call_active_record
    begin
      save!
    end  
    @item.errors.present? ? @item : @item_changer
  end

  def save!
    ActiveRecord::Base.transaction do
      @item.update_attribute(:quantity, @quantity) 
    end
  end
end

namespace :correction do
  desc 'Correction total in orders'
  task :total_in_orders => :environment do
    Order.transaction do
      Order.all.each do |order|
        order.save
      end
    end
  end  
end
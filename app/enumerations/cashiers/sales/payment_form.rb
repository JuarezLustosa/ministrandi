class Cashiers::Sales::PaymentForm < EnumerateIt::Base
  associate_values :cash              => 0,
                   :credit_card       => 1
end
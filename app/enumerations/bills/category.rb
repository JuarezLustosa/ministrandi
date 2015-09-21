class Bills::Category < EnumerateIt::Base
  associate_values :CREDITCARD  => 0,
                   :BILLET      => 1,
                   :PROMISSORY  => 2
end
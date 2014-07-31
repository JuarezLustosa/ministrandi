class Orders::Payments < EnumerateIt::Base
  associate_values :money                   => 0,
                   :check                   => 1,
                   :billet                  => 2,
                   :promissory              => 3
end
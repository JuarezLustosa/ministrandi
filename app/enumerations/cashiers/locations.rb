class Cashiers::Locations < EnumerateIt::Base
  associate_values :manufacture        => 0,
                   :store              => 1                   
end
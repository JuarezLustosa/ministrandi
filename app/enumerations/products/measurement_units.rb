class Products::MeasurementUnits < EnumerateIt::Base
  associate_values :KG          => 0,
                   :ML          => 1,
                   :CX          => 2,
                   :UND         => 3,
                   :LT          => 4
end
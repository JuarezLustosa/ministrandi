class Orders::Natures < EnumerateIt::Base
  associate_values :sale        => 0,
                   :bonus       => 1
end
class Orders::Priorities < EnumerateIt::Base
  associate_values :low        => 0,
                   :medium     => 1,
                   :high       => 2
end
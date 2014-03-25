class Orders::Items::CanceledReason < EnumerateIt::Base
  associate_values :stock      => 0,
                   :client     => 1
end
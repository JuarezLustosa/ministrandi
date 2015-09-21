class Bills::Banks < EnumerateIt::Base
  associate_values :BRASIL  	  => 0,
                   :BRADESCO      => 1,
                   :ITAU		  => 2
end
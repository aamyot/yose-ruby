require 'json'

module PrimeResults

  class Valid
    def initialize(input, decomposition)
      @number = input.to_i
      @decomposition = decomposition
    end

    def to_json
      {:number => @number, :decomposition => @decomposition}.to_json
    end
  end

  class NotANumber
    def initialize(input)
      @input = input
    end

    def to_json
      {:number => @input, :error => 'not a number'}.to_json
    end
  end

  class NumberIsTooBig
    def initialize(input)
      @number = input.to_i
    end

    def to_json
      {:number => @number, :error => 'too big number (>1e6)'}.to_json
    end
  end

end

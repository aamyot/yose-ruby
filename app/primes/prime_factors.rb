class PrimeFactors

  def self.of(number)

    return [] if number < 2

    prime = (2..number).find { |candidate| number % candidate == 0 }
    [prime].concat self.of(number /= prime)
  end

end
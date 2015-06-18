require 'contracts'


module Prime
  include Contracts

  Contract And[Num, Nat] => ArrayOf[Pos]
  def self.take_primes(n)
    primes.take(n).to_a
  end

  Contract Num => Bool
  def self.is_prime?(n)
    return true  if n == 2
    return false if is_factor_of? n, 2

    range = (3..Math.sqrt(n)).step 2

    !range.any? {|factor| is_factor_of? n, factor}
  end

  # Should this be contracted?
  # Check it returns a lazy enumerator
  Contract None => Enumerator::Lazy
  def self.primes

    # could use [2] + [3,5..] if there was a way to combine lazy lists
    (2..Float::INFINITY).lazy.select {|x| is_prime? x}
  end

  Contract Num, Num => Bool
  def self.is_factor_of?(n, factor)
    n % factor === 0
  end

end

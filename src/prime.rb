module Prime
  def self.primes
    # could use [2] + [3,5..] if there was a way to combine lazy lists
    # O(n)
    (2..Float::INFINITY).lazy.select {|x| is_prime? x}
  end

  def self.is_prime?(n)
    return true  if n == 2
    return false if is_factor_of? n, 2

    # O(sqrt n) (worst case)
    range = (3..Math.sqrt(n)).step 2

    !range.any? {|factor| is_factor_of? n, factor}
  end

  def self.is_factor_of?(n, factor)
    n % factor === 0
  end
  
  def self.take_primes(n)
    primes.take(n).to_a
  end
end

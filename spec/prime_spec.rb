require "./src/prime"

describe Prime do
  
  describe "#is_prime?" do
    it "should be satisfied when given a prime number" do
      expect(Prime.is_prime? 2).to be true
      expect(Prime.is_prime? 11).to be true

      expect(Prime.is_prime? (-4)).to be false
      expect(Prime.is_prime? 0).to be false
      expect(Prime.is_prime? 4).to be false
      expect(Prime.is_prime? 9).to be false
    end
  end

  describe "#take_primes" do
    it "should return a list of prime numbers" do
      expect(Prime.take_primes 0).to eq []
      expect(Prime.take_primes 5).to eq [2, 3, 5, 7, 11]
    end
  end

end

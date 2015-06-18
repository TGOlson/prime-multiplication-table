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

    # probably not necessary to test contract handling
    # but nice to have some support while implement contracts
    it "should raise an error when passed a non-number value" do
      expect{Prime.is_prime? "a"}.to raise_error ParamContractError
    end
  end

  describe "#take_primes" do
    it "should return a list of prime numbers" do
      expect(Prime.take_primes 0).to eq []
      expect(Prime.take_primes 5).to eq [2, 3, 5, 7, 11]
    end

    it "should raise an error when passed a non positive number" do
      expect{Prime.take_primes (-1)}.to raise_error ParamContractError
    end

    it "should raise an error when passed a non-number value" do
      expect{Prime.take_primes "a"}.to raise_error ParamContractError
    end
  end
  
end

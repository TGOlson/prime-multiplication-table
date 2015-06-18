require "./src/prime"
require "./src/multiplication_table"
require 'contracts'
include Contracts


NUM_PRIMES = 10

Contract None => nil
def main
  puts MultiplicationTable.new(Prime.take_primes NUM_PRIMES)
end

main

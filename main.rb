require "./src/prime"
require "./src/multiplication_table"

NUM_PRIMES = 10

puts MultiplicationTable.new(Prime.take_primes NUM_PRIMES)

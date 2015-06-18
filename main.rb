require "./src/prime"
require "./src/multiplication_table"

NUM_PRIMES = 10

puts MultiplicationTable.make_table_s(Prime.take_primes NUM_PRIMES)

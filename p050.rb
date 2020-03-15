require './libs/prime.rb'

def main
	primes = sieve(1000000)
	max = primes[-1]
	consectives = []

	# (1000000/2).times do |i|
	100.times do |i|
		n = 0
		sum = 0
		len = 0
		while sum < max
			sum += primes[n+i]
			len += 1
			n += 1
			if primes.include?(sum)
				consectives.push([len, sum])
			end
		end
	end
end
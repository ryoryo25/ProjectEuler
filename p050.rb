require './libs/prime.rb'

def main
	primes = sieve(1000000)
	cache = Array.new(1000000, false)
	primes.each do |prime|
		cache[prime] = true
	end
	max = primes[-1]
	primes_size = primes.size
	consectives = []

	# (1000000/2).times do |i|
	1000000.times do |i|
		n = 0
		sum = 0
		len = 0
		while sum < max && n+i < primes_size
			sum += primes[n+i]
			len += 1
			n += 1
			if len > 1 && cache[sum]
				consectives.push([len, sum])
			end
		end
	end
	p consectives.max {|a, b| a[0] <=> b[0] }
end
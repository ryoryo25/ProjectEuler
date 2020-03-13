require './libs/prime.rb'

def main
	primes = sieve(10000000)
	sum = 0

	primes.each do |p|
		if isTruncatable(p)
			puts(p)
			sum += p
		end
	end

	return sum
end

def isTruncatable(n)
	if n == 2 || n == 3 || n == 5 || n == 7
		return false
	end
	
	s = n.to_s
	len = s.length

	1.step(len-1) do |i|
		if !isPrime(s[i..-1].to_i)
			return false
		end

		if !isPrime(s[0..-(i+1)].to_i)
			return false
		end
	end

	return true
end
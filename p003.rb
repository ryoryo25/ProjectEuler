require 'benchmark'


def main
	n = 600851475143
	ans = 0
	
	result = Benchmark.realtime do
		# # need until sqrt(n)
		# primes = sieve1(Math.sqrt(n).to_i)

		# primes.each do |i|
		# 	if n % i == 0
		# 		ans = i
		# 	end
		# end
		largestPrimeFactorImproved
	end
	
	puts ans
	puts("処理概要 #{result}s")
end

# for get primes, slightly fast compared with version 2 (0.11475s)
def sieve1(n)
	primes = []
	a = Array.new(n, true)
	2.step(Math.sqrt(n).to_i) do |i|
		if a[i]
			primes.push(i)
			
			i.step(n-1, i) do |k|
				a[k] = false
			end
		end
	end

	Math.sqrt(n).to_i.step(n-1) do |i|
		if a[i]
			primes.push(i)
		end
	end

	return primes
end

# for get primes (0.14479s)
def sieve2(n)
	primes = []
	a = Array.new(n, true)
	2.step(n-1) do |i|
		if a[i]
			primes.push(i)
			
			i.step(n-1, i) do |k|
				a[k] = false
			end
		end
	end

	return primes
end

#shown in answer, very fast (0.00022s)
def largestPrimeFactor
	n = 600851475143
	factor = 2
	lastFactor = 1

	while n > 1
		if n % factor == 0
			lastFactor = factor
			n /= factor
			while n % factor == 0
				n /= factor
			end
		end

		factor += 1
	end

	puts(lastFactor)
end

# fucking fast (0.000084295s)
def largestPrimeFactorImproved
	n = 600851475143
	factor = 3
	lastFactor = 1

	if n % 2 == 0
		lastFactor = 2
		n /= 2
		while n % 2 == 0
			n /= 2
		end
	end

	maxFactor = Math.sqrt(n)
	while n > 1 && factor <= maxFactor
		if n % factor == 0
			n /= factor
			lastFactor = factor
			while n % factor == 0
				n /= factor
			end
			maxFactor = Math.sqrt(n) # update max
		end

		factor += 2
	end

	if n == 1
		puts(lastFactor)
	else
		puts(n)
	end
end


# def generatePrimes(n)
# 	primes = []
	
# 	(2..n).each do |i|
# 		if isPrime(i)
# 			primes.push(i)
# 		end
# 	end
	
# 	return primes
# end

# def isPrime(n)
# 	if n <= 1
# 		return false
# 	end
	
# 	up = Math.sqrt(n).to_i
# 	(2..up).each do |i|
# 		if n % i == 0
# 			return false
# 		end
# 	end
	
# 	return true
# end

# #-----------------------------------------

# def main2
# 	n = 600851475143
# 	ans = 0
	
# 	result = Benchmark.realtime do
# 		ans = (generatePrimes2(generateDivisors(n)))[-1]
# 	end
	
# 	puts ans
# 	puts("処理概要 #{result}s")
# end

# def generateDivisors(n)
# 	divisors = []
# 	(2..n).each do |i|
# 		if n % i == 0
# 			divisors.push(i)
# 			puts i
# 		end
# 	end
	
# 	return divisors
# end

# def generatePrimes2(d)
# 	primes = []
# 	d.each do |i|
# 		if isPrime(i)
# 			primes.push(i)
# 			puts i
# 		end
# 	end
	
# 	return primes
# end

require 'benchmark'

def main
	n = 600851475143
	ans = 0
	
	result = Benchmark.realtime do
		generatePrimes(n).each do |i|
			if n % i == 0
				ans = i
			end
		end
	end
	
	puts ans
	puts("処理概要 #{result}s")
end

def generatePrimes(n)
	primes = []
	
	(2..n).each do |i|
		if isPrime(i)
			primes.push(i)
		end
	end
	
	return primes
end

def isPrime(n)
	if n <= 1
		return false
	end
	
	up = Math.sqrt(n).to_i
	(2..up).each do |i|
		if n % i == 0
			return false
		end
	end
	
	return true
end

#-----------------------------------------

def main2
	n = 600851475143
	ans = 0
	
	result = Benchmark.realtime do
		ans = (generatePrimes2(generateDivisors(n)))[-1]
	end
	
	puts ans
	puts("処理概要 #{result}s")
end

def generateDivisors(n)
	divisors = []
	(2..n).each do |i|
		if n % i == 0
			divisors.push(i)
			puts i
		end
	end
	
	return divisors
end

def generatePrimes2(d)
	primes = []
	d.each do |i|
		if isPrime(i)
			primes.push(i)
			puts i
		end
	end
	
	return primes
end

def isPrime(n)
	if n <= 1
		return false
	end
	if n == 2
		return true
	end
	if n % 2 == 0
		return false
	end
	
	up = Math.sqrt(n).to_i
	3.step(up, 2) do |i|
		if n % i == 0
			return false
		end
	end
	
	return true
end

# get all primes < n
def sieve(n)
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

def primeFactors(n)
	factors = []
	factor = 3

	if n % 2 == 0
		n /= 2
		factors.push(2)
		while n % 2 == 0
			n /= 2
		end
	end

	maxFactor = Math.sqrt(n)
	while n > 1 && factor <= maxFactor
		if n % factor == 0
			n /= factor
			factors.push(factor)
			while n % factor == 0
				n /= factor
			end
			maxFactor = Math.sqrt(n) # update max
		end

		factor += 2
	end

	if n != 1
		factors.push(n)
	end

	return factors
end

# 1 ... n
def getAllFactors(n)
	factors = [1]
	2.step(Math.sqrt(n).to_i) do |i|
		if n % i == 0
			factors.push(i)
			if n / i != i
				factors.push(n/i)
			end
		end
	end
	factors.push(n)

	return factors.sort
end
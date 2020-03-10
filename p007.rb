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

# Display all primes less than n.
def findPrime
	i = 2
	primes = []
	while primes.length < 10001
		if isPrime(i)
			primes.push(i)
		end
		i += 1
	end
	
	return primes[-1]
end

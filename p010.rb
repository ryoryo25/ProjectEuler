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
def addPrimes
	ans = 0
	(2..2000000).each do |i|
		if isPrime(i)
			ans += i
		end
	end

	return ans
end

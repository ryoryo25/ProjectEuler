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
require "./libs/prime"

def main
	primes = sieve(10000)
	n = 9
	while true
		if !isPrime(n)
			i = 0
			flag = false
			while primes[i] < n
				flag = flag || isTwiceSquare(n-primes[i])
				i += 1
			end

			if !flag
				return n
			end
		end
		n += 2
	end
end

def isTwiceSquare(n)
	i = 1
	while 2 * i * i < n
		i += 1
	end

	return 2 * i * i == n
end
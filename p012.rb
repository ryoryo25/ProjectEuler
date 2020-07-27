$divs = [0]

# References:
# https://freak-da.hatenablog.com/entry/20100729/p1
# https://math.nakaken88.com/textbook/cp-prime-factorization-and-number-of-divisors/

def main
	n = 1
	loop do
		factors = 0
		if n % 2 == 0
			factors = divisors(n/2) * divisors(n+1)
		else
			factors = divisors(n) * divisors((n+1)/2)
		end

		$divs[trinum(n)] = factors

		if factors > 500
			break
		end

		n += 1
	end

	puts(trinum(n))
end

def divisors(n)
	if $divs[n] != nil
		return $divs[n]
	end

	div = 1

	# count 2
	count = 1
	while n % 2 == 0
		count += 1
		n /= 2
	end
	div *= count

	# count odd numbers
	i = 3
	while i <= Math.sqrt(n)
		count = 1
		while n % i == 0
			count += 1
			n /= i
		end
		div *= count
		if n == 1
			break
		end
		i += 2
	end

	if n != 1
		div *= 2
	end

	return div
end

def trinum(n)
	return n * (n+1) / 2
end

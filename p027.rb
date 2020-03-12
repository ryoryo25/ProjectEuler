# if b < 0 or b isn't prime, it is not solution unconditionally
def main
	max_len = 0
	max_prod = 0
	max_a = 0
	max_b = 0
	1.step(1000) do |a|
		1.step(1000) do |b|
			if isPrime(b)
				ab = primeQuadratic(a, b)
				if max_len < ab
					max_len = ab
					max_prod = a * b
					max_a = -a
					max_b = b
				end

				negab = primeQuadratic(-a, b)
				if max_len < negab
					max_len = negab
					max_prod = -a * b
					max_a = -a
					max_b = b
				end
			end
		end
	end

	puts("len: " + max_len.to_s)
	puts("prod: " + max_prod.to_s)
	puts("a: " + max_a.to_s)
	puts("b: " + max_b.to_s)
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

def primeQuadratic(a, b)
	n = 1 # 0^2 + a*0 + b is already checked
	while isPrime(n**2 + a * n + b)
		n += 1
	end

	return n + 1
end
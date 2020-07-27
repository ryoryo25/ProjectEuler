$amicable = [0]

# Reference
# https://www.mathblog.dk/project-euler-21-sum-of-amicable-pairs/

def main
	upper = 10000
	sum = 0
	amicables = []

	2.step(upper) do |a|
		b = d(a) # sum_a = b
		if b > a && b <= upper # b < a: the b has already checked, a == b: not allowed
			sum_b = d(b)
			if sum_b == a
				sum += a + b
			end
		end
	end

	puts(sum)
end

def d(n)
	if $amicable[n] != nil
		return $amicable[n]
	end

	sum = 0
	(n-1).times do |i|
		if n % (i+1) == 0
			sum += i+1
		end
	end
	$amicable[n] = sum

	return sum
end
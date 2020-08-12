# Reference
# https://tasusu.hatenablog.com/entry/20110819/1313770567

def main
	max = 28123
	abundants = []
	1.step(max) do |i|
		if isAbundant(i+1)
			abundants.push(i+1)
		end
	end

	p abundants

	cache = Array.new(max+1, false)
	abundants.each do |x|
		cache[x] = true
	end

	sum = 395465626 # Sum[0,28123](n) = 395465626
	1.step(max) do |i|
	# 1.step(100) do |i|
		if canBeSum(i, abundants, cache)
			sum -= i
		end
	end
	
	puts sum

end

# abundants[i] + abundants[j] = n
# abundants[j] = n - abundants[i] > 0
def canBeSum(n, array, cache)
	i = 0
	while array[i] <= n / 2
		if cache[n-array[i]] # array.include?(n-array[i]) is OK, but very slow
			return true
		end

		i += 1
	end

	return false
end

def isAbundant(n)
	sum = 0
	2.step(Math.sqrt(n).to_i) do |i|
		if n % i == 0
			sum += i
			if n / i != i # n / i == i means n is square number
				sum += n/i # n = i * (n / i)
			end
		end
	end

	return sum > n
end
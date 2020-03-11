def main
	sum = 0
	amicables = []

	10000.times do |a|
		10000.times do |b|
			if isAmicable(a, b) && !(amicables.include?([a, b]) || amicables.include?([a, b]))
				amicables.push([a, b])
				sum += a + b
			end
		end
	end

	puts(sum)
end

def isAmicable(a, b)
	if a == b
		return false
	else
		return d(a) == d(b)
	end
end

def d(n)
	sum = 0
	(n-1).times do |i|
		if n % (i+1) == 0
			sum += i+1
		end
	end

	return sum
end
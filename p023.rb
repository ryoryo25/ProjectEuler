def main
	abundants = []
	28123.times do |i|
		if isAbundant(i+1)
			abundants.push(i+1)
		end
	end

	sum = 0
	28123.times do |i|
		
	end
end

def canBeSum(n, a)

end

def isAbundant(n)
	sum = 0
	(n-1).times do |i|
		if n % (i+1) == 0
			sum += i+1
	end

	return sum > n
end
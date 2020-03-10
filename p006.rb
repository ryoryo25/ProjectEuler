def difference
	sum = 0
	sqr = 0
	
	100.times do |i|
		sum += (i + 1) ** 2
		sqr += i + 1
	end
	
	return (sqr ** 2) - sum
end

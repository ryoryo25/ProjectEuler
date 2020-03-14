def main
	pnums = Array.new(10**5) {|i| p(i+1) }

	min = 0
	(10**5 - 1).times do |i|
		sum = pnums[i]+pnums[i+1]
		dif = (pnums[i]-pnums[i+1]).abs

		if pnums.include?(sum) && pnums.include?(dif)
			if min == 0 || min > dif
				min = dif
			end
		end
	end
	# (10**4 - 2).times do |i|
	# 	sum = pnums[i]+pnums[i+2]
	# 	dif = (pnums[i]-pnums[i+2]).abs

	# 	if pnums.include?(sum) && pnums.include?(dif)
	# 		if min == 0 || min > dif
	# 			min = dif
	# 		end
	# 	end
	# end
	# (10**4 - 3).times do |i|
	# 	sum = pnums[i]+pnums[i+3]
	# 	dif = (pnums[i]-pnums[i+3]).abs

	# 	if pnums.include?(sum) && pnums.include?(dif)
	# 		if min == 0 || min > dif
	# 			min = dif
	# 		end
	# 	end
	# end

	return min
end

def p(n)
	return n * (3*n - 1) / 2
end
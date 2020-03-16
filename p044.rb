def main
	min = 0
	n = 1
	while true
		10.times do |i|
			sum = p(n+i+1) + p(n)
			dif = p(n+i+1) - p(n)
			if isP(sum) && isP(dif)
				return dif
			end
		end

		if n > 10000000
			return "end"
		end
		
		n += 1
	end

	return min
end

def p(n)
	return n * (3*n - 1) / 2
end

def isP(pn)
	n = (Math.sqrt(24*pn+1)+1) / 6
	return n == n.to_i.to_f
end
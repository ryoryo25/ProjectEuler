def main
	j = 1
	while true
		k = 1
		while k < j
			dif = (p(j) - p(k)).abs
			if isP(dif)
				sum = p(j) + p(k)
				if isP(sum)
					return dif
				end
			end
			k += 1
		end
		j += 1
	end
end

def p(n)
	return n * (3*n - 1) / 2
end

def isP(pn)
	n = (Math.sqrt(24*pn+1)+1) / 6
	return n == n.to_i.to_f
end
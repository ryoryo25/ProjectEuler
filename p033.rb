def main
	cancels = [1, 1]
	11.step(99) do |den|
		if den % 10 == 0
			next
		end

		11.step(den-1) do |num|
			if num % 10 == 0
				next
			end
			if containSameDigit(num, den)
				cancel = cancelDigit(num, den)
				if num.to_f / den == cancel[0].to_f / cancel[1]
					puts "#{num} / #{den}"
					puts "= #{cancel[0]} / #{cancel[1]}"
					cancels[0] *= cancel[0]
					cancels[1] *= cancel[1]
				end
			end
		end
	end

	puts cancels[1] / gcd(cancels[0], cancels[1])
end

def containSameDigit(n, m)
	contain = false
	n.to_s.each_char do |nc|
		m.to_s.each_char do |mc|
			contain = contain || (nc == mc)
		end
	end

	return contain
end

def cancelDigit(num, den)
	same = ""
	num.to_s.each_char do |nc|
		den.to_s.each_char do |mc|
			if nc == mc
				same = nc.to_s
			end
		end
	end

	if same == "0"
		return [nil, nil]
	else
		num = (num.to_s[0] != same) ? num.to_s[0].to_i : num.to_s[1].to_i
		den = (den.to_s[0] != same) ? den.to_s[0].to_i : den.to_s[1].to_i
		return [num, den.to_i]
	end
end

def gcd(a, b)
	if a % b == 0
		return b
	else
		return gcd(b, a % b)
	end
end
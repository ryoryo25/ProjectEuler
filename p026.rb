def main
	max_len = 0
	max = 0
	1.step(1000-1) do |i|
		len = lenCycle(i)
		if max_len < len
			max_len = len
			max = i
		end
	end

	puts(max)
end

def lenCycle(n)
	appeared_digits = []
	s = format("%.1000f", 1.0/n)

	s[2..-1].each_char do |c|
		d = c.to_i
		# p appeared_digits
		if d != 0 && appeared_digits.include?(d)
			start = appeared_digits.index(d)
			return appeared_digits[start..-1].length
		else
			appeared_digits.push(d)
		end
	end

	return 0
end
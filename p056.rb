def main
	max = 0
	1.step(100-1) do |a|
		1.step(100-1) do |b|
			p = a**b
			sum = 0
			p.to_s.each_char do |c|
				sum += c.to_i
			end

			if max < sum
				max = sum
			end
		end
	end

	return max
end
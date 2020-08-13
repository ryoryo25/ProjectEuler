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

# 1 / n = (10 / n) / 10
# simulate operation of 筆算
def lenCycle(n)
	dividen = 1
	divisor = n
	appeared_dividen = []
	len = 0

	while !appeared_dividen.include?(dividen)
		appeared_dividen.push(dividen)
		dividen *= 10
		dividen = dividen % divisor
	end

	if dividen != 0
		len = appeared_dividen.size-appeared_dividen.find_index(dividen)
	end

	return len
end
def main
	sum = 1 # already added 1
	len = 3 # spiral width
	here = 1 # where focus on

	while len <= 1001 # while width <= 1001
		4.times do
			here += len - 2
			here += 1
			sum += here
		end

		len += 2 # widen width
	end

	return sum
end
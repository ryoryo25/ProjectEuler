$cache = Array.new(10000000, nil)

def main
	count = 0
	1.step(9999999) do |i|
	# 1.step(99999) do |i|
		if arrive_89(i)
			count += 1
			$cache[i] = true
		else
			$cache[i] = false
		end
	end

	return count
end

def arrive_89(n)
	while n != 89 && n != 1 && $cache[n] == nil do
		n = sq_digit_sum(n)
	end

	return n == 89 || $cache[n]
end

def sq_digit_sum(n)
	sum = 0
	n.to_s.each_char do |c|
		sum += c.to_i ** 2
	end

	return sum
end
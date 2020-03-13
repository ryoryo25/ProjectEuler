# a + b + c = p
# a^2 + b^2 = c^2
# a^2 + b^2 = (p-(a+b))^2

def main
	max_count = 0
	max_p = 0
	1.step(1000) do |p|
		count = 0
		1.step(p) do |a|
			(a+1).step(p) do |b|
				if isRightTriangle(a, b, p-a-b)
					count += 1
				end
			end
		end

		if max_count < count
			max_count = count
			max_p = p
		end
	end

	return max_p
end

def isRightTriangle(a, b, c)
	return a**2 + b**2 == c**2
end
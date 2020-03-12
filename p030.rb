def main
	# n = 10
	sum = 0
	10.step(10000000) do |n|
		sumdigits = sumDigitFifth(n)
		if n == sumdigits
			sum += n
			puts(n)
		elsif n < sumdigits
			puts(n.to_s + " < " + sumdigits.to_s)
		end
	end
	# 	sumdigits = sumDigitFifth(n)
	# 	if n == sumdigits
	# 		sum += n
	# 	elsif n < sumdigits
	# 		break
	# 	end
	# 	n += 1
	# end

	puts("")
	puts(sum)
end

def sumDigitFifth(n)
	sum = 0
	n.to_s.each_char do |c|
		sum += c.to_i ** 5
	end

	return sum
end